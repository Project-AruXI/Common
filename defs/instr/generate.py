#!/home/aruel/.local/bin/python3.14
"""
Aru32 opcode code generator — template-driven edition.
See README.md for full placeholder syntax documentation.

Usage:
  python3 scripts/generate.py               # all targets
  python3 scripts/generate.py --target c    # one target
  python3 scripts/generate.py --check       # validate only, no output
"""

import json, re, sys, argparse
from pathlib import Path
from datetime import date

ROOT = Path(__file__).parent
SRC = ROOT / "opcodes.json"
TARGETS = ROOT / "targets.json"
TMPL_DIR = ROOT / "templates"
OUT_DIR = Path(__file__).parent.parent

# ── Loading ───────────────────────────────────────────────────────────────────

def loadOpcodes():
  with open(SRC) as f:
    raw = json.load(f)
  meta = raw["_meta"]
  aliases = raw.get("aliases", {})
  opcodes = {}
  for name, entry in raw["opcodes"].items():
    if name.startswith("_"): continue
  
    opcodes[name] = {
      "name": name,
      "mnemonic": entry.get("mnemonic", name),
      "value": int(entry["value"], 16),
      "category": entry["category"],
      "description": entry["description"],
      "variant": entry.get("variant", ""),
      "pair": entry.get("pair", ""),
      "sub_opcodes": _parseSubs(name, entry.get("sub_opcodes", {})),
    }

  return meta, opcodes, aliases

def _parseSubs(parent, raw):
  result = {}
  for name, entry in raw.items():
    if name.startswith("_"): continue
  
    result[name] = {
      "name": name, "value": int(entry["value"], 16),
      "description": entry["description"], "parent_name": parent,
    }

  return result

def loadTargets():
  with open(TARGETS) as f:
    return json.load(f)["targets"]

# ── Validation ────────────────────────────────────────────────────────────────

def validate(opcodes):
  errors = []
  seen = {}
  for name, e in opcodes.items():
    v = e["value"]
    if v in seen: errors.append(f"  COLLISION: 0x{v:02X} — '{seen[v]}' and '{name}'")
  
    seen[v] = name
    if not (0x00 <= v <= 0xFF): errors.append(f"  OUT OF RANGE: '{name}' = 0x{v:02X}")

  for name, e in opcodes.items():
    pk, variant = e["pair"], e["variant"]
    if not pk and not variant: continue

    if pk and pk not in opcodes:
      errors.append(f"  MISSING PAIR: '{name}' references '{pk}' which does not exist")
      continue

    if pk:
      partner = opcodes[pk]
      vs, vp  = e["value"], partner["value"]
      if variant not in ("I", "R"):
        errors.append(f"  BAD VARIANT: '{name}' has variant '{variant}', must be 'I' or 'R'")
      if variant == "I" and (vs & 1) != 0:
        errors.append(f"  PAIR ENCODING: '{name}' is I-variant but 0x{vs:02X} is odd (must be even)")
      if variant == "R" and (vs & 1) != 1:
        errors.append(f"  PAIR ENCODING: '{name}' is R-variant but 0x{vs:02X} is even (must be odd)")
      if (vs ^ vp) != 1:
        errors.append(f"  PAIR NOT SEQUENTIAL: '{name}'(0x{vs:02X}) and '{pk}'(0x{vp:02X}) must differ only in bit 0")
      if partner["pair"] != name:
        errors.append(f"  PAIR NOT MUTUAL: '{name}'->'{pk}' but '{pk}'->'{partner['pair']}'")
      if e["mnemonic"] != partner["mnemonic"]:
        errors.append(f"  MNEMONIC MISMATCH: pair '{name}'/'{pk}' — '{e['mnemonic']}' vs '{partner['mnemonic']}'")

  for opname, oe in opcodes.items():
    subSeen = {}
    for sname, se in oe["sub_opcodes"].items():
      sv = se["value"]
      if sv in subSeen:
        errors.append(f"  SUB COLLISION in '{opname}': 0x{sv:02X} — '{subSeen[sv]}' and '{sname}'")
      subSeen[sv] = sname
  return errors

# ── Template engine ───────────────────────────────────────────────────────────

def upper(s): return s.upper()
def pascal(s): return "".join(p.capitalize() for p in re.split(r"[_\-\.]", s))

def entryVars(name, value, mnemonic, description, extra=None):
  v = {
    "name": name, "NAME_UPPER": upper(name), "name_lower": name.lower(),
    "NamePascal": pascal(name), "mnemonic": mnemonic, "MNEMONIC": upper(mnemonic),
    "VALUE_HEX": f"{value:02X}", "value_dec": str(value), "description": description,
  }
  if extra: v.update(extra)
  return v

def applyVars(text, d):
  # Handle {{#key}}...{{/key}} conditional blocks — render if value is truthy
  def condRep(m):
    key, inner = m.group(1), m.group(2)
    val = str(d.get(key, ""))
    return applyVars(inner, d) if val and val not in ("false", "0", "") else ""
  text = re.sub(r"\{\{#(\w+)\}\}(.*?)\{\{/\1\}\}", condRep, text, flags=re.DOTALL)
  # Handle scalar substitution
  def rep(m):
    key, width = m.group(1), m.group(2)
    if key not in d: return m.group(0)
    val = str(d[key])
    return val.ljust(int(width)) if width else val
  return re.sub(r"\{\{(\w+)(?:\|<(\d+))?\}\}", rep, text)

def renderBlock(tmpl, items):
  return "".join(applyVars(tmpl, v) for v in items)

def opVars(name, e):
  return entryVars(name, e["value"], e["mnemonic"], e["description"], {
    "category": e["category"], "variant": e["variant"],
    "pair": e["pair"], "is_paired": "true" if e["pair"] else "false",
  })

def render(template, meta, opcodes, aliases):
  text = template
  by_value = sorted(opcodes.items(), key=lambda x: x[1]["value"])

  def sub(pattern, fn):
    nonlocal text
    text = re.sub(pattern, fn, text, flags=re.DOTALL)

  sub(r"\{\{#opcodes\}\}(.*?)\{\{/opcodes\}\}", lambda m: renderBlock(m.group(1), [opVars(n, e) for n, e in by_value]))

  sub(r"\{\{#paired_opcodes\}\}(.*?)\{\{/paired_opcodes\}\}", lambda m: renderBlock(m.group(1), [opVars(n, e) for n, e in by_value if e["pair"]]))

  sub(r"\{\{#unpaired_opcodes\}\}(.*?)\{\{/unpaired_opcodes\}\}", lambda m: renderBlock(m.group(1), [opVars(n, e) for n, e in by_value if not e["pair"]]))

  def flatSubs(m):
    items = []
    for opname, oe in by_value:
      for sname, se in sorted(oe["sub_opcodes"].items(), key=lambda x: x[1]["value"]):
        items.append(entryVars(sname, se["value"], sname, se["description"], {
          "parent_name": opname, "PARENT_UPPER": upper(opname), "ParentPascal": pascal(opname),
        }))
      return renderBlock(m.group(1), items)
  sub(r"\{\{#sub_opcodes\}\}(.*?)\{\{/sub_opcodes\}\}", flatSubs)

  def nestedSubs(m):
    parts = []
    for opname, oe in by_value:
      if not oe["sub_opcodes"]: continue
      pv = {"parent_name": opname, "PARENT_UPPER": upper(opname), "ParentPascal": pascal(opname)}
      inner = m.group(1)
      em = re.search(r"\{\{#entries\}\}(.*?)\{\{/entries\}\}", inner, re.DOTALL)
      if em:
        evars = [dict(entryVars(sn, se["value"], sn, se["description"]), **pv) for sn, se in sorted(oe["sub_opcodes"].items(), key=lambda x: x[1]["value"])]
        inner = inner[:em.start()] + renderBlock(em.group(1), evars) + inner[em.end():]
      parts.append(applyVars(inner, pv))
    return "".join(parts)
  sub(r"\{\{#sub_opcode_parents\}\}(.*?)\{\{/sub_opcode_parents\}\}", nestedSubs)

  def aliasBlock(m):
    items = []
    for aname, ae in sorted(aliases.items()):
      target = opcodes.get(ae["alias_of"], {})
      items.append(entryVars(aname, target.get("value", 0), aname, ae["description"], {
        "alias_of": ae["alias_of"], "ALIAS_UPPER": upper(ae["alias_of"]),
      }))
    return renderBlock(m.group(1), items)
  sub(r"\{\{#aliases\}\}(.*?)\{\{/aliases\}\}", aliasBlock)

  # Scalar meta last
  scalars = {k: str(v) for k, v in meta.items() if not k.startswith("_")}
  scalars["date"] = date.today().isoformat()
  return applyVars(text, scalars)


def main():
  parser = argparse.ArgumentParser(description="Aru32 opcode generator")
  parser.add_argument("--check",  action="store_true")
  parser.add_argument("--target", metavar="NAME")
  args = parser.parse_args()

  meta, opcodes, aliases = loadOpcodes()
  errors = validate(opcodes)
  if errors:
    print("Validation FAILED:")
    for e in errors: print(e)
    sys.exit(1)

  pairs = sum(1 for e in opcodes.values() if e["pair"] and e["variant"] == "I")
  subCount = sum(len(e["sub_opcodes"]) for e in opcodes.values())
  print(f"Validation OK — {len(opcodes)} opcodes ({pairs} I/R pairs), "
        f"{subCount} sub-opcodes, {len(aliases)} aliases.")

  if args.check: sys.exit(0)

  allTargets = loadTargets()
  targets = {args.target: allTargets[args.target]} if args.target else allTargets
  OUT_DIR.mkdir(exist_ok=True)

  for lang, cfg in targets.items():
    tmplPath = TMPL_DIR / cfg["template"]
    if not tmplPath.exists():
      print(f"  SKIP {lang}: '{cfg['template']}' not found")
      continue
    content = render(tmplPath.read_text(), meta, opcodes, aliases)
    outPath = OUT_DIR / cfg["output"]
    outPath.write_text(content)
    print(f"  wrote {outPath}  ({lang})")

if __name__ == "__main__":
  main()
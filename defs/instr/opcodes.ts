// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-03-20
// To update: edit opcodes.json then run scripts/generate.py

export const ARU_WORD_SIZE     = 32;
export const ARU_OPCODE_BITS   = 8;
export const ARU_INT_REGISTERS = 16;
export const ARU_FP_REGISTERS  = 16;
export const ARU_VEC_REGISTERS = 6;

// ── Opcodes ───────────────────────────────────────────────────────────────────
// I/R pairs share a mnemonic. I-variant opcode is even, R-variant is odd.
export const enum Opcode {

  // extend
  SXB                    = 0x04,  // sxb — Sign-extend byte to word

  // extend
  SXH                    = 0x05,  // sxh — Sign-extend halfword to word

  // extend
  UXB                    = 0x06,  // uxb — Zero-extend byte to word

  // extend
  UXH                    = 0x07,  // uxh — Zero-extend halfword to word

  // integer_memory
  LD                     = 0x14,  // ld — Load word

  // integer_memory
  STR                    = 0x1C,  // str — Store word

  // fp
  FADD                   = 0x20,  // fadd — FP add

  // fp
  FSUB                   = 0x21,  // fsub — FP subtract

  // fp
  FMUL                   = 0x22,  // fmul — FP multiply

  // fp
  FDIV                   = 0x23,  // fdiv — FP divide

  // fp
  FSQRT                  = 0x24,  // fsqrt — FP square root

  // fp
  FMADD                  = 0x25,  // fmadd — FP fused multiply-add: fd = fs1*fs2 + fs3

  // fp
  FMSUB                  = 0x26,  // fmsub — FP fused multiply-subtract: fd = fs1*fs2 - fs3

  // fp
  FNMADD                 = 0x27,  // fnmadd — FP negated fused multiply-add: fd = -(fs1*fs2 + fs3)

  // fp
  FNMSUB                 = 0x28,  // fnmsub — FP negated fused multiply-subtract

  // fp
  FMIN                   = 0x29,  // fmin — FP minimum

  // fp
  FMAX                   = 0x2A,  // fmax — FP maximum

  // fp
  FABS                   = 0x2B,  // fabs — FP absolute value

  // fp
  FNEG                   = 0x2C,  // fneg — FP negate

  // fp
  FCLASS                 = 0x2D,  // fclass — FP classify — result bitmask to int reg

  // fp
  FEQ                    = 0x2E,  // feq — FP equal — result 0/1 to int reg

  // fp
  FLT                    = 0x2F,  // flt — FP less-than — result 0/1 to int reg

  // fp
  FLE                    = 0x30,  // fle — FP less-than-or-equal — result 0/1 to int reg

  // fp
  FMV                    = 0x31,  // fmv — FP register copy

  // fp
  FMV_X_S                = 0x32,  // fmv.x.s — FP to int reg — bit-pattern, no conversion

  // fp
  FMV_S_X                = 0x33,  // fmv.s.x — Int reg to FP — bit-pattern, no conversion

  // integer_memory
  LDB                    = 0x34,  // ldb — Load byte

  // fp_memory
  FLW                    = 0x35,  // flw — FP load word

  // fp_memory
  FSW                    = 0x36,  // fsw — FP store word

  // fp_convert
  FCVT_W_S               = 0x37,  // fcvt.w.s — FP to signed int32

  // fp_convert
  FCVT_WU_S              = 0x38,  // fcvt.wu.s — FP to unsigned int32

  // fp_convert
  FCVT_S_W               = 0x39,  // fcvt.s.w — Signed int32 to FP

  // fp_convert
  FCVT_S_WU              = 0x3A,  // fcvt.s.wu — Unsigned int32 to FP

  // fp_system
  FCSRR                  = 0x3B,  // fcsrr — Read FCSR to int reg

  // integer_memory
  STRB                   = 0x3C,  // strb — Store byte

  // fp_system
  FCSRW                  = 0x3D,  // fcsrw — Write int reg to FCSR

  // fp_system
  FCSRS                  = 0x3E,  // fcsrs — Swap int reg with FCSR

  // integer_manipulation
  OR_I                   = 0x40,  // or [I] — OR immediate

  // integer_manipulation
  OR_R                   = 0x41,  // or [R] — OR register

  // integer_manipulation
  AND_I                  = 0x42,  // and [I] — AND immediate

  // integer_manipulation
  AND_R                  = 0x43,  // and [R] — AND register

  // integer_manipulation
  XOR_I                  = 0x44,  // xor [I] — XOR immediate

  // integer_manipulation
  XOR_R                  = 0x45,  // xor [R] — XOR register

  // integer_manipulation
  NOT_I                  = 0x46,  // not [I] — NOT immediate

  // integer_manipulation
  NOT_R                  = 0x47,  // not [R] — NOT register

  // integer_manipulation
  LSL_I                  = 0x48,  // lsl [I] — Logical shift left immediate

  // integer_manipulation
  LSL_R                  = 0x49,  // lsl [R] — Logical shift left register

  // integer_manipulation
  LSR_I                  = 0x4A,  // lsr [I] — Logical shift right immediate

  // integer_manipulation
  LSR_R                  = 0x4B,  // lsr [R] — Logical shift right register

  // integer_manipulation
  ASR_I                  = 0x4C,  // asr [I] — Arithmetic shift right immediate

  // integer_manipulation
  ASR_R                  = 0x4D,  // asr [R] — Arithmetic shift right register

  // integer_memory
  LDBS                   = 0x54,  // ldbs — Load byte signed

  // integer_memory
  STRH                   = 0x5C,  // strh — Store halfword

  // avext
  VADD                   = 0x60,  // vadd — Vector element-wise add

  // avext
  VSUB                   = 0x61,  // vsub — Vector element-wise subtract

  // avext
  VMUL                   = 0x62,  // vmul — Vector element-wise multiply

  // avext
  VDIV                   = 0x63,  // vdiv — Vector element-wise divide

  // avext
  VFMA                   = 0x64,  // vfma — Vector fused multiply-add

  // avext
  VAND                   = 0x65,  // vand — Vector bitwise AND

  // avext
  VOR                    = 0x66,  // vor — Vector bitwise OR

  // avext
  VXOR                   = 0x67,  // vxor — Vector bitwise XOR

  // avext
  VNOT                   = 0x68,  // vnot — Vector bitwise NOT

  // avext
  VLD                    = 0x69,  // vld — Vector load (512-bit)

  // avext
  VST                    = 0x6A,  // vst — Vector store (512-bit)

  // avext
  VMOV                   = 0x6B,  // vmov — Vector register copy

  // avext
  VBROADCAST             = 0x6C,  // vbroadcast — Broadcast scalar to all lanes

  // avext
  VEXTRACT               = 0x6D,  // vextract — Extract lane to int register

  // avext
  VINSERT                = 0x6E,  // vinsert — Insert int register into lane

  // avext
  VCMP                   = 0x6F,  // vcmp — Vector compare, result mask to int reg

  // avext
  VREDSUM                = 0x70,  // vredsum — Vector horizontal sum reduction

  // avext
  VREDMAX                = 0x71,  // vredmax — Vector horizontal max reduction

  // avext
  VREDMIN                = 0x72,  // vredmin — Vector horizontal min reduction

  // avext
  VLSL                   = 0x73,  // vlsl — Vector logical shift left

  // integer_memory
  LDBZ                   = 0x74,  // ldbz — Load byte zero-extended

  // avext
  VLSR                   = 0x75,  // vlsr — Vector logical shift right

  // avext
  VASR                   = 0x76,  // vasr — Vector arithmetic shift right

  // avext
  VSPLAT                 = 0x77,  // vsplat — Splat immediate into all lanes

  // integer_arithmetic
  ADD_I                  = 0x80,  // add [I] — Add immediate

  // integer_arithmetic
  ADD_R                  = 0x81,  // add [R] — Add register

  // integer_manipulation
  MV_I                   = 0x84,  // mv [I] — Move immediate

  // integer_manipulation
  MV_R                   = 0x85,  // mv [R] — Move register

  // integer_arithmetic
  ADDS_I                 = 0x88,  // adds [I] — Add signed immediate

  // integer_arithmetic
  ADDS_R                 = 0x89,  // adds [R] — Add signed register

  // integer_arithmetic
  SUB_I                  = 0x90,  // sub [I] — Subtract immediate

  // integer_arithmetic
  SUB_R                  = 0x91,  // sub [R] — Subtract register

  // integer_memory
  LDH                    = 0x94,  // ldh — Load halfword

  // integer_arithmetic
  SUBS_I                 = 0x98,  // subs [I] — Subtract signed immediate

  // integer_arithmetic
  SUBS_R                 = 0x99,  // subs [R] — Subtract signed register

  // integer_arithmetic
  MUL                    = 0xA0,  // mul — Multiply unsigned (R-only, no I variant)

  // integer_arithmetic
  SMUL                   = 0xA2,  // smul — Multiply signed (R-only, no I variant)

  // integer_arithmetic
  DIV                    = 0xA8,  // div — Divide unsigned (R-only, no I variant)

  // integer_arithmetic
  SDIV                   = 0xAA,  // sdiv — Divide signed (R-only, no I variant)

  // integer_memory
  LDHS                   = 0xB4,  // ldhs — Load halfword signed

  // system
  SCALL                  = 0xBE,  // scall — System call dispatch — specific instruction in sub-opcode field (S-type)

  // branching
  UB                     = 0xC0,  // ub — Unconditional branch immediate (Bi-type)

  // branching
  UBR                    = 0xC2,  // ubr — Unconditional branch register (Bu-type)

  // branching
  BCOND                  = 0xC4,  // b — Conditional branch (Bc-type)

  // branching
  CALL                   = 0xC6,  // call — Call subroutine (Bi-type)

  // branching
  RET                    = 0xC8,  // ret — Return from subroutine (Bu-type)

  // integer_memory
  LDHZ                   = 0xD4,  // ldhz — Load halfword zero-extended

}

// ── Sub-opcodes ───────────────────────────────────────────────────────────────

export const enum ScallSubOp {

  SYSCALL              = 0x00,  // Invoke OS syscall; syscall number in r0

  SYSRET               = 0x01,  // Return from syscall/exception handler

  HLT                  = 0x02,  // Halt processor

  MVCSR                = 0x03,  // Move CSR to integer register

  MVCSR_W              = 0x04,  // Move integer register to CSR

  IRET                 = 0x05,  // Return from interrupt

  TLBFLUSH             = 0x06,  // Flush TLB (privileged)

  FENCE                = 0x07,  // Memory fence / barrier

}


// ── Aliases ───────────────────────────────────────────────────────────────────

export const CMP                    = Opcode.SUBS_I;  // Compare immediate (subs, result discarded)

export const CMPR                   = Opcode.SUBS_R;  // Compare register (subs, result discarded)

export const NOP                    = Opcode.ADD_I;  // No-op (add r0, r0, #0)


// ── Reverse lookup: opcode byte -> mnemonic ───────────────────────────────────
export const OPCODE_NAMES = new Map<number, string>([

  [0x04, "sxb"],

  [0x05, "sxh"],

  [0x06, "uxb"],

  [0x07, "uxh"],

  [0x14, "ld"],

  [0x1C, "str"],

  [0x20, "fadd"],

  [0x21, "fsub"],

  [0x22, "fmul"],

  [0x23, "fdiv"],

  [0x24, "fsqrt"],

  [0x25, "fmadd"],

  [0x26, "fmsub"],

  [0x27, "fnmadd"],

  [0x28, "fnmsub"],

  [0x29, "fmin"],

  [0x2A, "fmax"],

  [0x2B, "fabs"],

  [0x2C, "fneg"],

  [0x2D, "fclass"],

  [0x2E, "feq"],

  [0x2F, "flt"],

  [0x30, "fle"],

  [0x31, "fmv"],

  [0x32, "fmv.x.s"],

  [0x33, "fmv.s.x"],

  [0x34, "ldb"],

  [0x35, "flw"],

  [0x36, "fsw"],

  [0x37, "fcvt.w.s"],

  [0x38, "fcvt.wu.s"],

  [0x39, "fcvt.s.w"],

  [0x3A, "fcvt.s.wu"],

  [0x3B, "fcsrr"],

  [0x3C, "strb"],

  [0x3D, "fcsrw"],

  [0x3E, "fcsrs"],

  [0x40, "or"],

  [0x41, "or"],

  [0x42, "and"],

  [0x43, "and"],

  [0x44, "xor"],

  [0x45, "xor"],

  [0x46, "not"],

  [0x47, "not"],

  [0x48, "lsl"],

  [0x49, "lsl"],

  [0x4A, "lsr"],

  [0x4B, "lsr"],

  [0x4C, "asr"],

  [0x4D, "asr"],

  [0x54, "ldbs"],

  [0x5C, "strh"],

  [0x60, "vadd"],

  [0x61, "vsub"],

  [0x62, "vmul"],

  [0x63, "vdiv"],

  [0x64, "vfma"],

  [0x65, "vand"],

  [0x66, "vor"],

  [0x67, "vxor"],

  [0x68, "vnot"],

  [0x69, "vld"],

  [0x6A, "vst"],

  [0x6B, "vmov"],

  [0x6C, "vbroadcast"],

  [0x6D, "vextract"],

  [0x6E, "vinsert"],

  [0x6F, "vcmp"],

  [0x70, "vredsum"],

  [0x71, "vredmax"],

  [0x72, "vredmin"],

  [0x73, "vlsl"],

  [0x74, "ldbz"],

  [0x75, "vlsr"],

  [0x76, "vasr"],

  [0x77, "vsplat"],

  [0x80, "add"],

  [0x81, "add"],

  [0x84, "mv"],

  [0x85, "mv"],

  [0x88, "adds"],

  [0x89, "adds"],

  [0x90, "sub"],

  [0x91, "sub"],

  [0x94, "ldh"],

  [0x98, "subs"],

  [0x99, "subs"],

  [0xA0, "mul"],

  [0xA2, "smul"],

  [0xA8, "div"],

  [0xAA, "sdiv"],

  [0xB4, "ldhs"],

  [0xBE, "scall"],

  [0xC0, "ub"],

  [0xC2, "ubr"],

  [0xC4, "b"],

  [0xC6, "call"],

  [0xC8, "ret"],

  [0xD4, "ldhz"],

]);

// ── Mnemonic helpers ──────────────────────────────────────────────────────────
export function isImmediateOpcode(op: number): boolean { return (op & 1) === 0; }
export function isRegisterOpcode(op: number):  boolean { return (op & 1) === 1; }

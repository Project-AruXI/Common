// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-05-11
// To update: edit opcodes.json then run scripts/generate.py

// zig fmt: off

const std = @import("std");

pub const meta = .{
  .wordSize = 32,
  .opcodeBits = 8,
  .intRegisters = 32,
  .fpRegisters = 16,
  .vecRegisters = 6,
};

// ── Opcodes ───────────────────────────────────────────────────────────────────
// I/R pairs share a mnemonic. The I-variant opcode is even, R-variant is odd.
pub const Opcode = enum(u8) {

  // Bi
  ub = 0x5B, // ub — 

  // Bu
  ubr = 0x5C, // ubr — 

  // Bc
  b = 0x5D, // b — 

  // Bi
  call = 0x5E, // call — 

  // Bu
  ret = 0x5F, // ret — 

  // FM
  addf = 0x6E, // addf — FP add

  // fp
  subf = 0x6F, // subf — FP subtract

  // fp
  mulf = 0x70, // mulf — FP multiply

  // fp
  divf = 0x71, // divf — FP divide

  // fp
  sqrtf = 0x72, // sqrtf — FP square root

  // fp
  minf = 0x73, // minf — FP minimum

  // fp
  maxf = 0x74, // maxf — FP maximum

  // fp
  absf = 0x75, // absf — FP absolute value

  // fp
  negf = 0x76, // negf — FP negate

  // 
  fusedf = 0x77, // fusedf — FP fused operations

  // fp
  mvf = 0x7D, // mvf — FP register copy

  // fp
  mvfi = 0x7E, // mvfi — FP to int reg — bit-pattern, no conversion

  // fp
  mvif = 0x7F, // mvif — Int reg to FP — bit-pattern, no conversion

  // fp_convert
  cvtfu = 0x80, // cvtfu — FP to unsigned int32

  // fp_convert
  cvtfs = 0x81, // cvtfs — FP to signed int32

  // fp_convert
  cvtuf = 0x82, // cvtuf — Unsigned int32 to FP

  // fp_convert
  cvtsf = 0x83, // cvtsf — Signed int32 to FP

  // fp
  classf = 0x87, // classf — FP classify — result bitmask to int reg

  // fp
  cmpf = 0x88, // cmpf — Compare FP

  // fp
  cmpfe = 0x89, // cmpfe — Compare FP, exception raise

  // I
  add_i = 0x90, // add — 

  // R
  add_r = 0x91, // add — 

  // I
  adds_i = 0x92, // adds — 

  // R
  adds_r = 0x93, // adds — 

  // I
  sub_i = 0x94, // sub — 

  // R
  sub_r = 0x95, // sub — 

  // I
  subs_i = 0x96, // subs — 

  // R
  subs_r = 0x97, // subs — 

  // R
  mul = 0x98, // mul — 

  // R
  smul = 0x99, // smul — 

  // R
  div = 0x9A, // div — 

  // R
  sdiv = 0x9B, // sdiv — 

  // I
  or_i = 0xA2, // or — 

  // R
  or_r = 0xA3, // or — 

  // I
  and_i = 0xA4, // and — 

  // R
  and_r = 0xA5, // and — 

  // I
  xor_i = 0xA6, // xor — 

  // R
  xor_r = 0xA7, // xor — 

  // I
  not_i = 0xA8, // not — 

  // R
  not_r = 0xA9, // not — 

  // I
  lsl_i = 0xAA, // lsl — 

  // R
  lsl_r = 0xAB, // lsl — 

  // I
  lsr_i = 0xAC, // lsr — 

  // 
  lsr_r = 0xAD, // lsr — 

  // I
  asr_i = 0xAE, // asr — 

  // 
  asr_r = 0xAF, // asr — 

  // I
  mvi = 0xB0, // mvi — 

  // R
  sxb = 0xB1, // sxb — 

  // R
  sxh = 0xB2, // sxh — 

  // R
  uxb = 0xB3, // uxb — 

  // R
  uxh = 0xB4, // uxh — 

  // M
  ld = 0xC0, // ld — 

  // M
  ldb = 0xC1, // ldb — 

  // M
  ldbs = 0xC2, // ldbs — 

  // M
  ldbz = 0xC3, // ldbz — 

  // M
  ldh = 0xC4, // ldh — 

  // M
  ldhs = 0xC5, // ldhs — 

  // M
  ldhz = 0xC6, // ldhz — 

  // M
  str = 0xC7, // str — 

  // M
  strb = 0xC8, // strb — 

  // M
  strbh = 0xC9, // strbh — 

  // fp_memory
  ldf = 0xCA, // ldf — FP load word

  // fp_memory
  strf = 0xCB, // strf — FP store word

  // S
  sys = 0xFF, // sys — System specific instruction in sub-opcode field (S-type)


  pub fn fromByte(b: u8) ?Opcode {
    return std.meta.intToEnum(Opcode, b) catch null;
  }
  pub fn mnemonic(self: Opcode) []const u8 {
    return switch (self) {

      .ub => "ub",

      .ubr => "ubr",

      .b => "b",

      .call => "call",

      .ret => "ret",

      .addf => "addf",

      .subf => "subf",

      .mulf => "mulf",

      .divf => "divf",

      .sqrtf => "sqrtf",

      .minf => "minf",

      .maxf => "maxf",

      .absf => "absf",

      .negf => "negf",

      .fusedf => "fusedf",

      .mvf => "mvf",

      .mvfi => "mvfi",

      .mvif => "mvif",

      .cvtfu => "cvtfu",

      .cvtfs => "cvtfs",

      .cvtuf => "cvtuf",

      .cvtsf => "cvtsf",

      .classf => "classf",

      .cmpf => "cmpf",

      .cmpfe => "cmpfe",

      .add_i => "add",

      .add_r => "add",

      .adds_i => "adds",

      .adds_r => "adds",

      .sub_i => "sub",

      .sub_r => "sub",

      .subs_i => "subs",

      .subs_r => "subs",

      .mul => "mul",

      .smul => "smul",

      .div => "div",

      .sdiv => "sdiv",

      .or_i => "or",

      .or_r => "or",

      .and_i => "and",

      .and_r => "and",

      .xor_i => "xor",

      .xor_r => "xor",

      .not_i => "not",

      .not_r => "not",

      .lsl_i => "lsl",

      .lsl_r => "lsl",

      .lsr_i => "lsr",

      .lsr_r => "lsr",

      .asr_i => "asr",

      .asr_r => "asr",

      .mvi => "mvi",

      .sxb => "sxb",

      .sxh => "sxh",

      .uxb => "uxb",

      .uxh => "uxh",

      .ld => "ld",

      .ldb => "ldb",

      .ldbs => "ldbs",

      .ldbz => "ldbz",

      .ldh => "ldh",

      .ldhs => "ldhs",

      .ldhz => "ldhz",

      .str => "str",

      .strb => "strb",

      .strbh => "strbh",

      .ldf => "ldf",

      .strf => "strf",

      .sys => "sys",

    };
  }
  pub fn isImmediate(self: Opcode) bool { return (@intFromEnum(self) & 1) == 0; }
  pub fn isRegister(self: Opcode)  bool { return (@intFromEnum(self) & 1) == 1; }
};

// ── Sub-opcodes ───────────────────────────────────────────────────────────────

pub const FusedfSubOp = enum(u8) {

  fmaddf = 0x00, // FP fused multiply-add: fd = fs1*fs2 + fs3

  fmsubf = 0x01, // FP fused multiply-subtract: fd = fs1*fs2 - fs3

  fnmaddf = 0x02, // FP negated fused multiply-add: fd = -(fs1*fs2 + fs3)

  fnmsubf = 0x03, // FP negated fused multiply-subtract

};

pub const SysSubOp = enum(u8) {

  syscall = 0x00, // Invoke OS syscall

  hlt = 0x01, // Halt processor

  si = 0x02, // Set interrupt bit

  di = 0x03, // Disable interrupt bit

  eret = 0x04, // Return from exception

  mvir = 0x05, // Move IR to integer register

  wcstr = 0x06, // Move integer register to CSTR

  rcstr = 0x07, // Move CSTR to integer register

  wfcsr = 0x08, // Move integer register to FCSR

  rfcsr = 0x09, // Move FCSR to integer register

};


// ── Aliases ───────────────────────────────────────────────────────────────────

pub const nop = Opcode.add_i; // No-op (add r0, r0, #0)

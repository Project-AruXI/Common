// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-05-11
// To update: edit opcodes.json then run scripts/generate.py

export const ARU_WORD_SIZE = 32;
export const ARU_OPCODE_BITS = 8;
export const ARU_INT_REGISTERS = 32;
export const ARU_FP_REGISTERS = 16;
export const ARU_VEC_REGISTERS = 6;

// ── Opcodes ───────────────────────────────────────────────────────────────────
// I/R pairs share a mnemonic. I-variant opcode is even, R-variant is odd.
export const enum Opcode {

  // Bi
  UB = 0x5B, // ub — 

  // Bu
  UBR = 0x5C, // ubr — 

  // Bc
  B = 0x5D, // b — 

  // Bi
  CALL = 0x5E, // call — 

  // Bu
  RET = 0x5F, // ret — 

  // FM
  ADDF = 0x6E, // addf — FP add

  // fp
  SUBF = 0x6F, // subf — FP subtract

  // fp
  MULF = 0x70, // mulf — FP multiply

  // fp
  DIVF = 0x71, // divf — FP divide

  // fp
  SQRTF = 0x72, // sqrtf — FP square root

  // fp
  MINF = 0x73, // minf — FP minimum

  // fp
  MAXF = 0x74, // maxf — FP maximum

  // fp
  ABSF = 0x75, // absf — FP absolute value

  // fp
  NEGF = 0x76, // negf — FP negate

  // 
  FUSEDF = 0x77, // fusedf — FP fused operations

  // fp
  MVF = 0x7D, // mvf — FP register copy

  // fp
  MVFI = 0x7E, // mvfi — FP to int reg — bit-pattern, no conversion

  // fp
  MVIF = 0x7F, // mvif — Int reg to FP — bit-pattern, no conversion

  // fp_convert
  CVTFU = 0x80, // cvtfu — FP to unsigned int32

  // fp_convert
  CVTFS = 0x81, // cvtfs — FP to signed int32

  // fp_convert
  CVTUF = 0x82, // cvtuf — Unsigned int32 to FP

  // fp_convert
  CVTSF = 0x83, // cvtsf — Signed int32 to FP

  // fp
  CLASSF = 0x87, // classf — FP classify — result bitmask to int reg

  // fp
  CMPF = 0x88, // cmpf — Compare FP

  // fp
  CMPFE = 0x89, // cmpfe — Compare FP, exception raise

  // I
  ADD_I = 0x90, // add — 

  // R
  ADD_R = 0x91, // add — 

  // I
  ADDS_I = 0x92, // adds — 

  // R
  ADDS_R = 0x93, // adds — 

  // I
  SUB_I = 0x94, // sub — 

  // R
  SUB_R = 0x95, // sub — 

  // I
  SUBS_I = 0x96, // subs — 

  // R
  SUBS_R = 0x97, // subs — 

  // R
  MUL = 0x98, // mul — 

  // R
  SMUL = 0x99, // smul — 

  // R
  DIV = 0x9A, // div — 

  // R
  SDIV = 0x9B, // sdiv — 

  // I
  OR_I = 0xA2, // or — 

  // R
  OR_R = 0xA3, // or — 

  // I
  AND_I = 0xA4, // and — 

  // R
  AND_R = 0xA5, // and — 

  // I
  XOR_I = 0xA6, // xor — 

  // R
  XOR_R = 0xA7, // xor — 

  // I
  NOT_I = 0xA8, // not — 

  // R
  NOT_R = 0xA9, // not — 

  // I
  LSL_I = 0xAA, // lsl — 

  // R
  LSL_R = 0xAB, // lsl — 

  // I
  LSR_I = 0xAC, // lsr — 

  // 
  LSR_R = 0xAD, // lsr — 

  // I
  ASR_I = 0xAE, // asr — 

  // 
  ASR_R = 0xAF, // asr — 

  // I
  MVI = 0xB0, // mvi — 

  // R
  SXB = 0xB1, // sxb — 

  // R
  SXH = 0xB2, // sxh — 

  // R
  UXB = 0xB3, // uxb — 

  // R
  UXH = 0xB4, // uxh — 

  // M
  LD = 0xC0, // ld — 

  // M
  LDB = 0xC1, // ldb — 

  // M
  LDBS = 0xC2, // ldbs — 

  // M
  LDBZ = 0xC3, // ldbz — 

  // M
  LDH = 0xC4, // ldh — 

  // M
  LDHS = 0xC5, // ldhs — 

  // M
  LDHZ = 0xC6, // ldhz — 

  // M
  STR = 0xC7, // str — 

  // M
  STRB = 0xC8, // strb — 

  // M
  STRBH = 0xC9, // strbh — 

  // fp_memory
  LDF = 0xCA, // ldf — FP load word

  // fp_memory
  STRF = 0xCB, // strf — FP store word

  // S
  SYS = 0xFF, // sys — System specific instruction in sub-opcode field (S-type)

}

// ── Sub-opcodes ───────────────────────────────────────────────────────────────

export const enum FusedfSubOp {

  FMADDF = 0x00, // FP fused multiply-add: fd = fs1*fs2 + fs3

  FMSUBF = 0x01, // FP fused multiply-subtract: fd = fs1*fs2 - fs3

  FNMADDF = 0x02, // FP negated fused multiply-add: fd = -(fs1*fs2 + fs3)

  FNMSUBF = 0x03, // FP negated fused multiply-subtract

}

export const enum SysSubOp {

  SYSCALL = 0x00, // Invoke OS syscall

  HLT = 0x01, // Halt processor

  SI = 0x02, // Set interrupt bit

  DI = 0x03, // Disable interrupt bit

  ERET = 0x04, // Return from exception

  MVIR = 0x05, // Move IR to integer register

  WCSTR = 0x06, // Move integer register to CSTR

  RCSTR = 0x07, // Move CSTR to integer register

  WFCSR = 0x08, // Move integer register to FCSR

  RFCSR = 0x09, // Move FCSR to integer register

}


// ── Aliases ───────────────────────────────────────────────────────────────────

export const NOP = Opcode.ADD_I; // No-op (add r0, r0, #0)


// ── Reverse lookup: opcode byte -> mnemonic ───────────────────────────────────
export const OPCODE_NAMES = new Map<number, string>([

  [0x5B, "ub"],

  [0x5C, "ubr"],

  [0x5D, "b"],

  [0x5E, "call"],

  [0x5F, "ret"],

  [0x6E, "addf"],

  [0x6F, "subf"],

  [0x70, "mulf"],

  [0x71, "divf"],

  [0x72, "sqrtf"],

  [0x73, "minf"],

  [0x74, "maxf"],

  [0x75, "absf"],

  [0x76, "negf"],

  [0x77, "fusedf"],

  [0x7D, "mvf"],

  [0x7E, "mvfi"],

  [0x7F, "mvif"],

  [0x80, "cvtfu"],

  [0x81, "cvtfs"],

  [0x82, "cvtuf"],

  [0x83, "cvtsf"],

  [0x87, "classf"],

  [0x88, "cmpf"],

  [0x89, "cmpfe"],

  [0x90, "add"],

  [0x91, "add"],

  [0x92, "adds"],

  [0x93, "adds"],

  [0x94, "sub"],

  [0x95, "sub"],

  [0x96, "subs"],

  [0x97, "subs"],

  [0x98, "mul"],

  [0x99, "smul"],

  [0x9A, "div"],

  [0x9B, "sdiv"],

  [0xA2, "or"],

  [0xA3, "or"],

  [0xA4, "and"],

  [0xA5, "and"],

  [0xA6, "xor"],

  [0xA7, "xor"],

  [0xA8, "not"],

  [0xA9, "not"],

  [0xAA, "lsl"],

  [0xAB, "lsl"],

  [0xAC, "lsr"],

  [0xAD, "lsr"],

  [0xAE, "asr"],

  [0xAF, "asr"],

  [0xB0, "mvi"],

  [0xB1, "sxb"],

  [0xB2, "sxh"],

  [0xB3, "uxb"],

  [0xB4, "uxh"],

  [0xC0, "ld"],

  [0xC1, "ldb"],

  [0xC2, "ldbs"],

  [0xC3, "ldbz"],

  [0xC4, "ldh"],

  [0xC5, "ldhs"],

  [0xC6, "ldhz"],

  [0xC7, "str"],

  [0xC8, "strb"],

  [0xC9, "strbh"],

  [0xCA, "ldf"],

  [0xCB, "strf"],

  [0xFF, "sys"],

]);

// ── Mnemonic helpers ──────────────────────────────────────────────────────────
export function isImmediateOpcode(op: number): boolean { return (op & 1) === 0; }
export function isRegisterOpcode(op: number):  boolean { return (op & 1) === 1; }
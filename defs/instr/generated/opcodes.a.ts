// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-05-11
// To update: edit opcodes.json then run scripts/generate.py

export const ARU_WORD_SIZE: u8 = 32;
export const ARU_OPCODE_BITS: u8 = 8;
export const ARU_INT_REGISTERS: u8 = 32;
export const ARU_FP_REGISTERS: u8 = 16;
export const ARU_VEC_REGISTERS: u8 = 6;

// ── Opcodes ───────────────────────────────────────────────────────────────────

// fp
export const OPCODE_SUBF: u8 = 0x21; // subf — FP subtract

// fp
export const OPCODE_MULF: u8 = 0x22; // mulf — FP multiply

// fp
export const OPCODE_DIVF: u8 = 0x23; // divf — FP divide

// fp
export const OPCODE_SQRTF: u8 = 0x24; // sqrtf — FP square root

// fp
export const OPCODE_MINF: u8 = 0x29; // minf — FP minimum

// fp
export const OPCODE_MAXF: u8 = 0x2A; // maxf — FP maximum

// fp
export const OPCODE_ABSF: u8 = 0x2B; // absf — FP absolute value

// fp
export const OPCODE_NEGF: u8 = 0x2C; // negf — FP negate

// Bi
export const OPCODE_UB: u8 = 0x5B; // ub — 

// Bu
export const OPCODE_UBR: u8 = 0x5C; // ubr — 

// Bc
export const OPCODE_B: u8 = 0x5D; // b — 

// Bi
export const OPCODE_CALL: u8 = 0x5E; // call — 

// Bu
export const OPCODE_RET: u8 = 0x5F; // ret — 

// FM
export const OPCODE_ADDF: u8 = 0x6E; // addf — FP add

// 
export const OPCODE_FUSEDF: u8 = 0x77; // fusedf — FP fused operations

// fp
export const OPCODE_MVF: u8 = 0x7D; // mvf — FP register copy

// fp
export const OPCODE_MVFI: u8 = 0x7E; // mvfi — FP to int reg — bit-pattern, no conversion

// fp
export const OPCODE_MVIF: u8 = 0x7F; // mvif — Int reg to FP — bit-pattern, no conversion

// fp_convert
export const OPCODE_CVTFU: u8 = 0x80; // cvtfu — FP to unsigned int32

// fp_convert
export const OPCODE_CVTFS: u8 = 0x81; // cvtfs — FP to signed int32

// fp_convert
export const OPCODE_CVTUF: u8 = 0x82; // cvtuf — Unsigned int32 to FP

// fp_convert
export const OPCODE_CVTSF: u8 = 0x83; // cvtsf — Signed int32 to FP

// fp
export const OPCODE_CLASSF: u8 = 0x87; // classf — FP classify — result bitmask to int reg

// fp
export const OPCODE_CMPF: u8 = 0x88; // cmpf — Compare FP

// fp
export const OPCODE_CMPFE: u8 = 0x89; // cmpfe — Compare FP, exception raise

// I
export const OPCODE_ADD_I: u8 = 0x90; // add — 

// R
export const OPCODE_ADD_R: u8 = 0x91; // add — 

// I
export const OPCODE_ADDS_I: u8 = 0x92; // adds — 

// R
export const OPCODE_ADDS_R: u8 = 0x93; // adds — 

// I
export const OPCODE_SUB_I: u8 = 0x94; // sub — 

// R
export const OPCODE_SUB_R: u8 = 0x95; // sub — 

// I
export const OPCODE_SUBS_I: u8 = 0x96; // subs — 

// R
export const OPCODE_SUBS_R: u8 = 0x97; // subs — 

// R
export const OPCODE_MUL: u8 = 0x98; // mul — 

// R
export const OPCODE_SMUL: u8 = 0x99; // smul — 

// R
export const OPCODE_DIV: u8 = 0x9A; // div — 

// R
export const OPCODE_SDIV: u8 = 0x9B; // sdiv — 

// I
export const OPCODE_OR_I: u8 = 0xA2; // or — 

// R
export const OPCODE_OR_R: u8 = 0xA3; // or — 

// I
export const OPCODE_AND_I: u8 = 0xA4; // and — 

// R
export const OPCODE_AND_R: u8 = 0xA5; // and — 

// I
export const OPCODE_XOR_I: u8 = 0xA6; // xor — 

// R
export const OPCODE_XOR_R: u8 = 0xA7; // xor — 

// I
export const OPCODE_NOT_I: u8 = 0xA8; // not — 

// R
export const OPCODE_NOT_R: u8 = 0xA9; // not — 

// I
export const OPCODE_LSL_I: u8 = 0xAA; // lsl — 

// R
export const OPCODE_LSL_R: u8 = 0xAB; // lsl — 

// I
export const OPCODE_LSR_I: u8 = 0xAC; // lsr — 

// 
export const OPCODE_LSR_R: u8 = 0xAD; // lsr — 

// I
export const OPCODE_ASR_I: u8 = 0xAE; // asr — 

// 
export const OPCODE_ASR_R: u8 = 0xAF; // asr — 

// I
export const OPCODE_MVI: u8 = 0xB0; // mvi — 

// R
export const OPCODE_SXB: u8 = 0xB1; // sxb — 

// R
export const OPCODE_SXH: u8 = 0xB2; // sxh — 

// R
export const OPCODE_UXB: u8 = 0xB3; // uxb — 

// R
export const OPCODE_UXH: u8 = 0xB4; // uxh — 

// M
export const OPCODE_LD: u8 = 0xC0; // ld — 

// M
export const OPCODE_LDB: u8 = 0xC1; // ldb — 

// M
export const OPCODE_LDBS: u8 = 0xC2; // ldbs — 

// M
export const OPCODE_LDBZ: u8 = 0xC3; // ldbz — 

// M
export const OPCODE_LDH: u8 = 0xC4; // ldh — 

// M
export const OPCODE_LDHS: u8 = 0xC5; // ldhs — 

// M
export const OPCODE_LDHZ: u8 = 0xC6; // ldhz — 

// M
export const OPCODE_STR: u8 = 0xC7; // str — 

// M
export const OPCODE_STRB: u8 = 0xC8; // strb — 

// M
export const OPCODE_STRBH: u8 = 0xC9; // strbh — 

// fp_memory
export const OPCODE_LDF: u8 = 0xCA; // ldf — FP load word

// fp_memory
export const OPCODE_STRF: u8 = 0xCB; // strf — FP store word

// S
export const OPCODE_SYS: u8 = 0xFF; // sys — System specific instruction in sub-opcode field (S-type)


// ── Sub-opcodes ───────────────────────────────────────────────────────────────


// ── Aliases ───────────────────────────────────────────────────────────────────

export const OPCODE_NOP: u8 = OPCODE_ADD_I; // No-op (add r0, r0, #0)


// ── Helpers ───────────────────────────────────────────────────────────────────
export function isImmediateOpcode(op: u8): bool { return (op & 1) == 0; }
export function isRegisterOpcode(op: u8):  bool { return (op & 1) == 1; }
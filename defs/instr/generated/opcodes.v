// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-05-11
// To update: edit opcodes.json then run scripts/generate.py

module opcodes

pub const aru_word_size = u8(32)
pub const aru_opcode_bits = u8(8)
pub const aru_int_registers = u8(32)
pub const aru_fp_registers = u8(16)
pub const aru_vec_registers = u8(6)

// ── Opcodes ───────────────────────────────────────────────────────────────────

// fp
pub const opcode_subf = u8(0x21) // subf — FP subtract

// fp
pub const opcode_mulf = u8(0x22) // mulf — FP multiply

// fp
pub const opcode_divf = u8(0x23) // divf — FP divide

// fp
pub const opcode_sqrtf = u8(0x24) // sqrtf — FP square root

// fp
pub const opcode_minf = u8(0x29) // minf — FP minimum

// fp
pub const opcode_maxf = u8(0x2A) // maxf — FP maximum

// fp
pub const opcode_absf = u8(0x2B) // absf — FP absolute value

// fp
pub const opcode_negf = u8(0x2C) // negf — FP negate

// Bi
pub const opcode_ub = u8(0x5B) // ub — 

// Bu
pub const opcode_ubr = u8(0x5C) // ubr — 

// Bc
pub const opcode_b = u8(0x5D) // b — 

// Bi
pub const opcode_call = u8(0x5E) // call — 

// Bu
pub const opcode_ret = u8(0x5F) // ret — 

// FM
pub const opcode_addf = u8(0x6E) // addf — FP add

// 
pub const opcode_fusedf = u8(0x77) // fusedf — FP fused operations

// fp
pub const opcode_mvf = u8(0x7D) // mvf — FP register copy

// fp
pub const opcode_mvfi = u8(0x7E) // mvfi — FP to int reg — bit-pattern, no conversion

// fp
pub const opcode_mvif = u8(0x7F) // mvif — Int reg to FP — bit-pattern, no conversion

// fp_convert
pub const opcode_cvtfu = u8(0x80) // cvtfu — FP to unsigned int32

// fp_convert
pub const opcode_cvtfs = u8(0x81) // cvtfs — FP to signed int32

// fp_convert
pub const opcode_cvtuf = u8(0x82) // cvtuf — Unsigned int32 to FP

// fp_convert
pub const opcode_cvtsf = u8(0x83) // cvtsf — Signed int32 to FP

// fp
pub const opcode_classf = u8(0x87) // classf — FP classify — result bitmask to int reg

// fp
pub const opcode_cmpf = u8(0x88) // cmpf — Compare FP

// fp
pub const opcode_cmpfe = u8(0x89) // cmpfe — Compare FP, exception raise

// I
pub const opcode_add_i = u8(0x90) // add — 

// R
pub const opcode_add_r = u8(0x91) // add — 

// I
pub const opcode_adds_i = u8(0x92) // adds — 

// R
pub const opcode_adds_r = u8(0x93) // adds — 

// I
pub const opcode_sub_i = u8(0x94) // sub — 

// R
pub const opcode_sub_r = u8(0x95) // sub — 

// I
pub const opcode_subs_i = u8(0x96) // subs — 

// R
pub const opcode_subs_r = u8(0x97) // subs — 

// R
pub const opcode_mul = u8(0x98) // mul — 

// R
pub const opcode_smul = u8(0x99) // smul — 

// R
pub const opcode_div = u8(0x9A) // div — 

// R
pub const opcode_sdiv = u8(0x9B) // sdiv — 

// I
pub const opcode_or_i = u8(0xA2) // or — 

// R
pub const opcode_or_r = u8(0xA3) // or — 

// I
pub const opcode_and_i = u8(0xA4) // and — 

// R
pub const opcode_and_r = u8(0xA5) // and — 

// I
pub const opcode_xor_i = u8(0xA6) // xor — 

// R
pub const opcode_xor_r = u8(0xA7) // xor — 

// I
pub const opcode_not_i = u8(0xA8) // not — 

// R
pub const opcode_not_r = u8(0xA9) // not — 

// I
pub const opcode_lsl_i = u8(0xAA) // lsl — 

// R
pub const opcode_lsl_r = u8(0xAB) // lsl — 

// I
pub const opcode_lsr_i = u8(0xAC) // lsr — 

// 
pub const opcode_lsr_r = u8(0xAD) // lsr — 

// I
pub const opcode_asr_i = u8(0xAE) // asr — 

// 
pub const opcode_asr_r = u8(0xAF) // asr — 

// I
pub const opcode_mvi = u8(0xB0) // mvi — 

// R
pub const opcode_sxb = u8(0xB1) // sxb — 

// R
pub const opcode_sxh = u8(0xB2) // sxh — 

// R
pub const opcode_uxb = u8(0xB3) // uxb — 

// R
pub const opcode_uxh = u8(0xB4) // uxh — 

// M
pub const opcode_ld = u8(0xC0) // ld — 

// M
pub const opcode_ldb = u8(0xC1) // ldb — 

// M
pub const opcode_ldbs = u8(0xC2) // ldbs — 

// M
pub const opcode_ldbz = u8(0xC3) // ldbz — 

// M
pub const opcode_ldh = u8(0xC4) // ldh — 

// M
pub const opcode_ldhs = u8(0xC5) // ldhs — 

// M
pub const opcode_ldhz = u8(0xC6) // ldhz — 

// M
pub const opcode_str = u8(0xC7) // str — 

// M
pub const opcode_strb = u8(0xC8) // strb — 

// M
pub const opcode_strbh = u8(0xC9) // strbh — 

// fp_memory
pub const opcode_ldf = u8(0xCA) // ldf — FP load word

// fp_memory
pub const opcode_strf = u8(0xCB) // strf — FP store word

// S
pub const opcode_sys = u8(0xFF) // sys — System specific instruction in sub-opcode field (S-type)


// ── Sub-opcodes ───────────────────────────────────────────────────────────────


// ── Aliases ───────────────────────────────────────────────────────────────────

pub const opcode_nop = opcode_add_i // No-op (add r0, r0, #0)


// ── Reverse lookup ────────────────────────────────────────────────────────────
pub const opcode_names = {

	u8(0x21): 'subf',

	u8(0x22): 'mulf',

	u8(0x23): 'divf',

	u8(0x24): 'sqrtf',

	u8(0x29): 'minf',

	u8(0x2A): 'maxf',

	u8(0x2B): 'absf',

	u8(0x2C): 'negf',

	u8(0x5B): 'ub',

	u8(0x5C): 'ubr',

	u8(0x5D): 'b',

	u8(0x5E): 'call',

	u8(0x5F): 'ret',

	u8(0x6E): 'addf',

	u8(0x77): 'fusedf',

	u8(0x7D): 'mvf',

	u8(0x7E): 'mvfi',

	u8(0x7F): 'mvif',

	u8(0x80): 'cvtfu',

	u8(0x81): 'cvtfs',

	u8(0x82): 'cvtuf',

	u8(0x83): 'cvtsf',

	u8(0x87): 'classf',

	u8(0x88): 'cmpf',

	u8(0x89): 'cmpfe',

	u8(0x90): 'add',

	u8(0x91): 'add',

	u8(0x92): 'adds',

	u8(0x93): 'adds',

	u8(0x94): 'sub',

	u8(0x95): 'sub',

	u8(0x96): 'subs',

	u8(0x97): 'subs',

	u8(0x98): 'mul',

	u8(0x99): 'smul',

	u8(0x9A): 'div',

	u8(0x9B): 'sdiv',

	u8(0xA2): 'or',

	u8(0xA3): 'or',

	u8(0xA4): 'and',

	u8(0xA5): 'and',

	u8(0xA6): 'xor',

	u8(0xA7): 'xor',

	u8(0xA8): 'not',

	u8(0xA9): 'not',

	u8(0xAA): 'lsl',

	u8(0xAB): 'lsl',

	u8(0xAC): 'lsr',

	u8(0xAD): 'lsr',

	u8(0xAE): 'asr',

	u8(0xAF): 'asr',

	u8(0xB0): 'mvi',

	u8(0xB1): 'sxb',

	u8(0xB2): 'sxh',

	u8(0xB3): 'uxb',

	u8(0xB4): 'uxh',

	u8(0xC0): 'ld',

	u8(0xC1): 'ldb',

	u8(0xC2): 'ldbs',

	u8(0xC3): 'ldbz',

	u8(0xC4): 'ldh',

	u8(0xC5): 'ldhs',

	u8(0xC6): 'ldhz',

	u8(0xC7): 'str',

	u8(0xC8): 'strb',

	u8(0xC9): 'strbh',

	u8(0xCA): 'ldf',

	u8(0xCB): 'strf',

	u8(0xFF): 'sys',

}

pub fn isImmediateOpcode(op u8) bool { return op & 1 == 0 }
pub fn isRegisterOpcode(op u8)  bool { return op & 1 == 1 }
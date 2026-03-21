// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-03-20
// To update: edit opcodes.json then run scripts/generate.py

export const ARU_WORD_SIZE: u8     = 32;
export const ARU_OPCODE_BITS: u8   = 8;
export const ARU_INT_REGISTERS: u8 = 16;
export const ARU_FP_REGISTERS: u8  = 16;
export const ARU_VEC_REGISTERS: u8 = 6;

// ── Opcodes ───────────────────────────────────────────────────────────────────

// extend
export const OPCODE_SXB: u8 = 0x04;  // sxb — Sign-extend byte to word

// extend
export const OPCODE_SXH: u8 = 0x05;  // sxh — Sign-extend halfword to word

// extend
export const OPCODE_UXB: u8 = 0x06;  // uxb — Zero-extend byte to word

// extend
export const OPCODE_UXH: u8 = 0x07;  // uxh — Zero-extend halfword to word

// integer_memory
export const OPCODE_LD: u8 = 0x14;  // ld — Load word

// integer_memory
export const OPCODE_STR: u8 = 0x1C;  // str — Store word

// fp
export const OPCODE_FADD: u8 = 0x20;  // fadd — FP add

// fp
export const OPCODE_FSUB: u8 = 0x21;  // fsub — FP subtract

// fp
export const OPCODE_FMUL: u8 = 0x22;  // fmul — FP multiply

// fp
export const OPCODE_FDIV: u8 = 0x23;  // fdiv — FP divide

// fp
export const OPCODE_FSQRT: u8 = 0x24;  // fsqrt — FP square root

// fp
export const OPCODE_FMADD: u8 = 0x25;  // fmadd — FP fused multiply-add: fd = fs1*fs2 + fs3

// fp
export const OPCODE_FMSUB: u8 = 0x26;  // fmsub — FP fused multiply-subtract: fd = fs1*fs2 - fs3

// fp
export const OPCODE_FNMADD: u8 = 0x27;  // fnmadd — FP negated fused multiply-add: fd = -(fs1*fs2 + fs3)

// fp
export const OPCODE_FNMSUB: u8 = 0x28;  // fnmsub — FP negated fused multiply-subtract

// fp
export const OPCODE_FMIN: u8 = 0x29;  // fmin — FP minimum

// fp
export const OPCODE_FMAX: u8 = 0x2A;  // fmax — FP maximum

// fp
export const OPCODE_FABS: u8 = 0x2B;  // fabs — FP absolute value

// fp
export const OPCODE_FNEG: u8 = 0x2C;  // fneg — FP negate

// fp
export const OPCODE_FCLASS: u8 = 0x2D;  // fclass — FP classify — result bitmask to int reg

// fp
export const OPCODE_FEQ: u8 = 0x2E;  // feq — FP equal — result 0/1 to int reg

// fp
export const OPCODE_FLT: u8 = 0x2F;  // flt — FP less-than — result 0/1 to int reg

// fp
export const OPCODE_FLE: u8 = 0x30;  // fle — FP less-than-or-equal — result 0/1 to int reg

// fp
export const OPCODE_FMV: u8 = 0x31;  // fmv — FP register copy

// fp
export const OPCODE_FMV_X_S: u8 = 0x32;  // fmv.x.s — FP to int reg — bit-pattern, no conversion

// fp
export const OPCODE_FMV_S_X: u8 = 0x33;  // fmv.s.x — Int reg to FP — bit-pattern, no conversion

// integer_memory
export const OPCODE_LDB: u8 = 0x34;  // ldb — Load byte

// fp_memory
export const OPCODE_FLW: u8 = 0x35;  // flw — FP load word

// fp_memory
export const OPCODE_FSW: u8 = 0x36;  // fsw — FP store word

// fp_convert
export const OPCODE_FCVT_W_S: u8 = 0x37;  // fcvt.w.s — FP to signed int32

// fp_convert
export const OPCODE_FCVT_WU_S: u8 = 0x38;  // fcvt.wu.s — FP to unsigned int32

// fp_convert
export const OPCODE_FCVT_S_W: u8 = 0x39;  // fcvt.s.w — Signed int32 to FP

// fp_convert
export const OPCODE_FCVT_S_WU: u8 = 0x3A;  // fcvt.s.wu — Unsigned int32 to FP

// fp_system
export const OPCODE_FCSRR: u8 = 0x3B;  // fcsrr — Read FCSR to int reg

// integer_memory
export const OPCODE_STRB: u8 = 0x3C;  // strb — Store byte

// fp_system
export const OPCODE_FCSRW: u8 = 0x3D;  // fcsrw — Write int reg to FCSR

// fp_system
export const OPCODE_FCSRS: u8 = 0x3E;  // fcsrs — Swap int reg with FCSR

// integer_manipulation
export const OPCODE_OR_I: u8 = 0x40;  // or [I] — OR immediate

// integer_manipulation
export const OPCODE_OR_R: u8 = 0x41;  // or [R] — OR register

// integer_manipulation
export const OPCODE_AND_I: u8 = 0x42;  // and [I] — AND immediate

// integer_manipulation
export const OPCODE_AND_R: u8 = 0x43;  // and [R] — AND register

// integer_manipulation
export const OPCODE_XOR_I: u8 = 0x44;  // xor [I] — XOR immediate

// integer_manipulation
export const OPCODE_XOR_R: u8 = 0x45;  // xor [R] — XOR register

// integer_manipulation
export const OPCODE_NOT_I: u8 = 0x46;  // not [I] — NOT immediate

// integer_manipulation
export const OPCODE_NOT_R: u8 = 0x47;  // not [R] — NOT register

// integer_manipulation
export const OPCODE_LSL_I: u8 = 0x48;  // lsl [I] — Logical shift left immediate

// integer_manipulation
export const OPCODE_LSL_R: u8 = 0x49;  // lsl [R] — Logical shift left register

// integer_manipulation
export const OPCODE_LSR_I: u8 = 0x4A;  // lsr [I] — Logical shift right immediate

// integer_manipulation
export const OPCODE_LSR_R: u8 = 0x4B;  // lsr [R] — Logical shift right register

// integer_manipulation
export const OPCODE_ASR_I: u8 = 0x4C;  // asr [I] — Arithmetic shift right immediate

// integer_manipulation
export const OPCODE_ASR_R: u8 = 0x4D;  // asr [R] — Arithmetic shift right register

// integer_memory
export const OPCODE_LDBS: u8 = 0x54;  // ldbs — Load byte signed

// integer_memory
export const OPCODE_STRH: u8 = 0x5C;  // strh — Store halfword

// avext
export const OPCODE_VADD: u8 = 0x60;  // vadd — Vector element-wise add

// avext
export const OPCODE_VSUB: u8 = 0x61;  // vsub — Vector element-wise subtract

// avext
export const OPCODE_VMUL: u8 = 0x62;  // vmul — Vector element-wise multiply

// avext
export const OPCODE_VDIV: u8 = 0x63;  // vdiv — Vector element-wise divide

// avext
export const OPCODE_VFMA: u8 = 0x64;  // vfma — Vector fused multiply-add

// avext
export const OPCODE_VAND: u8 = 0x65;  // vand — Vector bitwise AND

// avext
export const OPCODE_VOR: u8 = 0x66;  // vor — Vector bitwise OR

// avext
export const OPCODE_VXOR: u8 = 0x67;  // vxor — Vector bitwise XOR

// avext
export const OPCODE_VNOT: u8 = 0x68;  // vnot — Vector bitwise NOT

// avext
export const OPCODE_VLD: u8 = 0x69;  // vld — Vector load (512-bit)

// avext
export const OPCODE_VST: u8 = 0x6A;  // vst — Vector store (512-bit)

// avext
export const OPCODE_VMOV: u8 = 0x6B;  // vmov — Vector register copy

// avext
export const OPCODE_VBROADCAST: u8 = 0x6C;  // vbroadcast — Broadcast scalar to all lanes

// avext
export const OPCODE_VEXTRACT: u8 = 0x6D;  // vextract — Extract lane to int register

// avext
export const OPCODE_VINSERT: u8 = 0x6E;  // vinsert — Insert int register into lane

// avext
export const OPCODE_VCMP: u8 = 0x6F;  // vcmp — Vector compare, result mask to int reg

// avext
export const OPCODE_VREDSUM: u8 = 0x70;  // vredsum — Vector horizontal sum reduction

// avext
export const OPCODE_VREDMAX: u8 = 0x71;  // vredmax — Vector horizontal max reduction

// avext
export const OPCODE_VREDMIN: u8 = 0x72;  // vredmin — Vector horizontal min reduction

// avext
export const OPCODE_VLSL: u8 = 0x73;  // vlsl — Vector logical shift left

// integer_memory
export const OPCODE_LDBZ: u8 = 0x74;  // ldbz — Load byte zero-extended

// avext
export const OPCODE_VLSR: u8 = 0x75;  // vlsr — Vector logical shift right

// avext
export const OPCODE_VASR: u8 = 0x76;  // vasr — Vector arithmetic shift right

// avext
export const OPCODE_VSPLAT: u8 = 0x77;  // vsplat — Splat immediate into all lanes

// integer_arithmetic
export const OPCODE_ADD_I: u8 = 0x80;  // add [I] — Add immediate

// integer_arithmetic
export const OPCODE_ADD_R: u8 = 0x81;  // add [R] — Add register

// integer_manipulation
export const OPCODE_MV_I: u8 = 0x84;  // mv [I] — Move immediate

// integer_manipulation
export const OPCODE_MV_R: u8 = 0x85;  // mv [R] — Move register

// integer_arithmetic
export const OPCODE_ADDS_I: u8 = 0x88;  // adds [I] — Add signed immediate

// integer_arithmetic
export const OPCODE_ADDS_R: u8 = 0x89;  // adds [R] — Add signed register

// integer_arithmetic
export const OPCODE_SUB_I: u8 = 0x90;  // sub [I] — Subtract immediate

// integer_arithmetic
export const OPCODE_SUB_R: u8 = 0x91;  // sub [R] — Subtract register

// integer_memory
export const OPCODE_LDH: u8 = 0x94;  // ldh — Load halfword

// integer_arithmetic
export const OPCODE_SUBS_I: u8 = 0x98;  // subs [I] — Subtract signed immediate

// integer_arithmetic
export const OPCODE_SUBS_R: u8 = 0x99;  // subs [R] — Subtract signed register

// integer_arithmetic
export const OPCODE_MUL: u8 = 0xA0;  // mul — Multiply unsigned (R-only, no I variant)

// integer_arithmetic
export const OPCODE_SMUL: u8 = 0xA2;  // smul — Multiply signed (R-only, no I variant)

// integer_arithmetic
export const OPCODE_DIV: u8 = 0xA8;  // div — Divide unsigned (R-only, no I variant)

// integer_arithmetic
export const OPCODE_SDIV: u8 = 0xAA;  // sdiv — Divide signed (R-only, no I variant)

// integer_memory
export const OPCODE_LDHS: u8 = 0xB4;  // ldhs — Load halfword signed

// system
export const OPCODE_SCALL: u8 = 0xBE;  // scall — System call dispatch — specific instruction in sub-opcode field (S-type)

// branching
export const OPCODE_UB: u8 = 0xC0;  // ub — Unconditional branch immediate (Bi-type)

// branching
export const OPCODE_UBR: u8 = 0xC2;  // ubr — Unconditional branch register (Bu-type)

// branching
export const OPCODE_BCOND: u8 = 0xC4;  // b — Conditional branch (Bc-type)

// branching
export const OPCODE_CALL: u8 = 0xC6;  // call — Call subroutine (Bi-type)

// branching
export const OPCODE_RET: u8 = 0xC8;  // ret — Return from subroutine (Bu-type)

// integer_memory
export const OPCODE_LDHZ: u8 = 0xD4;  // ldhz — Load halfword zero-extended


// ── Sub-opcodes ───────────────────────────────────────────────────────────────

// scall
export const SUB_SCALL_SYSCALL: u8 = 0x00;  // Invoke OS syscall; syscall number in r0

// scall
export const SUB_SCALL_SYSRET: u8 = 0x01;  // Return from syscall/exception handler

// scall
export const SUB_SCALL_HLT: u8 = 0x02;  // Halt processor

// scall
export const SUB_SCALL_MVCSR: u8 = 0x03;  // Move CSR to integer register

// scall
export const SUB_SCALL_MVCSR_W: u8 = 0x04;  // Move integer register to CSR

// scall
export const SUB_SCALL_IRET: u8 = 0x05;  // Return from interrupt

// scall
export const SUB_SCALL_TLBFLUSH: u8 = 0x06;  // Flush TLB (privileged)

// scall
export const SUB_SCALL_FENCE: u8 = 0x07;  // Memory fence / barrier


// ── Aliases ───────────────────────────────────────────────────────────────────

export const OPCODE_CMP: u8 = OPCODE_SUBS_I;  // Compare immediate (subs, result discarded)

export const OPCODE_CMPR: u8 = OPCODE_SUBS_R;  // Compare register (subs, result discarded)

export const OPCODE_NOP: u8 = OPCODE_ADD_I;  // No-op (add r0, r0, #0)


// ── Helpers ───────────────────────────────────────────────────────────────────
export function isImmediateOpcode(op: u8): bool { return (op & 1) == 0; }
export function isRegisterOpcode(op: u8):  bool { return (op & 1) == 1; }

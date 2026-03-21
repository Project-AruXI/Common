// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-03-20
// To update: edit opcodes.json then run scripts/generate.py

module opcodes

pub const aru_word_size     = u8(32)
pub const aru_opcode_bits   = u8(8)
pub const aru_int_registers = u8(16)
pub const aru_fp_registers  = u8(16)
pub const aru_vec_registers = u8(6)

// ── Opcodes ───────────────────────────────────────────────────────────────────

// extend
pub const opcode_sxb                    = u8(0x04)  // sxb — Sign-extend byte to word

// extend
pub const opcode_sxh                    = u8(0x05)  // sxh — Sign-extend halfword to word

// extend
pub const opcode_uxb                    = u8(0x06)  // uxb — Zero-extend byte to word

// extend
pub const opcode_uxh                    = u8(0x07)  // uxh — Zero-extend halfword to word

// integer_memory
pub const opcode_ld                     = u8(0x14)  // ld — Load word

// integer_memory
pub const opcode_str                    = u8(0x1C)  // str — Store word

// fp
pub const opcode_fadd                   = u8(0x20)  // fadd — FP add

// fp
pub const opcode_fsub                   = u8(0x21)  // fsub — FP subtract

// fp
pub const opcode_fmul                   = u8(0x22)  // fmul — FP multiply

// fp
pub const opcode_fdiv                   = u8(0x23)  // fdiv — FP divide

// fp
pub const opcode_fsqrt                  = u8(0x24)  // fsqrt — FP square root

// fp
pub const opcode_fmadd                  = u8(0x25)  // fmadd — FP fused multiply-add: fd = fs1*fs2 + fs3

// fp
pub const opcode_fmsub                  = u8(0x26)  // fmsub — FP fused multiply-subtract: fd = fs1*fs2 - fs3

// fp
pub const opcode_fnmadd                 = u8(0x27)  // fnmadd — FP negated fused multiply-add: fd = -(fs1*fs2 + fs3)

// fp
pub const opcode_fnmsub                 = u8(0x28)  // fnmsub — FP negated fused multiply-subtract

// fp
pub const opcode_fmin                   = u8(0x29)  // fmin — FP minimum

// fp
pub const opcode_fmax                   = u8(0x2A)  // fmax — FP maximum

// fp
pub const opcode_fabs                   = u8(0x2B)  // fabs — FP absolute value

// fp
pub const opcode_fneg                   = u8(0x2C)  // fneg — FP negate

// fp
pub const opcode_fclass                 = u8(0x2D)  // fclass — FP classify — result bitmask to int reg

// fp
pub const opcode_feq                    = u8(0x2E)  // feq — FP equal — result 0/1 to int reg

// fp
pub const opcode_flt                    = u8(0x2F)  // flt — FP less-than — result 0/1 to int reg

// fp
pub const opcode_fle                    = u8(0x30)  // fle — FP less-than-or-equal — result 0/1 to int reg

// fp
pub const opcode_fmv                    = u8(0x31)  // fmv — FP register copy

// fp
pub const opcode_fmv_x_s                = u8(0x32)  // fmv.x.s — FP to int reg — bit-pattern, no conversion

// fp
pub const opcode_fmv_s_x                = u8(0x33)  // fmv.s.x — Int reg to FP — bit-pattern, no conversion

// integer_memory
pub const opcode_ldb                    = u8(0x34)  // ldb — Load byte

// fp_memory
pub const opcode_flw                    = u8(0x35)  // flw — FP load word

// fp_memory
pub const opcode_fsw                    = u8(0x36)  // fsw — FP store word

// fp_convert
pub const opcode_fcvt_w_s               = u8(0x37)  // fcvt.w.s — FP to signed int32

// fp_convert
pub const opcode_fcvt_wu_s              = u8(0x38)  // fcvt.wu.s — FP to unsigned int32

// fp_convert
pub const opcode_fcvt_s_w               = u8(0x39)  // fcvt.s.w — Signed int32 to FP

// fp_convert
pub const opcode_fcvt_s_wu              = u8(0x3A)  // fcvt.s.wu — Unsigned int32 to FP

// fp_system
pub const opcode_fcsrr                  = u8(0x3B)  // fcsrr — Read FCSR to int reg

// integer_memory
pub const opcode_strb                   = u8(0x3C)  // strb — Store byte

// fp_system
pub const opcode_fcsrw                  = u8(0x3D)  // fcsrw — Write int reg to FCSR

// fp_system
pub const opcode_fcsrs                  = u8(0x3E)  // fcsrs — Swap int reg with FCSR

// integer_manipulation
pub const opcode_or_i                   = u8(0x40)  // or [I] — OR immediate

// integer_manipulation
pub const opcode_or_r                   = u8(0x41)  // or [R] — OR register

// integer_manipulation
pub const opcode_and_i                  = u8(0x42)  // and [I] — AND immediate

// integer_manipulation
pub const opcode_and_r                  = u8(0x43)  // and [R] — AND register

// integer_manipulation
pub const opcode_xor_i                  = u8(0x44)  // xor [I] — XOR immediate

// integer_manipulation
pub const opcode_xor_r                  = u8(0x45)  // xor [R] — XOR register

// integer_manipulation
pub const opcode_not_i                  = u8(0x46)  // not [I] — NOT immediate

// integer_manipulation
pub const opcode_not_r                  = u8(0x47)  // not [R] — NOT register

// integer_manipulation
pub const opcode_lsl_i                  = u8(0x48)  // lsl [I] — Logical shift left immediate

// integer_manipulation
pub const opcode_lsl_r                  = u8(0x49)  // lsl [R] — Logical shift left register

// integer_manipulation
pub const opcode_lsr_i                  = u8(0x4A)  // lsr [I] — Logical shift right immediate

// integer_manipulation
pub const opcode_lsr_r                  = u8(0x4B)  // lsr [R] — Logical shift right register

// integer_manipulation
pub const opcode_asr_i                  = u8(0x4C)  // asr [I] — Arithmetic shift right immediate

// integer_manipulation
pub const opcode_asr_r                  = u8(0x4D)  // asr [R] — Arithmetic shift right register

// integer_memory
pub const opcode_ldbs                   = u8(0x54)  // ldbs — Load byte signed

// integer_memory
pub const opcode_strh                   = u8(0x5C)  // strh — Store halfword

// avext
pub const opcode_vadd                   = u8(0x60)  // vadd — Vector element-wise add

// avext
pub const opcode_vsub                   = u8(0x61)  // vsub — Vector element-wise subtract

// avext
pub const opcode_vmul                   = u8(0x62)  // vmul — Vector element-wise multiply

// avext
pub const opcode_vdiv                   = u8(0x63)  // vdiv — Vector element-wise divide

// avext
pub const opcode_vfma                   = u8(0x64)  // vfma — Vector fused multiply-add

// avext
pub const opcode_vand                   = u8(0x65)  // vand — Vector bitwise AND

// avext
pub const opcode_vor                    = u8(0x66)  // vor — Vector bitwise OR

// avext
pub const opcode_vxor                   = u8(0x67)  // vxor — Vector bitwise XOR

// avext
pub const opcode_vnot                   = u8(0x68)  // vnot — Vector bitwise NOT

// avext
pub const opcode_vld                    = u8(0x69)  // vld — Vector load (512-bit)

// avext
pub const opcode_vst                    = u8(0x6A)  // vst — Vector store (512-bit)

// avext
pub const opcode_vmov                   = u8(0x6B)  // vmov — Vector register copy

// avext
pub const opcode_vbroadcast             = u8(0x6C)  // vbroadcast — Broadcast scalar to all lanes

// avext
pub const opcode_vextract               = u8(0x6D)  // vextract — Extract lane to int register

// avext
pub const opcode_vinsert                = u8(0x6E)  // vinsert — Insert int register into lane

// avext
pub const opcode_vcmp                   = u8(0x6F)  // vcmp — Vector compare, result mask to int reg

// avext
pub const opcode_vredsum                = u8(0x70)  // vredsum — Vector horizontal sum reduction

// avext
pub const opcode_vredmax                = u8(0x71)  // vredmax — Vector horizontal max reduction

// avext
pub const opcode_vredmin                = u8(0x72)  // vredmin — Vector horizontal min reduction

// avext
pub const opcode_vlsl                   = u8(0x73)  // vlsl — Vector logical shift left

// integer_memory
pub const opcode_ldbz                   = u8(0x74)  // ldbz — Load byte zero-extended

// avext
pub const opcode_vlsr                   = u8(0x75)  // vlsr — Vector logical shift right

// avext
pub const opcode_vasr                   = u8(0x76)  // vasr — Vector arithmetic shift right

// avext
pub const opcode_vsplat                 = u8(0x77)  // vsplat — Splat immediate into all lanes

// integer_arithmetic
pub const opcode_add_i                  = u8(0x80)  // add [I] — Add immediate

// integer_arithmetic
pub const opcode_add_r                  = u8(0x81)  // add [R] — Add register

// integer_manipulation
pub const opcode_mv_i                   = u8(0x84)  // mv [I] — Move immediate

// integer_manipulation
pub const opcode_mv_r                   = u8(0x85)  // mv [R] — Move register

// integer_arithmetic
pub const opcode_adds_i                 = u8(0x88)  // adds [I] — Add signed immediate

// integer_arithmetic
pub const opcode_adds_r                 = u8(0x89)  // adds [R] — Add signed register

// integer_arithmetic
pub const opcode_sub_i                  = u8(0x90)  // sub [I] — Subtract immediate

// integer_arithmetic
pub const opcode_sub_r                  = u8(0x91)  // sub [R] — Subtract register

// integer_memory
pub const opcode_ldh                    = u8(0x94)  // ldh — Load halfword

// integer_arithmetic
pub const opcode_subs_i                 = u8(0x98)  // subs [I] — Subtract signed immediate

// integer_arithmetic
pub const opcode_subs_r                 = u8(0x99)  // subs [R] — Subtract signed register

// integer_arithmetic
pub const opcode_mul                    = u8(0xA0)  // mul — Multiply unsigned (R-only, no I variant)

// integer_arithmetic
pub const opcode_smul                   = u8(0xA2)  // smul — Multiply signed (R-only, no I variant)

// integer_arithmetic
pub const opcode_div                    = u8(0xA8)  // div — Divide unsigned (R-only, no I variant)

// integer_arithmetic
pub const opcode_sdiv                   = u8(0xAA)  // sdiv — Divide signed (R-only, no I variant)

// integer_memory
pub const opcode_ldhs                   = u8(0xB4)  // ldhs — Load halfword signed

// system
pub const opcode_scall                  = u8(0xBE)  // scall — System call dispatch — specific instruction in sub-opcode field (S-type)

// branching
pub const opcode_ub                     = u8(0xC0)  // ub — Unconditional branch immediate (Bi-type)

// branching
pub const opcode_ubr                    = u8(0xC2)  // ubr — Unconditional branch register (Bu-type)

// branching
pub const opcode_bcond                  = u8(0xC4)  // b — Conditional branch (Bc-type)

// branching
pub const opcode_call                   = u8(0xC6)  // call — Call subroutine (Bi-type)

// branching
pub const opcode_ret                    = u8(0xC8)  // ret — Return from subroutine (Bu-type)

// integer_memory
pub const opcode_ldhz                   = u8(0xD4)  // ldhz — Load halfword zero-extended


// ── Sub-opcodes ───────────────────────────────────────────────────────────────

// scall
pub const sub_scall_syscall            = u8(0x00)  // Invoke OS syscall; syscall number in r0

// scall
pub const sub_scall_sysret             = u8(0x01)  // Return from syscall/exception handler

// scall
pub const sub_scall_hlt                = u8(0x02)  // Halt processor

// scall
pub const sub_scall_mvcsr              = u8(0x03)  // Move CSR to integer register

// scall
pub const sub_scall_mvcsr_w            = u8(0x04)  // Move integer register to CSR

// scall
pub const sub_scall_iret               = u8(0x05)  // Return from interrupt

// scall
pub const sub_scall_tlbflush           = u8(0x06)  // Flush TLB (privileged)

// scall
pub const sub_scall_fence              = u8(0x07)  // Memory fence / barrier


// ── Aliases ───────────────────────────────────────────────────────────────────

pub const opcode_cmp                    = opcode_subs_i  // Compare immediate (subs, result discarded)

pub const opcode_cmpr                   = opcode_subs_r  // Compare register (subs, result discarded)

pub const opcode_nop                    = opcode_add_i  // No-op (add r0, r0, #0)


// ── Reverse lookup ────────────────────────────────────────────────────────────
pub const opcode_names = {

	u8(0x04): 'sxb',

	u8(0x05): 'sxh',

	u8(0x06): 'uxb',

	u8(0x07): 'uxh',

	u8(0x14): 'ld',

	u8(0x1C): 'str',

	u8(0x20): 'fadd',

	u8(0x21): 'fsub',

	u8(0x22): 'fmul',

	u8(0x23): 'fdiv',

	u8(0x24): 'fsqrt',

	u8(0x25): 'fmadd',

	u8(0x26): 'fmsub',

	u8(0x27): 'fnmadd',

	u8(0x28): 'fnmsub',

	u8(0x29): 'fmin',

	u8(0x2A): 'fmax',

	u8(0x2B): 'fabs',

	u8(0x2C): 'fneg',

	u8(0x2D): 'fclass',

	u8(0x2E): 'feq',

	u8(0x2F): 'flt',

	u8(0x30): 'fle',

	u8(0x31): 'fmv',

	u8(0x32): 'fmv.x.s',

	u8(0x33): 'fmv.s.x',

	u8(0x34): 'ldb',

	u8(0x35): 'flw',

	u8(0x36): 'fsw',

	u8(0x37): 'fcvt.w.s',

	u8(0x38): 'fcvt.wu.s',

	u8(0x39): 'fcvt.s.w',

	u8(0x3A): 'fcvt.s.wu',

	u8(0x3B): 'fcsrr',

	u8(0x3C): 'strb',

	u8(0x3D): 'fcsrw',

	u8(0x3E): 'fcsrs',

	u8(0x40): 'or',

	u8(0x41): 'or',

	u8(0x42): 'and',

	u8(0x43): 'and',

	u8(0x44): 'xor',

	u8(0x45): 'xor',

	u8(0x46): 'not',

	u8(0x47): 'not',

	u8(0x48): 'lsl',

	u8(0x49): 'lsl',

	u8(0x4A): 'lsr',

	u8(0x4B): 'lsr',

	u8(0x4C): 'asr',

	u8(0x4D): 'asr',

	u8(0x54): 'ldbs',

	u8(0x5C): 'strh',

	u8(0x60): 'vadd',

	u8(0x61): 'vsub',

	u8(0x62): 'vmul',

	u8(0x63): 'vdiv',

	u8(0x64): 'vfma',

	u8(0x65): 'vand',

	u8(0x66): 'vor',

	u8(0x67): 'vxor',

	u8(0x68): 'vnot',

	u8(0x69): 'vld',

	u8(0x6A): 'vst',

	u8(0x6B): 'vmov',

	u8(0x6C): 'vbroadcast',

	u8(0x6D): 'vextract',

	u8(0x6E): 'vinsert',

	u8(0x6F): 'vcmp',

	u8(0x70): 'vredsum',

	u8(0x71): 'vredmax',

	u8(0x72): 'vredmin',

	u8(0x73): 'vlsl',

	u8(0x74): 'ldbz',

	u8(0x75): 'vlsr',

	u8(0x76): 'vasr',

	u8(0x77): 'vsplat',

	u8(0x80): 'add',

	u8(0x81): 'add',

	u8(0x84): 'mv',

	u8(0x85): 'mv',

	u8(0x88): 'adds',

	u8(0x89): 'adds',

	u8(0x90): 'sub',

	u8(0x91): 'sub',

	u8(0x94): 'ldh',

	u8(0x98): 'subs',

	u8(0x99): 'subs',

	u8(0xA0): 'mul',

	u8(0xA2): 'smul',

	u8(0xA8): 'div',

	u8(0xAA): 'sdiv',

	u8(0xB4): 'ldhs',

	u8(0xBE): 'scall',

	u8(0xC0): 'ub',

	u8(0xC2): 'ubr',

	u8(0xC4): 'b',

	u8(0xC6): 'call',

	u8(0xC8): 'ret',

	u8(0xD4): 'ldhz',

}

pub fn is_immediate_opcode(op u8) bool { return op & 1 == 0 }
pub fn is_register_opcode(op u8)  bool { return op & 1 == 1 }

// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-03-20
// To update: edit opcodes.json then run scripts/generate.py

const std = @import("std");

pub const meta = .{
    .word_size     = 32,
    .opcode_bits   = 8,
    .int_registers = 16,
    .fp_registers  = 16,
    .vec_registers = 6,
};

// ── Opcodes ───────────────────────────────────────────────────────────────────
// I/R pairs share a mnemonic. The I-variant opcode is even, R-variant is odd.
pub const Opcode = enum(u8) {

    // extend
    sxb                    = 0x04,  // sxb — Sign-extend byte to word

    // extend
    sxh                    = 0x05,  // sxh — Sign-extend halfword to word

    // extend
    uxb                    = 0x06,  // uxb — Zero-extend byte to word

    // extend
    uxh                    = 0x07,  // uxh — Zero-extend halfword to word

    // integer_memory
    ld                     = 0x14,  // ld — Load word

    // integer_memory
    str                    = 0x1C,  // str — Store word

    // fp
    fadd                   = 0x20,  // fadd — FP add

    // fp
    fsub                   = 0x21,  // fsub — FP subtract

    // fp
    fmul                   = 0x22,  // fmul — FP multiply

    // fp
    fdiv                   = 0x23,  // fdiv — FP divide

    // fp
    fsqrt                  = 0x24,  // fsqrt — FP square root

    // fp
    fmadd                  = 0x25,  // fmadd — FP fused multiply-add: fd = fs1*fs2 + fs3

    // fp
    fmsub                  = 0x26,  // fmsub — FP fused multiply-subtract: fd = fs1*fs2 - fs3

    // fp
    fnmadd                 = 0x27,  // fnmadd — FP negated fused multiply-add: fd = -(fs1*fs2 + fs3)

    // fp
    fnmsub                 = 0x28,  // fnmsub — FP negated fused multiply-subtract

    // fp
    fmin                   = 0x29,  // fmin — FP minimum

    // fp
    fmax                   = 0x2A,  // fmax — FP maximum

    // fp
    fabs                   = 0x2B,  // fabs — FP absolute value

    // fp
    fneg                   = 0x2C,  // fneg — FP negate

    // fp
    fclass                 = 0x2D,  // fclass — FP classify — result bitmask to int reg

    // fp
    feq                    = 0x2E,  // feq — FP equal — result 0/1 to int reg

    // fp
    flt                    = 0x2F,  // flt — FP less-than — result 0/1 to int reg

    // fp
    fle                    = 0x30,  // fle — FP less-than-or-equal — result 0/1 to int reg

    // fp
    fmv                    = 0x31,  // fmv — FP register copy

    // fp
    fmv_x_s                = 0x32,  // fmv.x.s — FP to int reg — bit-pattern, no conversion

    // fp
    fmv_s_x                = 0x33,  // fmv.s.x — Int reg to FP — bit-pattern, no conversion

    // integer_memory
    ldb                    = 0x34,  // ldb — Load byte

    // fp_memory
    flw                    = 0x35,  // flw — FP load word

    // fp_memory
    fsw                    = 0x36,  // fsw — FP store word

    // fp_convert
    fcvt_w_s               = 0x37,  // fcvt.w.s — FP to signed int32

    // fp_convert
    fcvt_wu_s              = 0x38,  // fcvt.wu.s — FP to unsigned int32

    // fp_convert
    fcvt_s_w               = 0x39,  // fcvt.s.w — Signed int32 to FP

    // fp_convert
    fcvt_s_wu              = 0x3A,  // fcvt.s.wu — Unsigned int32 to FP

    // fp_system
    fcsrr                  = 0x3B,  // fcsrr — Read FCSR to int reg

    // integer_memory
    strb                   = 0x3C,  // strb — Store byte

    // fp_system
    fcsrw                  = 0x3D,  // fcsrw — Write int reg to FCSR

    // fp_system
    fcsrs                  = 0x3E,  // fcsrs — Swap int reg with FCSR

    // integer_manipulation
    or_i                   = 0x40,  // or [I] — OR immediate

    // integer_manipulation
    or_r                   = 0x41,  // or [R] — OR register

    // integer_manipulation
    and_i                  = 0x42,  // and [I] — AND immediate

    // integer_manipulation
    and_r                  = 0x43,  // and [R] — AND register

    // integer_manipulation
    xor_i                  = 0x44,  // xor [I] — XOR immediate

    // integer_manipulation
    xor_r                  = 0x45,  // xor [R] — XOR register

    // integer_manipulation
    not_i                  = 0x46,  // not [I] — NOT immediate

    // integer_manipulation
    not_r                  = 0x47,  // not [R] — NOT register

    // integer_manipulation
    lsl_i                  = 0x48,  // lsl [I] — Logical shift left immediate

    // integer_manipulation
    lsl_r                  = 0x49,  // lsl [R] — Logical shift left register

    // integer_manipulation
    lsr_i                  = 0x4A,  // lsr [I] — Logical shift right immediate

    // integer_manipulation
    lsr_r                  = 0x4B,  // lsr [R] — Logical shift right register

    // integer_manipulation
    asr_i                  = 0x4C,  // asr [I] — Arithmetic shift right immediate

    // integer_manipulation
    asr_r                  = 0x4D,  // asr [R] — Arithmetic shift right register

    // integer_memory
    ldbs                   = 0x54,  // ldbs — Load byte signed

    // integer_memory
    strh                   = 0x5C,  // strh — Store halfword

    // avext
    vadd                   = 0x60,  // vadd — Vector element-wise add

    // avext
    vsub                   = 0x61,  // vsub — Vector element-wise subtract

    // avext
    vmul                   = 0x62,  // vmul — Vector element-wise multiply

    // avext
    vdiv                   = 0x63,  // vdiv — Vector element-wise divide

    // avext
    vfma                   = 0x64,  // vfma — Vector fused multiply-add

    // avext
    vand                   = 0x65,  // vand — Vector bitwise AND

    // avext
    vor                    = 0x66,  // vor — Vector bitwise OR

    // avext
    vxor                   = 0x67,  // vxor — Vector bitwise XOR

    // avext
    vnot                   = 0x68,  // vnot — Vector bitwise NOT

    // avext
    vld                    = 0x69,  // vld — Vector load (512-bit)

    // avext
    vst                    = 0x6A,  // vst — Vector store (512-bit)

    // avext
    vmov                   = 0x6B,  // vmov — Vector register copy

    // avext
    vbroadcast             = 0x6C,  // vbroadcast — Broadcast scalar to all lanes

    // avext
    vextract               = 0x6D,  // vextract — Extract lane to int register

    // avext
    vinsert                = 0x6E,  // vinsert — Insert int register into lane

    // avext
    vcmp                   = 0x6F,  // vcmp — Vector compare, result mask to int reg

    // avext
    vredsum                = 0x70,  // vredsum — Vector horizontal sum reduction

    // avext
    vredmax                = 0x71,  // vredmax — Vector horizontal max reduction

    // avext
    vredmin                = 0x72,  // vredmin — Vector horizontal min reduction

    // avext
    vlsl                   = 0x73,  // vlsl — Vector logical shift left

    // integer_memory
    ldbz                   = 0x74,  // ldbz — Load byte zero-extended

    // avext
    vlsr                   = 0x75,  // vlsr — Vector logical shift right

    // avext
    vasr                   = 0x76,  // vasr — Vector arithmetic shift right

    // avext
    vsplat                 = 0x77,  // vsplat — Splat immediate into all lanes

    // integer_arithmetic
    add_i                  = 0x80,  // add [I] — Add immediate

    // integer_arithmetic
    add_r                  = 0x81,  // add [R] — Add register

    // integer_manipulation
    mv_i                   = 0x84,  // mv [I] — Move immediate

    // integer_manipulation
    mv_r                   = 0x85,  // mv [R] — Move register

    // integer_arithmetic
    adds_i                 = 0x88,  // adds [I] — Add signed immediate

    // integer_arithmetic
    adds_r                 = 0x89,  // adds [R] — Add signed register

    // integer_arithmetic
    sub_i                  = 0x90,  // sub [I] — Subtract immediate

    // integer_arithmetic
    sub_r                  = 0x91,  // sub [R] — Subtract register

    // integer_memory
    ldh                    = 0x94,  // ldh — Load halfword

    // integer_arithmetic
    subs_i                 = 0x98,  // subs [I] — Subtract signed immediate

    // integer_arithmetic
    subs_r                 = 0x99,  // subs [R] — Subtract signed register

    // integer_arithmetic
    mul                    = 0xA0,  // mul — Multiply unsigned (R-only, no I variant)

    // integer_arithmetic
    smul                   = 0xA2,  // smul — Multiply signed (R-only, no I variant)

    // integer_arithmetic
    div                    = 0xA8,  // div — Divide unsigned (R-only, no I variant)

    // integer_arithmetic
    sdiv                   = 0xAA,  // sdiv — Divide signed (R-only, no I variant)

    // integer_memory
    ldhs                   = 0xB4,  // ldhs — Load halfword signed

    // system
    scall                  = 0xBE,  // scall — System call dispatch — specific instruction in sub-opcode field (S-type)

    // branching
    ub                     = 0xC0,  // ub — Unconditional branch immediate (Bi-type)

    // branching
    ubr                    = 0xC2,  // ubr — Unconditional branch register (Bu-type)

    // branching
    bcond                  = 0xC4,  // b — Conditional branch (Bc-type)

    // branching
    call                   = 0xC6,  // call — Call subroutine (Bi-type)

    // branching
    ret                    = 0xC8,  // ret — Return from subroutine (Bu-type)

    // integer_memory
    ldhz                   = 0xD4,  // ldhz — Load halfword zero-extended


    pub fn fromByte(b: u8) ?Opcode {
        return std.meta.intToEnum(Opcode, b) catch null;
    }
    pub fn mnemonic(self: Opcode) []const u8 {
        return switch (self) {

            .sxb                    => "sxb",

            .sxh                    => "sxh",

            .uxb                    => "uxb",

            .uxh                    => "uxh",

            .ld                     => "ld",

            .str                    => "str",

            .fadd                   => "fadd",

            .fsub                   => "fsub",

            .fmul                   => "fmul",

            .fdiv                   => "fdiv",

            .fsqrt                  => "fsqrt",

            .fmadd                  => "fmadd",

            .fmsub                  => "fmsub",

            .fnmadd                 => "fnmadd",

            .fnmsub                 => "fnmsub",

            .fmin                   => "fmin",

            .fmax                   => "fmax",

            .fabs                   => "fabs",

            .fneg                   => "fneg",

            .fclass                 => "fclass",

            .feq                    => "feq",

            .flt                    => "flt",

            .fle                    => "fle",

            .fmv                    => "fmv",

            .fmv_x_s                => "fmv.x.s",

            .fmv_s_x                => "fmv.s.x",

            .ldb                    => "ldb",

            .flw                    => "flw",

            .fsw                    => "fsw",

            .fcvt_w_s               => "fcvt.w.s",

            .fcvt_wu_s              => "fcvt.wu.s",

            .fcvt_s_w               => "fcvt.s.w",

            .fcvt_s_wu              => "fcvt.s.wu",

            .fcsrr                  => "fcsrr",

            .strb                   => "strb",

            .fcsrw                  => "fcsrw",

            .fcsrs                  => "fcsrs",

            .or_i                   => "or",

            .or_r                   => "or",

            .and_i                  => "and",

            .and_r                  => "and",

            .xor_i                  => "xor",

            .xor_r                  => "xor",

            .not_i                  => "not",

            .not_r                  => "not",

            .lsl_i                  => "lsl",

            .lsl_r                  => "lsl",

            .lsr_i                  => "lsr",

            .lsr_r                  => "lsr",

            .asr_i                  => "asr",

            .asr_r                  => "asr",

            .ldbs                   => "ldbs",

            .strh                   => "strh",

            .vadd                   => "vadd",

            .vsub                   => "vsub",

            .vmul                   => "vmul",

            .vdiv                   => "vdiv",

            .vfma                   => "vfma",

            .vand                   => "vand",

            .vor                    => "vor",

            .vxor                   => "vxor",

            .vnot                   => "vnot",

            .vld                    => "vld",

            .vst                    => "vst",

            .vmov                   => "vmov",

            .vbroadcast             => "vbroadcast",

            .vextract               => "vextract",

            .vinsert                => "vinsert",

            .vcmp                   => "vcmp",

            .vredsum                => "vredsum",

            .vredmax                => "vredmax",

            .vredmin                => "vredmin",

            .vlsl                   => "vlsl",

            .ldbz                   => "ldbz",

            .vlsr                   => "vlsr",

            .vasr                   => "vasr",

            .vsplat                 => "vsplat",

            .add_i                  => "add",

            .add_r                  => "add",

            .mv_i                   => "mv",

            .mv_r                   => "mv",

            .adds_i                 => "adds",

            .adds_r                 => "adds",

            .sub_i                  => "sub",

            .sub_r                  => "sub",

            .ldh                    => "ldh",

            .subs_i                 => "subs",

            .subs_r                 => "subs",

            .mul                    => "mul",

            .smul                   => "smul",

            .div                    => "div",

            .sdiv                   => "sdiv",

            .ldhs                   => "ldhs",

            .scall                  => "scall",

            .ub                     => "ub",

            .ubr                    => "ubr",

            .bcond                  => "b",

            .call                   => "call",

            .ret                    => "ret",

            .ldhz                   => "ldhz",

        };
    }
    pub fn isImmediate(self: Opcode) bool { return (@intFromEnum(self) & 1) == 0; }
    pub fn isRegister(self: Opcode)  bool { return (@intFromEnum(self) & 1) == 1; }
};

// ── Sub-opcodes ───────────────────────────────────────────────────────────────

pub const ScallSubOp = enum(u8) {

    syscall              = 0x00,  // Invoke OS syscall; syscall number in r0

    sysret               = 0x01,  // Return from syscall/exception handler

    hlt                  = 0x02,  // Halt processor

    mvcsr                = 0x03,  // Move CSR to integer register

    mvcsr_w              = 0x04,  // Move integer register to CSR

    iret                 = 0x05,  // Return from interrupt

    tlbflush             = 0x06,  // Flush TLB (privileged)

    fence                = 0x07,  // Memory fence / barrier

};


// ── Aliases ───────────────────────────────────────────────────────────────────

pub const cmp                    = Opcode.subs_i;  // Compare immediate (subs, result discarded)

pub const cmpr                   = Opcode.subs_r;  // Compare register (subs, result discarded)

pub const nop                    = Opcode.add_i;  // No-op (add r0, r0, #0)


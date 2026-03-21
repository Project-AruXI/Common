// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-03-20
// To update: edit opcodes.json then run scripts/generate.py

#pragma once
#include <stdint.h>

/* ISA constants */
#define ARU_WORD_SIZE      32
#define ARU_OPCODE_BITS    8
#define ARU_INT_REGISTERS  16
#define ARU_FP_REGISTERS   16
#define ARU_VEC_REGISTERS  6

/* ── Opcodes ──────────────────────────────────────────────────────────────────
 * Naming: OPCODE_<KEY> where key is the internal JSON key.
 * For I/R pairs, both share the same mnemonic in assembly.
 * I-variant opcodes are even (bit 0 = 0); R-variant opcodes are odd (bit 0 = 1).
 * Use the MNEMONIC_DISPATCH table below to map a mnemonic string to both opcodes.
 * --------------------------------------------------------------------------- */

/* extend */
#define OPCODE_SXB                    ((uint8_t)0x04U)  /* sxb — Sign-extend byte to word */

/* extend */
#define OPCODE_SXH                    ((uint8_t)0x05U)  /* sxh — Sign-extend halfword to word */

/* extend */
#define OPCODE_UXB                    ((uint8_t)0x06U)  /* uxb — Zero-extend byte to word */

/* extend */
#define OPCODE_UXH                    ((uint8_t)0x07U)  /* uxh — Zero-extend halfword to word */

/* integer_memory */
#define OPCODE_LD                     ((uint8_t)0x14U)  /* ld — Load word */

/* integer_memory */
#define OPCODE_STR                    ((uint8_t)0x1CU)  /* str — Store word */

/* fp */
#define OPCODE_FADD                   ((uint8_t)0x20U)  /* fadd — FP add */

/* fp */
#define OPCODE_FSUB                   ((uint8_t)0x21U)  /* fsub — FP subtract */

/* fp */
#define OPCODE_FMUL                   ((uint8_t)0x22U)  /* fmul — FP multiply */

/* fp */
#define OPCODE_FDIV                   ((uint8_t)0x23U)  /* fdiv — FP divide */

/* fp */
#define OPCODE_FSQRT                  ((uint8_t)0x24U)  /* fsqrt — FP square root */

/* fp */
#define OPCODE_FMADD                  ((uint8_t)0x25U)  /* fmadd — FP fused multiply-add: fd = fs1*fs2 + fs3 */

/* fp */
#define OPCODE_FMSUB                  ((uint8_t)0x26U)  /* fmsub — FP fused multiply-subtract: fd = fs1*fs2 - fs3 */

/* fp */
#define OPCODE_FNMADD                 ((uint8_t)0x27U)  /* fnmadd — FP negated fused multiply-add: fd = -(fs1*fs2 + fs3) */

/* fp */
#define OPCODE_FNMSUB                 ((uint8_t)0x28U)  /* fnmsub — FP negated fused multiply-subtract */

/* fp */
#define OPCODE_FMIN                   ((uint8_t)0x29U)  /* fmin — FP minimum */

/* fp */
#define OPCODE_FMAX                   ((uint8_t)0x2AU)  /* fmax — FP maximum */

/* fp */
#define OPCODE_FABS                   ((uint8_t)0x2BU)  /* fabs — FP absolute value */

/* fp */
#define OPCODE_FNEG                   ((uint8_t)0x2CU)  /* fneg — FP negate */

/* fp */
#define OPCODE_FCLASS                 ((uint8_t)0x2DU)  /* fclass — FP classify — result bitmask to int reg */

/* fp */
#define OPCODE_FEQ                    ((uint8_t)0x2EU)  /* feq — FP equal — result 0/1 to int reg */

/* fp */
#define OPCODE_FLT                    ((uint8_t)0x2FU)  /* flt — FP less-than — result 0/1 to int reg */

/* fp */
#define OPCODE_FLE                    ((uint8_t)0x30U)  /* fle — FP less-than-or-equal — result 0/1 to int reg */

/* fp */
#define OPCODE_FMV                    ((uint8_t)0x31U)  /* fmv — FP register copy */

/* fp */
#define OPCODE_FMV_X_S                ((uint8_t)0x32U)  /* fmv.x.s — FP to int reg — bit-pattern, no conversion */

/* fp */
#define OPCODE_FMV_S_X                ((uint8_t)0x33U)  /* fmv.s.x — Int reg to FP — bit-pattern, no conversion */

/* integer_memory */
#define OPCODE_LDB                    ((uint8_t)0x34U)  /* ldb — Load byte */

/* fp_memory */
#define OPCODE_FLW                    ((uint8_t)0x35U)  /* flw — FP load word */

/* fp_memory */
#define OPCODE_FSW                    ((uint8_t)0x36U)  /* fsw — FP store word */

/* fp_convert */
#define OPCODE_FCVT_W_S               ((uint8_t)0x37U)  /* fcvt.w.s — FP to signed int32 */

/* fp_convert */
#define OPCODE_FCVT_WU_S              ((uint8_t)0x38U)  /* fcvt.wu.s — FP to unsigned int32 */

/* fp_convert */
#define OPCODE_FCVT_S_W               ((uint8_t)0x39U)  /* fcvt.s.w — Signed int32 to FP */

/* fp_convert */
#define OPCODE_FCVT_S_WU              ((uint8_t)0x3AU)  /* fcvt.s.wu — Unsigned int32 to FP */

/* fp_system */
#define OPCODE_FCSRR                  ((uint8_t)0x3BU)  /* fcsrr — Read FCSR to int reg */

/* integer_memory */
#define OPCODE_STRB                   ((uint8_t)0x3CU)  /* strb — Store byte */

/* fp_system */
#define OPCODE_FCSRW                  ((uint8_t)0x3DU)  /* fcsrw — Write int reg to FCSR */

/* fp_system */
#define OPCODE_FCSRS                  ((uint8_t)0x3EU)  /* fcsrs — Swap int reg with FCSR */

/* integer_manipulation [I-type, pair=or_r] */
#define OPCODE_OR_I                   ((uint8_t)0x40U)  /* or — OR immediate */

/* integer_manipulation [R-type, pair=or_i] */
#define OPCODE_OR_R                   ((uint8_t)0x41U)  /* or — OR register */

/* integer_manipulation [I-type, pair=and_r] */
#define OPCODE_AND_I                  ((uint8_t)0x42U)  /* and — AND immediate */

/* integer_manipulation [R-type, pair=and_i] */
#define OPCODE_AND_R                  ((uint8_t)0x43U)  /* and — AND register */

/* integer_manipulation [I-type, pair=xor_r] */
#define OPCODE_XOR_I                  ((uint8_t)0x44U)  /* xor — XOR immediate */

/* integer_manipulation [R-type, pair=xor_i] */
#define OPCODE_XOR_R                  ((uint8_t)0x45U)  /* xor — XOR register */

/* integer_manipulation [I-type, pair=not_r] */
#define OPCODE_NOT_I                  ((uint8_t)0x46U)  /* not — NOT immediate */

/* integer_manipulation [R-type, pair=not_i] */
#define OPCODE_NOT_R                  ((uint8_t)0x47U)  /* not — NOT register */

/* integer_manipulation [I-type, pair=lsl_r] */
#define OPCODE_LSL_I                  ((uint8_t)0x48U)  /* lsl — Logical shift left immediate */

/* integer_manipulation [R-type, pair=lsl_i] */
#define OPCODE_LSL_R                  ((uint8_t)0x49U)  /* lsl — Logical shift left register */

/* integer_manipulation [I-type, pair=lsr_r] */
#define OPCODE_LSR_I                  ((uint8_t)0x4AU)  /* lsr — Logical shift right immediate */

/* integer_manipulation [R-type, pair=lsr_i] */
#define OPCODE_LSR_R                  ((uint8_t)0x4BU)  /* lsr — Logical shift right register */

/* integer_manipulation [I-type, pair=asr_r] */
#define OPCODE_ASR_I                  ((uint8_t)0x4CU)  /* asr — Arithmetic shift right immediate */

/* integer_manipulation [R-type, pair=asr_i] */
#define OPCODE_ASR_R                  ((uint8_t)0x4DU)  /* asr — Arithmetic shift right register */

/* integer_memory */
#define OPCODE_LDBS                   ((uint8_t)0x54U)  /* ldbs — Load byte signed */

/* integer_memory */
#define OPCODE_STRH                   ((uint8_t)0x5CU)  /* strh — Store halfword */

/* avext */
#define OPCODE_VADD                   ((uint8_t)0x60U)  /* vadd — Vector element-wise add */

/* avext */
#define OPCODE_VSUB                   ((uint8_t)0x61U)  /* vsub — Vector element-wise subtract */

/* avext */
#define OPCODE_VMUL                   ((uint8_t)0x62U)  /* vmul — Vector element-wise multiply */

/* avext */
#define OPCODE_VDIV                   ((uint8_t)0x63U)  /* vdiv — Vector element-wise divide */

/* avext */
#define OPCODE_VFMA                   ((uint8_t)0x64U)  /* vfma — Vector fused multiply-add */

/* avext */
#define OPCODE_VAND                   ((uint8_t)0x65U)  /* vand — Vector bitwise AND */

/* avext */
#define OPCODE_VOR                    ((uint8_t)0x66U)  /* vor — Vector bitwise OR */

/* avext */
#define OPCODE_VXOR                   ((uint8_t)0x67U)  /* vxor — Vector bitwise XOR */

/* avext */
#define OPCODE_VNOT                   ((uint8_t)0x68U)  /* vnot — Vector bitwise NOT */

/* avext */
#define OPCODE_VLD                    ((uint8_t)0x69U)  /* vld — Vector load (512-bit) */

/* avext */
#define OPCODE_VST                    ((uint8_t)0x6AU)  /* vst — Vector store (512-bit) */

/* avext */
#define OPCODE_VMOV                   ((uint8_t)0x6BU)  /* vmov — Vector register copy */

/* avext */
#define OPCODE_VBROADCAST             ((uint8_t)0x6CU)  /* vbroadcast — Broadcast scalar to all lanes */

/* avext */
#define OPCODE_VEXTRACT               ((uint8_t)0x6DU)  /* vextract — Extract lane to int register */

/* avext */
#define OPCODE_VINSERT                ((uint8_t)0x6EU)  /* vinsert — Insert int register into lane */

/* avext */
#define OPCODE_VCMP                   ((uint8_t)0x6FU)  /* vcmp — Vector compare, result mask to int reg */

/* avext */
#define OPCODE_VREDSUM                ((uint8_t)0x70U)  /* vredsum — Vector horizontal sum reduction */

/* avext */
#define OPCODE_VREDMAX                ((uint8_t)0x71U)  /* vredmax — Vector horizontal max reduction */

/* avext */
#define OPCODE_VREDMIN                ((uint8_t)0x72U)  /* vredmin — Vector horizontal min reduction */

/* avext */
#define OPCODE_VLSL                   ((uint8_t)0x73U)  /* vlsl — Vector logical shift left */

/* integer_memory */
#define OPCODE_LDBZ                   ((uint8_t)0x74U)  /* ldbz — Load byte zero-extended */

/* avext */
#define OPCODE_VLSR                   ((uint8_t)0x75U)  /* vlsr — Vector logical shift right */

/* avext */
#define OPCODE_VASR                   ((uint8_t)0x76U)  /* vasr — Vector arithmetic shift right */

/* avext */
#define OPCODE_VSPLAT                 ((uint8_t)0x77U)  /* vsplat — Splat immediate into all lanes */

/* integer_arithmetic [I-type, pair=add_r] */
#define OPCODE_ADD_I                  ((uint8_t)0x80U)  /* add — Add immediate */

/* integer_arithmetic [R-type, pair=add_i] */
#define OPCODE_ADD_R                  ((uint8_t)0x81U)  /* add — Add register */

/* integer_manipulation [I-type, pair=mv_r] */
#define OPCODE_MV_I                   ((uint8_t)0x84U)  /* mv — Move immediate */

/* integer_manipulation [R-type, pair=mv_i] */
#define OPCODE_MV_R                   ((uint8_t)0x85U)  /* mv — Move register */

/* integer_arithmetic [I-type, pair=adds_r] */
#define OPCODE_ADDS_I                 ((uint8_t)0x88U)  /* adds — Add signed immediate */

/* integer_arithmetic [R-type, pair=adds_i] */
#define OPCODE_ADDS_R                 ((uint8_t)0x89U)  /* adds — Add signed register */

/* integer_arithmetic [I-type, pair=sub_r] */
#define OPCODE_SUB_I                  ((uint8_t)0x90U)  /* sub — Subtract immediate */

/* integer_arithmetic [R-type, pair=sub_i] */
#define OPCODE_SUB_R                  ((uint8_t)0x91U)  /* sub — Subtract register */

/* integer_memory */
#define OPCODE_LDH                    ((uint8_t)0x94U)  /* ldh — Load halfword */

/* integer_arithmetic [I-type, pair=subs_r] */
#define OPCODE_SUBS_I                 ((uint8_t)0x98U)  /* subs — Subtract signed immediate */

/* integer_arithmetic [R-type, pair=subs_i] */
#define OPCODE_SUBS_R                 ((uint8_t)0x99U)  /* subs — Subtract signed register */

/* integer_arithmetic */
#define OPCODE_MUL                    ((uint8_t)0xA0U)  /* mul — Multiply unsigned (R-only, no I variant) */

/* integer_arithmetic */
#define OPCODE_SMUL                   ((uint8_t)0xA2U)  /* smul — Multiply signed (R-only, no I variant) */

/* integer_arithmetic */
#define OPCODE_DIV                    ((uint8_t)0xA8U)  /* div — Divide unsigned (R-only, no I variant) */

/* integer_arithmetic */
#define OPCODE_SDIV                   ((uint8_t)0xAAU)  /* sdiv — Divide signed (R-only, no I variant) */

/* integer_memory */
#define OPCODE_LDHS                   ((uint8_t)0xB4U)  /* ldhs — Load halfword signed */

/* system */
#define OPCODE_SCALL                  ((uint8_t)0xBEU)  /* scall — System call dispatch — specific instruction in sub-opcode field (S-type) */

/* branching */
#define OPCODE_UB                     ((uint8_t)0xC0U)  /* ub — Unconditional branch immediate (Bi-type) */

/* branching */
#define OPCODE_UBR                    ((uint8_t)0xC2U)  /* ubr — Unconditional branch register (Bu-type) */

/* branching */
#define OPCODE_BCOND                  ((uint8_t)0xC4U)  /* b — Conditional branch (Bc-type) */

/* branching */
#define OPCODE_CALL                   ((uint8_t)0xC6U)  /* call — Call subroutine (Bi-type) */

/* branching */
#define OPCODE_RET                    ((uint8_t)0xC8U)  /* ret — Return from subroutine (Bu-type) */

/* integer_memory */
#define OPCODE_LDHZ                   ((uint8_t)0xD4U)  /* ldhz — Load halfword zero-extended */


/* ── Sub-opcodes ────────────────────────────────────────────────────────────── */

/* scall */
#define SUB_SCALL_SYSCALL            ((uint8_t)0x00U)  /* Invoke OS syscall; syscall number in r0 */

/* scall */
#define SUB_SCALL_SYSRET             ((uint8_t)0x01U)  /* Return from syscall/exception handler */

/* scall */
#define SUB_SCALL_HLT                ((uint8_t)0x02U)  /* Halt processor */

/* scall */
#define SUB_SCALL_MVCSR              ((uint8_t)0x03U)  /* Move CSR to integer register */

/* scall */
#define SUB_SCALL_MVCSR_W            ((uint8_t)0x04U)  /* Move integer register to CSR */

/* scall */
#define SUB_SCALL_IRET               ((uint8_t)0x05U)  /* Return from interrupt */

/* scall */
#define SUB_SCALL_TLBFLUSH           ((uint8_t)0x06U)  /* Flush TLB (privileged) */

/* scall */
#define SUB_SCALL_FENCE              ((uint8_t)0x07U)  /* Memory fence / barrier */


/* ── Aliases ────────────────────────────────────────────────────────────────── */

#define OPCODE_CMP                    OPCODE_SUBS_I                  /* Compare immediate (subs, result discarded) */

#define OPCODE_CMPR                   OPCODE_SUBS_R                  /* Compare register (subs, result discarded) */

#define OPCODE_NOP                    OPCODE_ADD_I                   /* No-op (add r0, r0, #0) */


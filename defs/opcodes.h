// AUTO-GENERATED — DO NOT EDIT
// Source: opcodes.json  |  ISA: Aru32 v1.1.0  |  Generated: 2026-05-13
// To update: edit opcodes.json then run scripts/generate.py

#pragma once
#include <stdint.h>

/* ISA constants */
#define ARU_WORD_SIZE 32
#define ARU_OPCODE_BITS 8
#define ARU_INT_REGISTERS 32
#define ARU_FP_REGISTERS 16
#define ARU_VEC_REGISTERS 6

/* ── Opcodes ──────────────────────────────────────────────────────────────────
 * Naming: OPCODE_<KEY> where key is the internal JSON key.
 * For I/R pairs, both share the same mnemonic in assembly.
 * I-variant opcodes are even (bit 0 = 0); R-variant opcodes are odd (bit 0 = 1).
 * Use the MNEMONIC_DISPATCH table below to map a mnemonic string to both opcodes.
 * --------------------------------------------------------------------------- */

/* Bi */
#define OPCODE_UB ((uint8_t)0x5BU) /* ub —  */

/* Bu */
#define OPCODE_UBR ((uint8_t)0x5CU) /* ubr —  */

/* Bc */
#define OPCODE_B ((uint8_t)0x5DU) /* b —  */

/* Bi */
#define OPCODE_CALL ((uint8_t)0x5EU) /* call —  */

/* Bu */
#define OPCODE_RET ((uint8_t)0x5FU) /* ret —  */

/* FM */
#define OPCODE_ADDF ((uint8_t)0x6EU) /* addf — FP add */

/* fp */
#define OPCODE_SUBF ((uint8_t)0x6FU) /* subf — FP subtract */

/* fp */
#define OPCODE_MULF ((uint8_t)0x70U) /* mulf — FP multiply */

/* fp */
#define OPCODE_DIVF ((uint8_t)0x71U) /* divf — FP divide */

/* fp */
#define OPCODE_SQRTF ((uint8_t)0x72U) /* sqrtf — FP square root */

/* fp */
#define OPCODE_MINF ((uint8_t)0x73U) /* minf — FP minimum */

/* fp */
#define OPCODE_MAXF ((uint8_t)0x74U) /* maxf — FP maximum */

/* fp */
#define OPCODE_ABSF ((uint8_t)0x75U) /* absf — FP absolute value */

/* fp */
#define OPCODE_NEGF ((uint8_t)0x76U) /* negf — FP negate */

/*  */
#define OPCODE_FUSEDF ((uint8_t)0x77U) /* fusedf — FP fused operations */

/* fp */
#define OPCODE_MVF ((uint8_t)0x7DU) /* mvf — FP register copy */

/* fp */
#define OPCODE_MVFI ((uint8_t)0x7EU) /* mvfi — FP to int reg — bit-pattern, no conversion */

/* fp */
#define OPCODE_MVIF ((uint8_t)0x7FU) /* mvif — Int reg to FP — bit-pattern, no conversion */

/* fp_convert */
#define OPCODE_CVTFU ((uint8_t)0x80U) /* cvtfu — FP to unsigned int32 */

/* fp_convert */
#define OPCODE_CVTFS ((uint8_t)0x81U) /* cvtfs — FP to signed int32 */

/* fp_convert */
#define OPCODE_CVTUF ((uint8_t)0x82U) /* cvtuf — Unsigned int32 to FP */

/* fp_convert */
#define OPCODE_CVTSF ((uint8_t)0x83U) /* cvtsf — Signed int32 to FP */

/* fp */
#define OPCODE_CLASSF ((uint8_t)0x87U) /* classf — FP classify — result bitmask to int reg */

/* fp */
#define OPCODE_CMPF ((uint8_t)0x88U) /* cmpf — Compare FP */

/* fp */
#define OPCODE_CMPFE ((uint8_t)0x89U) /* cmpfe — Compare FP, exception raise */

/* I */
#define OPCODE_ADD_I ((uint8_t)0x90U) /* add —  */

/* R */
#define OPCODE_ADD_R ((uint8_t)0x91U) /* add —  */

/* I */
#define OPCODE_ADDS_I ((uint8_t)0x92U) /* adds —  */

/* R */
#define OPCODE_ADDS_R ((uint8_t)0x93U) /* adds —  */

/* I */
#define OPCODE_SUB_I ((uint8_t)0x94U) /* sub —  */

/* R */
#define OPCODE_SUB_R ((uint8_t)0x95U) /* sub —  */

/* I */
#define OPCODE_SUBS_I ((uint8_t)0x96U) /* subs —  */

/* R */
#define OPCODE_SUBS_R ((uint8_t)0x97U) /* subs —  */

/* R */
#define OPCODE_MUL ((uint8_t)0x98U) /* mul —  */

/* R */
#define OPCODE_SMUL ((uint8_t)0x99U) /* smul —  */

/* R */
#define OPCODE_DIV ((uint8_t)0x9AU) /* div —  */

/* R */
#define OPCODE_SDIV ((uint8_t)0x9BU) /* sdiv —  */

/* I */
#define OPCODE_OR_I ((uint8_t)0xA2U) /* or —  */

/* R */
#define OPCODE_OR_R ((uint8_t)0xA3U) /* or —  */

/* I */
#define OPCODE_AND_I ((uint8_t)0xA4U) /* and —  */

/* R */
#define OPCODE_AND_R ((uint8_t)0xA5U) /* and —  */

/* I */
#define OPCODE_XOR_I ((uint8_t)0xA6U) /* xor —  */

/* R */
#define OPCODE_XOR_R ((uint8_t)0xA7U) /* xor —  */

/* I */
#define OPCODE_NOT_I ((uint8_t)0xA8U) /* not —  */

/* R */
#define OPCODE_NOT_R ((uint8_t)0xA9U) /* not —  */

/* I */
#define OPCODE_LSL_I ((uint8_t)0xAAU) /* lsl —  */

/* R */
#define OPCODE_LSL_R ((uint8_t)0xABU) /* lsl —  */

/* I */
#define OPCODE_LSR_I ((uint8_t)0xACU) /* lsr —  */

/*  */
#define OPCODE_LSR_R ((uint8_t)0xADU) /* lsr —  */

/* I */
#define OPCODE_ASR_I ((uint8_t)0xAEU) /* asr —  */

/*  */
#define OPCODE_ASR_R ((uint8_t)0xAFU) /* asr —  */

/* I */
#define OPCODE_MVI ((uint8_t)0xB0U) /* mvi —  */

/* R */
#define OPCODE_SXB ((uint8_t)0xB1U) /* sxb —  */

/* R */
#define OPCODE_SXH ((uint8_t)0xB2U) /* sxh —  */

/* R */
#define OPCODE_UXB ((uint8_t)0xB3U) /* uxb —  */

/* R */
#define OPCODE_UXH ((uint8_t)0xB4U) /* uxh —  */

/* M */
#define OPCODE_LD ((uint8_t)0xC0U) /* ld —  */

/* M */
#define OPCODE_LDB ((uint8_t)0xC1U) /* ldb —  */

/* M */
#define OPCODE_LDBS ((uint8_t)0xC2U) /* ldbs —  */

/* M */
#define OPCODE_LDBZ ((uint8_t)0xC3U) /* ldbz —  */

/* M */
#define OPCODE_LDH ((uint8_t)0xC4U) /* ldh —  */

/* M */
#define OPCODE_LDHS ((uint8_t)0xC5U) /* ldhs —  */

/* M */
#define OPCODE_LDHZ ((uint8_t)0xC6U) /* ldhz —  */

/* M */
#define OPCODE_STR ((uint8_t)0xC7U) /* str —  */

/* M */
#define OPCODE_STRB ((uint8_t)0xC8U) /* strb —  */

/* M */
#define OPCODE_STRH ((uint8_t)0xC9U) /* strh —  */

/* fp_memory */
#define OPCODE_LDF ((uint8_t)0xCAU) /* ldf — FP load word */

/* fp_memory */
#define OPCODE_STRF ((uint8_t)0xCBU) /* strf — FP store word */

/* S */
#define OPCODE_SYS ((uint8_t)0xFFU) /* sys — System specific instruction in sub-opcode field (S-type) */


/* ── Sub-opcodes ────────────────────────────────────────────────────────────── */


/* ── Aliases ────────────────────────────────────────────────────────────────── */

#define OPCODE_NOP OPCODE_ADD_I /* No-op (add r0, r0, #0) */

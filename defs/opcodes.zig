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
pub const Opcode = enum(u8) {
  UB = 0x5B,
  UBR = 0x5C,
  B = 0x5D,
  CALL = 0x5E,
  RET = 0x5F,
  ADDF = 0x6E,
  SUBF = 0x6F,
  MULF = 0x70,
  DIVF = 0x71,
  SQRTF = 0x72,
  MINF = 0x73,
  MAXF = 0x74,
  ABSF = 0x75,
  NEGF = 0x76,
  FUSEDF = 0x77,
  MVF = 0x7D,
  MVFI = 0x7E,
  MVIF = 0x7F,
  CVTFU = 0x80,
  CVTFS = 0x81,
  CVTUF = 0x82,
  CVTSF = 0x83,
  CLASSF = 0x87,
  CMPF = 0x88,
  CMPFE = 0x89,
  ADD_I = 0x90,
  ADD_R = 0x91,
  ADDS_I = 0x92,
  ADDS_R = 0x93,
  SUB_I = 0x94,
  SUB_R = 0x95,
  SUBS_I = 0x96,
  SUBS_R = 0x97,
  MUL = 0x98,
  SMUL = 0x99,
  DIV = 0x9A,
  SDIV = 0x9B,
  OR_I = 0xA2,
  OR_R = 0xA3,
  AND_I = 0xA4,
  AND_R = 0xA5,
  XOR_I = 0xA6,
  XOR_R = 0xA7,
  NOT_I = 0xA8,
  NOT_R = 0xA9,
  LSL_I = 0xAA,
  LSL_R = 0xAB,
  LSR_I = 0xAC,
  LSR_R = 0xAD,
  ASR_I = 0xAE,
  ASR_R = 0xAF,
  MVI = 0xB0,
  SXB = 0xB1,
  SXH = 0xB2,
  UXB = 0xB3,
  UXH = 0xB4,
  LD = 0xC0,
  LDB = 0xC1,
  LDBS = 0xC2,
  LDBZ = 0xC3,
  LDH = 0xC4,
  LDHS = 0xC5,
  LDHZ = 0xC6,
  STR = 0xC7,
  STRB = 0xC8,
  STRH = 0xC9,
  LDF = 0xCA,
  STRF = 0xCB,
  SYS = 0xFF,


  /// Given the numeric opcode, return the respective opcode enum.
  pub fn fromByte(b: u8) ?Opcode {
    return std.meta.intToEnum(Opcode, b) catch null;
  }

  /// Given the string opcode, return the respective opcode enum.
  pub fn fromString(name: []const u8) ?Opcode {
    return std.meta.stringToEnum(Opcode, name) catch {
      // A possible null return is when the opcode string is a syscall or fusedf opcode.
      // In that case, check the sub-opcodes.
      return SysSubOp.fromString(name) orelse
        FusedfSubOp.fromString(name) orelse
        null;
    };
  }

  /// Return the string opcode for the current opcode enum value.
  pub fn mnemonic(self: Opcode) []const u8 {
    return switch (self) {
      .UB => "ub",
      .UBR => "ubr",
      .B => "b",
      .CALL => "call",
      .RET => "ret",
      .ADDF => "addf",
      .SUBF => "subf",
      .MULF => "mulf",
      .DIVF => "divf",
      .SQRTF => "sqrtf",
      .MINF => "minf",
      .MAXF => "maxf",
      .ABSF => "absf",
      .NEGF => "negf",
      .FUSEDF => "fusedf",
      .MVF => "mvf",
      .MVFI => "mvfi",
      .MVIF => "mvif",
      .CVTFU => "cvtfu",
      .CVTFS => "cvtfs",
      .CVTUF => "cvtuf",
      .CVTSF => "cvtsf",
      .CLASSF => "classf",
      .CMPF => "cmpf",
      .CMPFE => "cmpfe",
      .ADD_I => "addi",
      .ADD_R => "add",
      .ADDS_I => "addsi",
      .ADDS_R => "adds",
      .SUB_I => "subi",
      .SUB_R => "sub",
      .SUBS_I => "subsi",
      .SUBS_R => "subs",
      .MUL => "mul",
      .SMUL => "smul",
      .DIV => "div",
      .SDIV => "sdiv",
      .OR_I => "ori",
      .OR_R => "or",
      .AND_I => "andi",
      .AND_R => "and",
      .XOR_I => "xori",
      .XOR_R => "xor",
      .NOT_I => "noti",
      .NOT_R => "not",
      .LSL_I => "lsli",
      .LSL_R => "lsl",
      .LSR_I => "lsri",
      .LSR_R => "lsr",
      .ASR_I => "asri",
      .ASR_R => "asr",
      .MVI => "mvi",
      .SXB => "sxb",
      .SXH => "sxh",
      .UXB => "uxb",
      .UXH => "uxh",
      .LD => "ld",
      .LDB => "ldb",
      .LDBS => "ldbs",
      .LDBZ => "ldbz",
      .LDH => "ldh",
      .LDHS => "ldhs",
      .LDHZ => "ldhz",
      .STR => "str",
      .STRB => "strb",
      .STRH => "strh",
      .LDF => "ldf",
      .STRF => "strf",
      .SYS => "sys"
    };
  }

  pub fn isImmediate(self: Opcode) bool { return (@intFromEnum(self) & 1) == 0; }

  pub fn isRegister(self: Opcode)  bool { return (@intFromEnum(self) & 1) == 1; }
};

// ── Sub-opcodes ───────────────────────────────────────────────────────────────

pub const FusedfSubOp = enum(u8) {
  FMADDF = 0x00,
  FMSUBF = 0x01,
  FNMADDF = 0x02,
  FNMSUBF = 0x03,


  pub fn fromByte(b: u8) ?FusedfSubOp {
    return std.meta.intToEnum(FusedfSubOp, b) catch null;
  }

  pub fn fromString(name: []const u8) ?FusedfSubOp {
    return std.meta.stringToEnum(FusedfSubOp, name) catch null;
  }

  pub fn mnemonic(self: FusedfSubOp) []const u8 {
    return switch (self) {
      .FMADDF => "fmaddf",
      .FMSUBF => "fmsubf",
      .FNMADDF => "fnaddf",
      .FNMSUBF => "fnsubf"
    };
  }
};

pub const SysSubOp = enum(u8) {
  SYSCALL = 0x00,
  HLT = 0x01,
  SI = 0x02,
  DI = 0x03,
  ERET = 0x04,
  MVIR = 0x05,
  WCSTR = 0x06,
  RCSTR = 0x07,
  WFCSR = 0x08,
  RFCSR = 0x09,


  pub fn fromByte(b: u8) ?SysSubOp {
    return std.meta.intToEnum(SysSubOp, b) catch null;
  }

  pub fn fromString(name: []const u8) ?SysSubOp {
    return std.meta.stringToEnum(SysSubOp, name) catch null;
  }

  pub fn mnemonic(self: SysSubOp) []const u8 {
    return switch (self) {
      .SYSCALL => "syscall",
      .HLT => "hlt",
      .SI => "si",
      .DI => "di",
      .ERET => "eret",
      .MVIR => "mvir",
      .WCSTR => "wcstr",
      .RCSTR => "rcstr",
      .WFCSR => "wfcsr",
      .RFCSR => "rfcsr"
    };
  }
};


// ── Aliases ───────────────────────────────────────────────────────────────────

pub const NOP = Opcode.add_i; // No-op (add r0, r0, #0)
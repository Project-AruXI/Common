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
  ADDI = 0x90,
  ADD = 0x91,
  ADDSI = 0x92,
  ADDS = 0x93,
  SUBI = 0x94,
  SUB = 0x95,
  SUBSI = 0x96,
  SUBS = 0x97,
  MUL = 0x98,
  SMUL = 0x99,
  DIV = 0x9A,
  SDIV = 0x9B,
  ORI = 0xA2,
  OR = 0xA3,
  ANDI = 0xA4,
  AND = 0xA5,
  XORI = 0xA6,
  XOR = 0xA7,
  NOTI = 0xA8,
  NOT = 0xA9,
  LSLI = 0xAA,
  LSL = 0xAB,
  LSRI = 0xAC,
  LSR = 0xAD,
  ASRI = 0xAE,
  ASR = 0xAF,
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

  pub const NOP = @as(Opcode, .ADDI);
  pub const CMPI = @as(Opcode, .SUBI);
  pub const CMP = @as(Opcode, .SUBS);
  pub const MV = @as(Opcode, .OR);
  pub const MVNI = @as(Opcode, .SUBI);
  pub const MVN = @as(Opcode, .SUB);


  /// Given the numeric opcode, return the respective opcode enum.
  pub fn fromByte(b: u8) ?Opcode {
    return std.meta.intToEnum(Opcode, b) catch null;
  }

  /// Given the string opcode, return the respective opcode enum.
  pub fn fromString(name: []const u8) ?Opcode {
    var buf: [16]u8 = undefined;
    if (name.len > buf.len) return null;
    const upper = std.ascii.upperString(buf[0..name.len], name);
    return std.meta.stringToEnum(Opcode, upper) orelse null;
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
      .ADDI => "addi",
      .ADD => "add",
      .ADDSI => "addsi",
      .ADDS => "adds",
      .SUBI => "subi",
      .SUB => "sub",
      .SUBSI => "subsi",
      .SUBS => "subs",
      .MUL => "mul",
      .SMUL => "smul",
      .DIV => "div",
      .SDIV => "sdiv",
      .ORI => "ori",
      .OR => "or",
      .ANDI => "andi",
      .AND => "and",
      .XORI => "xori",
      .XOR => "xor",
      .NOTI => "noti",
      .NOT => "not",
      .LSLI => "lsli",
      .LSL => "lsl",
      .LSRI => "lsri",
      .LSR => "lsr",
      .ASRI => "asri",
      .ASR => "asr",
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
    var buf: [16]u8 = undefined;
    if (name.len > buf.len) return null;
    const upper = std.ascii.upperString(buf[0..name.len], name);
    return std.meta.stringToEnum(FusedfSubOp, upper) orelse null;
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
    var buf: [16]u8 = undefined;
    if (name.len > buf.len) return null;
    const upper = std.ascii.upperString(buf[0..name.len], name);
    return std.meta.stringToEnum(SysSubOp, upper) orelse null;
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
// Soft aliases — keep alias identity during parsing while mapping to
// a backing numeric opcode for encoding.
pub const Alias = enum(u8) {
  NOP,
  CMPI,
  CMP,
  MV,
  MVNI,
  MVN,
};

pub fn aliasBacking(a: Alias) Opcode {
  return switch (a) {
    .NOP => Opcode.NOP,
    .CMPI => Opcode.CMPI,
    .CMP => Opcode.CMP,
    .MV => Opcode.MV,
    .MVNI => Opcode.MVNI,
    .MVN => Opcode.MVN,
  };
}

// ── Global opcode lookup ──────────────────────────────────────────────────────

/// Result type for stringToOpcode — wraps Opcode, SysSubOp, FusedfSubOp, or an Alias.
pub const AnyOpcode = union(enum) {
  opcode: Opcode,
  sys: SysSubOp,
  fusedf: FusedfSubOp,
  alias: Alias,
};

/// Resolve a mnemonic string to an opcode across all namespaces.
/// Tries Opcode (including aliases) → SysSubOp → FusedfSubOp.
/// Returns null if the string does not match any known mnemonic.
pub fn stringToOpcode(name: []const u8) ?AnyOpcode {
  // Intercept known aliases first and return the alias identity so the
  // parser can validate alias-specific syntax while still encoding with
  // the backing opcode later.
  if (std.ascii.eqlIgnoreCase(name, "nop")) return .{ .alias = Alias.NOP };
  if (std.ascii.eqlIgnoreCase(name, "cmpi")) return .{ .alias = Alias.CMPI };
  if (std.ascii.eqlIgnoreCase(name, "cmp")) return .{ .alias = Alias.CMP };
  if (std.ascii.eqlIgnoreCase(name, "mv")) return .{ .alias = Alias.MV };
  if (std.ascii.eqlIgnoreCase(name, "mvni")) return .{ .alias = Alias.MVNI };
  if (std.ascii.eqlIgnoreCase(name, "mvn")) return .{ .alias = Alias.MVN };

  if (Opcode.fromString(name)) |op| return .{ .opcode = op };
  if (SysSubOp.fromString(name)) |op| return .{ .sys = op };
  if (FusedfSubOp.fromString(name)) |op| return .{ .fusedf = op };
  return null;
}
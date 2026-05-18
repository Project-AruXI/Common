// zig fmt: off

const std = @import("std");


// ── Integer Registers ─────────────────────────────────────────────────────────
pub const IntReg = enum(u8) {
  x0 = 0,
  x1 = 1,
  x2 = 2,
  x3 = 3,
  x4 = 4,
  x5 = 5,
  x6 = 6,
  x7 = 7,
  x8 = 8,
  x9 = 9,
  x10 = 10,
  x11 = 11,
  x12 = 12,
  x13 = 13,
  x14 = 14,
  x15 = 15,
  x16 = 16,
  x17 = 17,
  x18 = 18,
  x19 = 19,
  x20 = 20,
  x21 = 21,
  x22 = 22,
  x23 = 23,
  x24 = 24,
  x25 = 25,
  x26 = 26,
  x27 = 27,
  x28 = 28,
  x29 = 29,
  x30 = 30,
  sp = 31,
  ir = 32,


  /// Given the numeric register index (0–31), return the respective register
  /// enum. x0–x30 map to 0–30; sp maps to 31. ir has no numeric encoding and
  /// will never be returned.
  pub fn fromByte(b: u8) ?IntReg {
    if (b > 31) return null;
    return std.meta.intToEnum(IntReg, b) catch null;
  }

  /// Given a register name — canonical (e.g. "x0", "sp") or alias (e.g.
  /// "xr", "lr") — return the respective register enum.
  pub fn fromString(s: []const u8) ?IntReg {
    if (std.meta.stringToEnum(IntReg, s)) |r| return r;
    return IntReg.fromAlias(s);
  }

  /// Given an alias string, return the register it refers to.
  /// Returns null if the string is not a recognised alias.
  pub fn fromAlias(s: []const u8) ?IntReg {
    const eql = std.mem.eql;
    if (eql(u8, s, "xr") or eql(u8, s, "a0")) return .x0;
    if (eql(u8, s, "a1")) return .x1;
    if (eql(u8, s, "a2")) return .x2;
    if (eql(u8, s, "a3")) return .x3;
    if (eql(u8, s, "a4")) return .x4;
    if (eql(u8, s, "a5")) return .x5;
    if (eql(u8, s, "a6")) return .x6;
    if (eql(u8, s, "a7")) return .x7;
    if (eql(u8, s, "a8")) return .x8;
    if (eql(u8, s, "a9")) return .x9;
    if (eql(u8, s, "c0")) return .x12;
    if (eql(u8, s, "c1")) return .x13;
    if (eql(u8, s, "c2")) return .x14;
    if (eql(u8, s, "c3")) return .x15;
    if (eql(u8, s, "c4")) return .x16;
    if (eql(u8, s, "s0")) return .x17;
    if (eql(u8, s, "s1")) return .x18;
    if (eql(u8, s, "s2")) return .x19;
    if (eql(u8, s, "s3")) return .x20;
    if (eql(u8, s, "s4")) return .x21;
    if (eql(u8, s, "s5")) return .x22;
    if (eql(u8, s, "s6")) return .x23;
    if (eql(u8, s, "s7")) return .x24;
    if (eql(u8, s, "s8")) return .x25;
    if (eql(u8, s, "s9")) return .x26;
    if (eql(u8, s, "s10")) return .x27;
    if (eql(u8, s, "lr")) return .x28;
    if (eql(u8, s, "xb")) return .x29;
    if (eql(u8, s, "xz")) return .x30;
    return null;
  }

  /// Return the canonical name string for this register.
  pub fn name(self: IntReg) []const u8 {
    return switch (self) {
      .x0 => "x0",
      .x1 => "x1",
      .x2 => "x2",
      .x3 => "x3",
      .x4 => "x4",
      .x5 => "x5",
      .x6 => "x6",
      .x7 => "x7",
      .x8 => "x8",
      .x9 => "x9",
      .x10 => "x10",
      .x11 => "x11",
      .x12 => "x12",
      .x13 => "x13",
      .x14 => "x14",
      .x15 => "x15",
      .x16 => "x16",
      .x17 => "x17",
      .x18 => "x18",
      .x19 => "x19",
      .x20 => "x20",
      .x21 => "x21",
      .x22 => "x22",
      .x23 => "x23",
      .x24 => "x24",
      .x25 => "x25",
      .x26 => "x26",
      .x27 => "x27",
      .x28 => "x28",
      .x29 => "x29",
      .x30 => "x30",
      .sp  => "sp",
      .ir  => "ir"
    };
  }

  /// Return the primary alias for this register, or null if it has none.
  /// Note: x0 has two aliases ("xr" and "a0"); "xr" is returned as primary.
  pub fn alias(self: IntReg) ?[]const u8 {
    return switch (self) {
      .x0 => "xr",
      .x1 => "a1",
      .x2 => "a2",
      .x3 => "a3",
      .x4 => "a4",
      .x5 => "a5",
      .x6 => "a6",
      .x7 => "a7",
      .x8 => "a8",
      .x9 => "a9",
      .x12 => "c0",
      .x13 => "c1",
      .x14 => "c2",
      .x15 => "c3",
      .x16 => "c4",
      .x17 => "s0",
      .x18 => "s1",
      .x19 => "s2",
      .x20 => "s3",
      .x21 => "s4",
      .x22 => "s5",
      .x23 => "s6",
      .x24 => "s7",
      .x25 => "s8",
      .x26 => "s9",
      .x27 => "s10",
      .x28 => "lr",
      .x29 => "xb",
      .x30 => "xz",
      else => null,
    };
  }
};


// ── Floating-point Registers ──────────────────────────────────────────────────
pub const FpReg = enum(u8) {
  f0 = 0,
  f1 = 1,
  f2 = 2,
  f3 = 3,
  f4 = 4,
  f5 = 5,
  f6 = 6,
  f7 = 7,
  f8 = 8,
  f9 = 9,
  f10 = 10,
  f11 = 11,
  f12 = 12,
  f13 = 13,
  f14 = 14,
  f15 = 15,


  /// Given the numeric register index (0–15), return the respective register
  /// enum. f0–f15 map to 0–15.
  pub fn fromByte(b: u8) ?FpReg {
    return std.meta.intToEnum(FpReg, b) catch null;
  }

  /// Given the register name string, return the respective register enum.
  pub fn fromString(s: []const u8) ?FpReg {
    return std.meta.stringToEnum(FpReg, s);
  }

  /// Return the canonical name string for this register.
  pub fn name(self: FpReg) []const u8 {
    return switch (self) {
      .f0 => "f0",
      .f1 => "f1",
      .f2 => "f2",
      .f3 => "f3",
      .f4 => "f4",
      .f5 => "f5",
      .f6 => "f6",
      .f7 => "f7",
      .f8 => "f8",
      .f9 => "f9",
      .f10 => "f10",
      .f11 => "f11",
      .f12 => "f12",
      .f13 => "f13",
      .f14 => "f14",
      .f15 => "f15"
    };
  }
};


// ── Conditions ────────────────────────────────────────────────────────────────
pub const Cond = enum(u4) {
  eq = 0,
  ne = 1,
  ov = 2,
  nv = 3,
  mi = 4,
  pz = 5,
  cc = 6,
  cs = 7,
  gt = 8,
  ge = 9,
  lt = 10,
  le = 11,


  /// Given the numeric condition code (0–11), return the respective condition
  /// enum.
  pub fn fromByte(b: u4) ?Cond {
    return std.meta.intToEnum(Cond, b) catch null;
  }

  /// Given the condition name string, return the respective condition enum.
  pub fn fromString(s: []const u8) ?Cond {
    return std.meta.stringToEnum(Cond, s);
  }

  /// Return the mnemonic string for this condition.
  pub fn name(self: Cond) []const u8 {
    return switch (self) {
      .eq => "eq",
      .ne => "ne",
      .ov => "ov",
      .nv => "nv",
      .mi => "mi",
      .pz => "pz",
      .cc => "cc",
      .cs => "cs",
      .gt => "gt",
      .ge => "ge",
      .lt => "lt",
      .le => "le"
    };
  }
};
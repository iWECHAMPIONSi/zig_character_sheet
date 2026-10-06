// ignore this, this is for later
const std = @import("std");
const hash = std.hash.Wyhash.hash;

pub const Potion = struct {
    name: []const u8,
    hash: u64,
};

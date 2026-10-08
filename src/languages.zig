const enums = @import("enums.zig");
const Languages = enums.Languages;
const Scripts = enums.Scripts;
const LanguageRarity = enums.LanguageRarity;
const std = @import("std");
const hash = std.hash.Wyhash.hash;

pub const Variant = struct {
    source: enums.Source,
    script: ?Scripts,
    rarity: ?LanguageRarity,
    brief: ?[]const u8,
};

pub const Language = struct {
    name: []const u8,
    hash: u64,
    source: enums.Source,
    language: Languages,
    script: ?Scripts,
    rarity: ?LanguageRarity,
    variants: ?[]const Variant,
    brief: ?[]const u8,

    const Self = @This();

    pub fn compInit(
        comptime name: []const u8,
        comptime source: enums.Source,
        comptime language: Languages,
        comptime script: ?Scripts,
        comptime rarity: ?LanguageRarity,
        comptime brief: ?[]const u8,
        comptime variants: ?[]const Variant,
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .source = source,
            .language = language,
            .script = script,
            .rarity = rarity,
            .brief = brief,
            .variants = variants,
        };
    }
};

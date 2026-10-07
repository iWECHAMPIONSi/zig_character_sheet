const std = @import("std");
const hash = std.hash.Wyhash.hash;
const enums = @import("enums.zig");
const units = @import("units.zig");
const modifier = @import("modifier.zig");
const description = @import("description.zig");
const Description = description.Description;

pub const Components = struct {
    v: bool,
    s: bool,
    m: bool,
    m_brief: ?[]const u8,
};

pub const CastingTime = struct {
    time: union(enum) {
        action,
        bonus_action,
        reaction,
        duration: units.TimeValue,
    },
    brief: ?[]const u8,
};

pub const CastingRange = struct {
    distance: units.DistanceValue,
    shape: ?enums.Shapes,
    brief: ?[]const u8,
};

pub const Duration = struct {
    duration: ?units.Duration,
    concentration: bool,
    special: bool,
    brief: ?[]const u8,
};

pub const Spell = struct {
    name: []const u8,
    hash: u64,
    source: union(enum) { default_source: enums.Source, custom_source: []const u8 },
    spell_level: enums.SpellLevel,
    school: enums.SchoolOfMagic,
    ritual: bool,
    casting_time: CastingTime,
    casting_range: CastingRange,
    components: Components,
    duration: Duration,
    brief: ?[]const u8,
    desc: Description,
    higher_levels: ?[]const modifier.ScalingLevel,
    classes: []const u64, // the actual classes will be implimented later, but for now we are only going to have a commented out portion that's going to be an array of u64 hashes
    dice_rolls: ?[]const modifier.DiceRoll,
    modifiers: ?[]const modifier.Modifier,
    const Self = @This();

    pub fn compInit(
        comptime name: []const u8,
        comptime source: enums.Source,
        comptime spell_level: enums.SpellLevel,
        comptime school: enums.SchoolOfMagic,
        comptime ritual: bool,
        comptime casting_time: CastingTime,
        comptime casting_range: CastingRange,
        comptime components: Components,
        comptime duration: Duration,
        comptime brief: ?[]const u8,
        comptime desc: Description,
        comptime higher_levels: ?[]const modifier.ScalingLevel,
        comptime classes: []const u64,
        comptime dice_rolls: ?[]const modifier.DiceRoll,
        comptime modifiers: ?[]const modifier.Modifier,
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .source = .{ .default_source = source },
            .spell_level = spell_level,
            .school = school,
            .ritual = ritual,
            .casting_time = casting_time,
            .casting_range = casting_range,
            .components = components,
            .brief = brief,
            .duration = duration,
            .desc = desc,
            .higher_levels = higher_levels,
            .classes = classes,
            .dice_rolls = dice_rolls,
            .modifiers = modifiers,
        };
    }
};

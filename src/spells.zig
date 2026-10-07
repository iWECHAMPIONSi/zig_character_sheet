const std = @import("std");
const hash = std.hash.Wyhash.hash;
const enums = @import("enums.zig");
const units = @import("units.zig");
const class = @import("class_temp.zig");
const dice = @import("dice.zig");
const Roll = dice.Roll;

pub const Components = struct {
    v: bool,
    s: bool,
    m: bool,
    m_desc: ?[]const u8,
};

pub const CastingTime = struct {
    duration: units.Duration,
    bonus: bool,
    reaction: bool,
    desc: ?[]const u8,
};

pub const CastingRange = struct {
    distance: units.Range,
    shape: ?struct { distance: units.Range, shape: ?enums.Shapes },
};

pub const Duration = struct {
    duration: ?units.Duration,
    concentration: bool,
    special: bool,
    desc: ?[]const u8,
};

pub const HigherLevel = struct {
    level: union(enum) { character: u8, slot: enums.SpellLevel },
    desc: []const u8,
    dice_roll: ?Roll,
};

pub const Spell = struct {
    name: []const u8,
    hash: u64,
    spell_level: enums.SpellLevel,
    school: enums.SchoolOfMagic,
    ritual: bool,
    casting_time: CastingTime,
    casting_range: CastingRange,
    components: Components,
    duration: Duration,
    desc: []const u8,
    higher_levels: ?[]const HigherLevel,
    classes: []const u64, // the actual classes will be implimented later, but for now we are only going to have a commented out portion that's going to be an array of u64 hashes
    dice_roll: ?Roll,
    const Self = @This();

    pub fn init(
        name: []const u8,
        spell_level: enums.SpellLevel,
        school: enums.SchoolOfMagic,
        ritual: bool,
        casting_time: CastingTime,
        casting_range: CastingRange,
        components: Components,
        duration: Duration,
        desc: []const u8,
        higher_levels: ?[]const HigherLevel,
        classes: []const u64,
        dice_roll: ?Roll,
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .spell_level = spell_level,
            .school = school,
            .ritual = ritual,
            .casting_time = casting_time,
            .casting_range = casting_range,
            .components = components,
            .duration = duration,
            .desc = desc,
            .higher_levels = higher_levels,
            .classes = classes,
            .dice_roll = dice_roll,
        };
    }

    pub fn clone(self: *const Self) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .spell_level = self.spell_level,
            .school = self.school,
            .ritual = self.ritual,
            .casting_time = self.casting_time,
            .casting_range = self.casting_range,
            .components = self.components,
            .duration = self.duration,
            .desc = self.desc,
            .higher_levels = self.higher_levels,
            .classes = self.classes,
            .dice_roll = self.dice_roll,
        };
    }
};

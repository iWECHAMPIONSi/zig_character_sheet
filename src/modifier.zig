const std = @import("std");
const dice = @import("dice.zig");
const enums = @import("enums.zig");
const Roll = dice.Roll;

pub const Conditional = struct {
    level: ?union(enum) {
        player: u8,
        spell: enums.SpellLevel,
    },
};

pub const Modifier = struct {
    name: ?[]const u8,
    modifier: enums.Mod,
    amount: ?i8,
};

pub const DiceRoll = struct {
    roll: ?[]DiceModRoll,
};

pub const DiceModRoll = struct {
    roll: union(enum) {
        roll: Roll,
        mod: struct {
            dice_mod: enums.DiceMod,
            count: u8,
        },
        flat: i64,
    },
    negative: bool,
};

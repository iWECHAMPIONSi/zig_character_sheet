const dice = @import("dice.zig");
const enums = @import("enums.zig");
const Roll = dice.Roll;
const description = @import("description.zig");
const Description = description.Description;

pub const ScalingLevel = struct {
    level: union(enum) { character: u8, slot: enums.SpellLevel },
    desc: Description,
    /// these will replace default API rolls and mods when the character reaches the level, it won't touch player defined. When casting a spell, it'll ask and then use the respective mods and dice rolls for the spell slot
    dice_rolls: ?[]const DiceRoll,
    modifiers: ?[]const Modifier,
};

pub const Modifier = struct {
    name: ?[]const u8,
    modifier: enums.Mod,
    brief: ?[]const u8,
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

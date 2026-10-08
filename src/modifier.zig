const dice = @import("dice.zig");
const enums = @import("enums.zig");
const Roll = dice.Roll;
const description = @import("description.zig");
const Description = description.Description;
const errors = @import("errors.zig");
const StdErr = errors.StdErr;

pub const ScalingLevel = struct {
    level: union(enum) {
        character: u8,
        slot: enums.SpellLevel,
    },
    desc: Description,
    /// these will replace default API rolls and mods when the character reaches the level, it won't touch player defined. When casting a spell, it'll ask and then use the respective mods and dice rolls for the spell slot
    dice_rolls: ?[]const DiceRoll,
    attack_rolls: ?[]const AttackRoll,
    damage_rolls: ?[]const DamageRoll,
    modifiers: ?[]const Modifier,
};

pub const Modifier = struct {
    name: ?[]const u8,
    modifier: enums.Mod,
    brief: ?[]const u8,
    /// when left null, defaults to proficiency bonus, if the modifier is a bonus, it defaults to +0
    amount: ?i8,
};

pub const DiceRoll = struct {
    roll: ?[]const DiceModRoll,
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

pub fn rollDice(
    roll: union(enum) { dice_roll: DiceRoll, dice: dice.Dice },
) ?i64 {
    _ = roll;
    return null;
}

pub const DamageRoll = struct {
    damage_type: enums.DamageType,
    dice_roll: DiceRoll,

    const Self = @This();

    pub fn compInit(comptime damage_type: enums.DamageType, comptime dice_roll: DiceRoll) Self {
        return .{
            .damage_type = damage_type,
            .dice_roll = dice_roll,
        };
    }
};

pub const AttackRoll = struct {
    attack_type: enums.AttackType,
    dice_roll: DiceRoll,

    const Self = @This();

    pub fn compInit(comptime attack_type: enums.AttackType, comptime mods: ?[]const DiceModRoll) Self {
        var dice_roll: []const DiceModRoll = &[_]DiceModRoll{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d20 } }, .negative = false }};
        if (mods) |slice| {
            dice_roll = dice_roll ++ slice;
        }
        return .{
            .attack_type = attack_type,
            .dice_roll = .{ .roll = dice_roll },
        };
    }
};

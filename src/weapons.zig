const enums = @import("enums.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const dice = @import("dice.zig");
const Dice = dice.Dice;
const PubDiceSet = dice.PubDiceSet;
const Roll = dice.Roll;
const currency = @import("currency.zig");
const CurrencyAmount = currency.CurrencyAmount;

const d4 = PubDiceSet.d4;
const d6 = PubDiceSet.d6;
const d8 = PubDiceSet.d8;

pub const RangeDistance = struct {
    normal: i32,
    max: i32,
};

pub const WeaponProperties = struct {
    ammunition: bool,
    finesse: bool,
    heavy: bool,
    light: bool,
    loading: bool,
    range: bool,
    range_distance: ?RangeDistance,
    reach: bool,
    special: bool,
    special_desc: ?[]const u8,
    thrown: bool,
    two_handed: bool,
    versatile: bool,
    versatile_dice: ?Dice,
};

pub const Weapon = struct {
    name: []const u8,
    weapon_category: enums.WeaponCategory,
    weapon_weight: i32,
    properties: WeaponProperties,
    damage_type: ?enums.WeaponType,
    dice_roll: ?Roll,
    const Self = @This();

    pub fn init(weapon_name: []const u8, category: enums.WeaponCategory, weight: i32, properties: WeaponProperties, damage_type: ?enums.WeaponType, dice_roll: ?Roll) StdErr!Self {
        if (weapon_name.len == 0) {

    }
};

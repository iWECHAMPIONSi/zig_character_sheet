const enums = @import("enums.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const dice = @import("dice.zig");
const Dice = dice.Dice;
const PubDiceSet = dice.PubDiceSet;
const Roll = dice.Roll;
const currency = @import("currency.zig");
const Currecny = currency.Currency;
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
    cost: ?CurrencyAmount,
    const Self = @This();

    pub fn init(weapon_name: []const u8, category: enums.WeaponCategory, weight: i32, properties: WeaponProperties, damage: ?enums.WeaponType, dice_roll: ?Roll, weapon_cost: ?CurrencyAmount) StdErr!Self {
        if (weapon_name.len == 0) {
            return StdErr.InvalidParameter;
        }
        return .{ .name = weapon_name, .weapon_category = category, .weapon_weight = weight, .properties = properties, .damage_type = damage, .dice_roll = dice_roll, .cost = weapon_cost };
    }

    pub fn roll(self: *Self) StdErr!i32 {
        if (self.dice_roll == null) {
            return StdErr.InvalidFnCall;
        }

        var ret_val: i32 = 0;
        for (0..self.dice_roll.count) |_| {
            ret_val += self.dice_roll.dice.roll();
        }
        return ret_val;
    }
};

const name: []const u8 = "Club";
const roll: Roll = .{ .count = 1, .dice = d4 };
const weapon_cost: CurrencyAmount = .{ .currency = Currecny.silver, .amount = 1 };
const damage: enums.WeaponType = enums.WeaponType.bludgeoning;
const catagory: enums.WeaponCategory = enums.WeaponCategory.simple;
const properties: WeaponProperties = .{
    .ammunition = false,
    .finesse = false,
    .heavy = false,
    .light = true,
    .loading = false,
    .range = false,
    .range_distance = null,
    .reach = false,
    .special = false,
    .special_desc = null,
    .thrown = false,
    .two_handed = false,
    .versatile = false,
    .versatile_dice = null,
};
pub const club: Weapon = Weapon.init(name, catagory, 2, properties, damage, roll, weapon_cost);

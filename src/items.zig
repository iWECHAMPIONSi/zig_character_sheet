const std = @import("std");
const ArrayList = std.ArrayList;
const enums = @import("enums.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const hash = std.hash.Wyhash.hash;
const currency = @import("currency.zig");
const CurrencyValue = currency.CurrencyValue;
const dice = @import("dice.zig");
const Roll = dice.Roll;
const units = @import("units.zig");
const modifier = @import("modifier.zig");
const VolumeValue = units.VolumeValue;
const WeightValue = units.WeightValue;
const CubicVolumeValue = units.CubicVolumeValue;
const DistanceValue = units.DistanceValue;
const shop = @import("shop.zig");
const ShopEntry = shop.ShopEntry;

pub const MeleeWeapon = struct {
    weapon_category: enums.WeaponCategory,
    damage_type: ?enums.DamageType,
    damage: ?union(enum) { roll: Roll, flat: i64 },
    properties: struct {
        finesse: bool,
        heavy: bool,
        light: bool,
        loading: bool,
        range: ?struct { normal: i64, max: i64 },
        reach: bool,
        special: bool,
        thrown: bool,
        two_handed: bool,
        versatile: bool,
        versatile_dice: ?Roll,
    },
};

pub const RangedWeapon = struct {
    weapon_category: enums.WeaponCategory,
    damage_type: ?enums.DamageType,
    damage: ?union(enum) { roll: Roll, flat: i64 },
    properties: struct {
        ammunition: bool,
        ammo: ?u64,
        finesse: bool,
        heavy: bool,
        light: bool,
        loading: bool,
        range: struct { normal: i64, max: i64 },
        reach: bool,
        special: bool,
        thrown: bool,
        two_handed: bool,
        versatile: bool,
        versatile_dice: ?Roll,
    },
};

pub const ArmorMod = struct {
    ability: enums.Ability,
    max: ?u8,
};

pub const ArmorClass = struct {
    base: u8,
    modifier: ?ArmorMod,
};

pub const Armor = struct {
    armor_type: enums.ArmorCategory,
    armor_class: ArmorClass,
    stealth_disadvantage: bool,
    strength: ?u8,
};

pub const Shield = struct {
    armor_type: enums.ArmorCategory,
    stealth_disadvantage: bool,
    strength: ?u8,
    armor_mod: u8,
};

pub const Container = struct {
    contents: ?ArrayList(Item),
    volume_limit: ?VolumeValue,
    cubic_volume_limit: ?CubicVolumeValue,
    weight_limit: ?WeightValue,
    item_limit: ?i64,
    item_bias: ?[]const u64,
    valid_items: ?struct { items: bool, fluids: bool },
};

pub const SmallContainer = struct {
    contents: ?Item,
    valid_items: ?struct { items: bool, fluids: bool },
};

pub const FluidContainer = struct {
    fluid: ?union(enum) { fluid: Item, potion: Item },
    volume_limit: ?VolumeValue,
    weight_full: ?WeightValue,
};

pub const Fluid = struct {
    default_container: ?u64,
};

pub const Potion = struct {
    default_container: ?u64,
};

/// these are so that the API can differientiate between Fluids and non Fluids
pub const FluidTypes = union(enum) {
    fluid: Fluid,
    potion: Potion,
};

pub const Tool = struct {
    tool_type: enums.ToolType,
};

pub const ItemTypes = union(enum) {
    melee_weapon: MeleeWeapon,
    ranged_weapon: RangedWeapon,
    armor: Armor,
    shield: Shield,
    container: Container,
    small_container: SmallContainer,
    fluid_container: FluidContainer,
    tool: Tool,
};

pub const Category = union(enum) {
    melee_weapon: MeleeWeapon,
    ranged_weapon: RangedWeapon,
    armor: Armor,
    shield: Shield,
    container: Container,
    small_container: SmallContainer,
    fluid_container: FluidContainer,
    fluid: Fluid,
    potion: Potion,
    tool: Tool,
};

pub const Item = struct {
    name: []const u8,
    hash: u64,
    source: enums.Source,
    magic: bool,
    weight: ?WeightValue,
    volume: ?VolumeValue,
    length: ?DistanceValue,
    count: u64,
    value: ?CurrencyValue,
    rarity: ?enums.Rarity,
    details: ?[]const u8,
    desc: ?[]const u8,
    dice_rolls: ?[]modifier.DiceRoll,
    modifiers: ?[]modifier.Modifier,
    category: ?Category,
    shop_entry: ?ShopEntry,
    default_container: ?u64,

    const Self = @This();

    pub fn compInit(
        comptime name: []const u8,
        comptime source: enums.Source,
        comptime magic: bool,
        comptime weight: ?WeightValue,
        comptime volume: ?VolumeValue,
        comptime length: ?DistanceValue,
        comptime value: ?CurrencyValue,
        comptime rarity: ?enums.Rarity,
        comptime details: ?[]const u8,
        comptime desc: ?[]const u8,
        comptime dice_rolls: ?[]modifier.DiceRoll,
        comptime modifiers: ?[]modifier.Modifier,
        comptime category: ?Category,
        comptime shop_entry: ?struct { cost: CurrencyValue, count: u64, wrapping_contaner: ?u64 },
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .source = source,
            .magic = magic,
            .weight = weight,
            .volume = volume,
            .length = length,
            .count = 1,
            .value = value,
            .rarity = rarity,
            .details = details,
            .desc = desc,
            .dice_rolls = dice_rolls,
            .modifiers = modifiers,
            .category = category,
            .shop_entry = if (shop_entry != null) |entry| ShopEntry.compInit(
                hash(0, name),
                entry.cost,
                entry.count,
                entry.wrapping_contaner,
            ) else null,
        };
    }
};

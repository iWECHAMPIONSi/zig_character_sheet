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
const description = @import("description.zig");
const Description = description.Description;

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
    item_bias: ?[]const u64, // Allows API to automatically assign items to this container (like arrows to quivers)
    valid_items: ?struct { items: bool, fluids: bool },
    outside_slots: bool, // basically the workaround to the backpack problem, allows for the items it contains to surpass the limits (visually this will separate inner from outer storage)
};

pub const SmallContainer = struct {
    contents: ?*Item,
    valid_items: ?struct { items: bool, fluids: bool },
};

pub const FluidContainer = struct {
    fluid: ?union(enum) { fluid: *Item, potion: *Item },
    volume_limit: ?VolumeValue,
    weight_full: ?WeightValue,
    volume_of_contents: ?VolumeValue, // how much of the fluid is inside, cannot exceed volume_limit if present
};

pub const Fluid = struct {
    default_container: ?u64,
    weight: ?WeightValue,
};

pub const Potion = struct {
    default_container: ?u64,
    weight: ?WeightValue,
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

pub const ValidSmallItems = union(enum) {
    melee_weapon: MeleeWeapon,
    ranged_weapon: RangedWeapon,
    armor: Armor,
    shield: Shield,
    fluid_container: FluidContainer,
    fluid: Fluid,
    potion: Potion,
    tool: Tool,
};

// Fluid Weight System
// by default, API will first reference the fluid's listed weight, if the fluid does not have a listed weight, the API will fall back to the container's weight.

///
pub const Item = struct {
    /// Name of the Item
    name: []const u8,
    /// hash of the Item (based on its name, case sensitive)
    hash: u64,
    /// source material, custom_source is only relevant for anything not in the enum, although the enum is prefered
    source: union(enum) { default_source: enums.Source, custom_source: []const u8 },
    /// if the item is magical
    magic: bool,
    /// weight of the item
    weight: WeightValue,
    /// volume of the item
    volume: VolumeValue,
    /// length of the item (if applicable)
    length: ?DistanceValue,
    /// how many of the item in the current stack (applies to copies only)
    count: u64,
    /// how much it costs (if any)
    value: ?CurrencyValue,
    /// how rare it is (applies to magical items only)
    rarity: ?enums.Rarity,
    /// details
    brief: ?[]const u8,
    /// description
    desc: Description,
    /// The dice rolls (look at modifier.zig for type)
    dice_rolls: ?[]modifier.DiceRoll,
    /// The modifiers (look at modifier.zig for type)
    modifiers: ?[]modifier.Modifier,
    /// The sub-type of the Item
    category: ?Category,
    /// The shop entry of the item, allows the item to be available for purchase in the shop by itself (this only applies to item beng listed by itself, not listed with another item as a wrapping_container)
    shop_entry: ?ShopEntry,

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
        comptime brief: ?[]const u8,
        comptime desc: ?Description,
        comptime dice_rolls: ?[]modifier.DiceRoll,
        comptime modifiers: ?[]modifier.Modifier,
        comptime category: ?Category,
        comptime shop_entry: ?struct { cost: CurrencyValue, count: u64, wrapping_container: ?u64 },
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .source = .{ .default_source = source },
            .magic = magic,
            .weight = if (weight != null) weight.? else .{ .unit = .pound, .count = 0 },
            .volume = if (volume != null) volume.? else .{ .unit = .ounce, .count = 0 },
            .length = length,
            .count = 1,
            .value = value,
            .rarity = rarity,
            .brief = brief,
            .desc = if (desc != null) desc.? else .{ .desc = null, .desc_fields = null },
            .dice_rolls = dice_rolls,
            .modifiers = modifiers,
            .category = category,
            .shop_entry = if (shop_entry != null) ShopEntry.compInit(
                hash(0, name),
                shop_entry.?.cost,
                shop_entry.?.count,
                shop_entry.?.wrapping_container,
            ) else null,
        };
    }
};

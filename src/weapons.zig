const enums = @import("enums.zig");
const std = @import("std");
const hash = std.hash.Wyhash.hash;
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const dice = @import("dice.zig");
const Dice = dice.Dice;
const Roll = dice.Roll;

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
    versatile_dice: ?Roll,
};

pub const Weapon = struct {
    name: []const u8,
    hash: u64,
    weapon_category: enums.WeaponCategory,
    weapon_weight: f32,
    properties: WeaponProperties,
    damage_type: ?enums.WeaponType,
    dice_roll: ?Roll,
    const Self = @This();

    fn compInit(
        comptime weapon_name: []const u8,
        comptime category: enums.WeaponCategory,
        comptime weight: f32,
        comptime properties: WeaponProperties,
        comptime damage: ?enums.WeaponType,
        comptime dice_roll: ?Roll,
    ) Self {
        return .{
            .name = weapon_name,
            .hash = hash(0, name),
            .weapon_category = category,
            .weapon_weight = weight,
            .properties = properties,
            .damage_type = damage,
            .dice_roll = dice_roll,
        };
    }
    pub fn init(weapon_name: []const u8, category: enums.WeaponCategory, weight: f32, properties: WeaponProperties, damage: ?enums.WeaponType, dice_roll: ?Roll) StdErr!Self {
        if (weapon_name.len == 0) {
            return StdErr.InvalidParameter;
        }
        return .{
            .name = weapon_name,
            .hash = hash(0, name),
            .weapon_category = category,
            .weapon_weight = weight,
            .properties = properties,
            .damage_type = damage,
            .dice_roll = dice_roll,
        };
    }

    pub fn clone(self: *Self) Self {
        return Self{
            .name = self.name,
            .hash = self.hash,
            .weapon_category = self.weapon_category,
            .weapon_weight = self.weapon_weight,
            .properties = self.properties,
            .damage_type = self.damage_type,
            .dice_roll = self.dice_roll,
        };
    }

    pub fn roll(self: *Self) StdErr!i32 {
        if (self.dice_roll) |dice_roll| {
            var ret_val: i32 = 0;
            for (0..dice_roll.count) |_| {
                const add: u8 = try dice_roll.dice.roll();
                ret_val += @as(i32, add);
            }
            return ret_val;
        } else {
            if (self.damage_type == null) return 0 else return 1;
        }
    }
};

const name: []const u8 = "Club";
const roll: Roll = .{ .count = 1, .dice = &dice.d4 };
const weapon_damage: enums.WeaponType = enums.WeaponType.bludgeoning;
const catagory: enums.WeaponCategory = enums.WeaponCategory.simple;
const property: WeaponProperties = .{
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
pub var club: Weapon = Weapon.compInit(name, catagory, 2.0, property, weapon_damage, roll);
// Simple melee weapons

pub var dagger: Weapon = Weapon.compInit(
    "Dagger",
    .simple,
    1.0,
    .{
        .ammunition = false,
        .finesse = true,
        .heavy = false,
        .light = true,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 20, .max = 60 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d4 },
);

pub var greatclub: Weapon = Weapon.compInit(
    "Greatclub",
    .simple,
    10.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var handaxe: Weapon = Weapon.compInit(
    "Handaxe",
    .simple,
    2.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = true,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 20, .max = 60 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var javelin: Weapon = Weapon.compInit(
    "Javelin",
    .simple,
    2.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 30, .max = 120 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var light_hammer: Weapon = Weapon.compInit(
    "Light Hammer",
    .simple,
    2.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = true,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 20, .max = 60 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d4 },
);

pub var mace: Weapon = Weapon.compInit(
    "Mace",
    .simple,
    4.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
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
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var quarterstaff: Weapon = Weapon.compInit(
    "Quarterstaff",
    .simple,
    4.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = true,
        .versatile_dice = .{ .count = 1, .dice = &dice.d8 },
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var sickle: Weapon = Weapon.compInit(
    "Sickle",
    .simple,
    2.0,
    .{
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
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d4 },
);

pub var spear: Weapon = Weapon.compInit(
    "Spear",
    .simple,
    3.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 20, .max = 60 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = true,
        .versatile_dice = .{ .count = 1, .dice = &dice.d8 },
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

// Simple ranged weapons

pub var light_crossbow: Weapon = Weapon.compInit(
    "Light Crossbow",
    .simple,
    5.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = true,
        .range = true,
        .range_distance = .{ .normal = 80, .max = 320 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var dart: Weapon = Weapon.compInit(
    "Dart",
    .simple,
    0.25,
    .{
        .ammunition = false,
        .finesse = true,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 20, .max = 60 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d4 },
);

pub var shortbow: Weapon = Weapon.compInit(
    "Shortbow",
    .simple,
    2.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 80, .max = 320 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var sling: Weapon = Weapon.compInit(
    "Sling",
    .simple,
    0.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 30, .max = 120 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d4 },
);

// Martial melee weapons

pub var battleaxe: Weapon = Weapon.compInit(
    "Battleaxe",
    .martial,
    4.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = true,
        .versatile_dice = .{ .count = 1, .dice = &dice.d10 },
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var flail: Weapon = Weapon.compInit(
    "Flail",
    .martial,
    2.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
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
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var glaive: Weapon = Weapon.compInit(
    "Glaive",
    .martial,
    6.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = true,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d10 },
);

pub var greataxe: Weapon = Weapon.compInit(
    "Greataxe",
    .martial,
    7.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d12 },
);

pub var greatsword: Weapon = Weapon.compInit(
    "Greatsword",
    .martial,
    6.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .slashing,
    Roll{ .count = 2, .dice = &dice.d6 },
);

pub var halberd: Weapon = Weapon.compInit(
    "Halberd",
    .martial,
    6.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = true,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d10 },
);

pub var lance: Weapon = Weapon.compInit(
    "Lance",
    .martial,
    6.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = true,
        .special = true,
        .special_desc = "Attacks against targets within 5 feet have disadvantage. The lance requires two hands while the wielder is not mounted.",
        .thrown = false,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d12 },
);

pub var longsword: Weapon = Weapon.compInit(
    "Longsword",
    .martial,
    3.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = true,
        .versatile_dice = .{ .count = 1, .dice = &dice.d10 },
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var maul: Weapon = Weapon.compInit(
    "Maul",
    .martial,
    10.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .bludgeoning,
    Roll{ .count = 2, .dice = &dice.d6 },
);

pub var morningstar: Weapon = Weapon.compInit(
    "Morningstar",
    .martial,
    4.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
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
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var pike: Weapon = Weapon.compInit(
    "Pike",
    .martial,
    18.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = true,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d10 },
);

pub var rapier: Weapon = Weapon.compInit(
    "Rapier",
    .martial,
    2.0,
    .{
        .ammunition = false,
        .finesse = true,
        .heavy = false,
        .light = false,
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
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var scimitar: Weapon = Weapon.compInit(
    "Scimitar",
    .martial,
    3.0,
    .{
        .ammunition = false,
        .finesse = true,
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
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var shortsword: Weapon = Weapon.compInit(
    "Shortsword",
    .martial,
    2.0,
    .{
        .ammunition = false,
        .finesse = true,
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
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var trident: Weapon = Weapon.compInit(
    "Trident",
    .martial,
    4.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 20, .max = 60 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = true,
        .two_handed = false,
        .versatile = true,
        .versatile_dice = .{ .count = 1, .dice = &dice.d8 },
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var war_pick: Weapon = Weapon.compInit(
    "War Pick",
    .martial,
    2.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
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
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var warhammer: Weapon = Weapon.compInit(
    "Warhammer",
    .martial,
    2.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = true,
        .versatile_dice = .{ .count = 1, .dice = &dice.d10 },
    },
    .bludgeoning,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var whip: Weapon = Weapon.compInit(
    "Whip",
    .martial,
    3.0,
    .{
        .ammunition = false,
        .finesse = true,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = false,
        .range_distance = null,
        .reach = true,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .slashing,
    Roll{ .count = 1, .dice = &dice.d4 },
);

// Martial ranged weapons

pub var blowgun: Weapon = Weapon.compInit(
    "Blowgun",
    .martial,
    1.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = true,
        .range = true,
        .range_distance = .{ .normal = 25, .max = 100 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    null,
);

pub var hand_crossbow: Weapon = Weapon.compInit(
    "Hand Crossbow",
    .martial,
    3.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = false,
        .light = true,
        .loading = true,
        .range = true,
        .range_distance = .{ .normal = 30, .max = 120 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d6 },
);

pub var heavy_crossbow: Weapon = Weapon.compInit(
    "Heavy Crossbow",
    .martial,
    18.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = true,
        .range = true,
        .range_distance = .{ .normal = 100, .max = 400 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d10 },
);

pub var longbow: Weapon = Weapon.compInit(
    "Longbow",
    .martial,
    2.0,
    .{
        .ammunition = true,
        .finesse = false,
        .heavy = true,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 150, .max = 600 },
        .reach = false,
        .special = false,
        .special_desc = null,
        .thrown = false,
        .two_handed = true,
        .versatile = false,
        .versatile_dice = null,
    },
    .piercing,
    Roll{ .count = 1, .dice = &dice.d8 },
);

pub var net: Weapon = Weapon.compInit(
    "Net",
    .martial,
    3.0,
    .{
        .ammunition = false,
        .finesse = false,
        .heavy = false,
        .light = false,
        .loading = false,
        .range = true,
        .range_distance = .{ .normal = 5, .max = 15 },
        .reach = false,
        .special = true,
        .special_desc = "A Large or smaller non-formless creature hit by the net is restrained until freed. It can be freed with an action and a successful DC 10 Strength check, or by dealing 5 slashing damage to the AC 10 net. An action, bonus action, or reaction used to attack with the net can make only one attack.",
        .thrown = true,
        .two_handed = false,
        .versatile = false,
        .versatile_dice = null,
    },
    null,
    null,
);

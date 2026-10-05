const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const enums = @import("enums.zig");
const std = @import("std");
const hash = std.hash.Wyhash.hash;

pub const ArmorMod = struct {
    ability: enums.Ability,
    max: ?u8,
};

pub const ArmorClass = struct {
    base: u8,
    modifier: ?ArmorMod,
};

pub const Armor = struct {
    name: []const u8,
    hash: u64,
    armor_type: enums.ArmorCategory,
    armor_class: ArmorClass,
    stealth_disadvantage: bool,
    strength: ?u8,
    weight: f32,
    const Self = @This();
    fn compInit(
        comptime name: []const u8,
        comptime armor_type: enums.ArmorCategory,
        comptime armor_class: ArmorClass,
        comptime stealth_disadvantage: bool,
        comptime strength: ?u8,
        comptime weight: f32,
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .armor_type = armor_type,
            .armor_class = armor_class,
            .stealth_disadvantage = stealth_disadvantage,
            .strength = strength,
            .weight = weight,
        };
    }

    pub fn init(name: []const u8, armor_type: enums.ArmorCategory, armor_class: ArmorClass, stealth_disadvantage: bool, strength: ?u8, weight: f32) StdErr!Self {
        if (name.len == 0) {
            return StdErr.InvalidParameter;
        }
        if (weight < 0.0) {
            return StdErr.InvalidParameter;
        }

        return .{
            .name = name,
            .hash = hash(0, name),
            .armor_type = armor_type,
            .armor_class = armor_class,
            .stealth_disadvantage = stealth_disadvantage,
            .strength = strength,
            .weight = weight,
        };
    }

    pub fn clone(self: *Self) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .armor_type = self.armor_type,
            .armor_class = self.armor_class,
            .stealth_disadvantage = self.stealth_disadvantage,
            .strength = self.strength,
            .weight = self.weight,
        };
    }
};

pub const Shield = struct {
    name: []const u8,
    hash: u64,
    armor_type: enums.ArmorCategory,
    armor_mod: u8,
    weight: f32,
    const Self = @This();

    fn compInit(comptime name: []const u8, comptime armor_mod: u8, comptime weight: u8) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .armor_type = enums.ArmorCategory.shield,
            .armor_mod = armor_mod,
            .weight = weight,
        };
    }

    pub fn init(name: []const u8, armor_mod: u8, weight: u8) StdErr!Self {
        if (name.len == 0) {
            return StdErr.InvalidParameter;
        }
        return .{
            .name = name,
            .hash = hash(0, name),
            .armor_type = enums.ArmorCategory.shield,
            .armor_mod = armor_mod,
            .weight = weight,
        };
    }

    pub fn clone(self: *Self) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .armor_type = self.armor_type,
            .armor_mod = self.armor_mod,
            .weight = self.weight,
        };
    }
};

// ============================================================================
// Light Armor
// ============================================================================

pub const padded: Armor = Armor.compInit(
    "Padded",
    .light,
    .{
        .base = 11,
        .modifier = .{
            .ability = .dexterity,
            .max = null,
        },
    },
    true,
    null,
    8.0,
);

pub const leather: Armor = Armor.compInit(
    "Leather",
    .light,
    .{
        .base = 11,
        .modifier = .{
            .ability = .dexterity,
            .max = null,
        },
    },
    false,
    null,
    10.0,
);

pub const studded_leather: Armor = Armor.compInit(
    "Studded Leather",
    .light,
    .{
        .base = 12,
        .modifier = .{
            .ability = .dexterity,
            .max = null,
        },
    },
    false,
    null,
    13.0,
);

// ============================================================================
// Medium Armor
// ============================================================================

pub const hide: Armor = Armor.compInit(
    "Hide",
    .medium,
    .{
        .base = 12,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    false,
    null,
    12.0,
);

pub const chain_shirt: Armor = Armor.compInit(
    "Chain Shirt",
    .medium,
    .{
        .base = 13,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    false,
    null,
    20.0,
);

pub const scale_mail: Armor = Armor.compInit(
    "Scale Mail",
    .medium,
    .{
        .base = 14,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    true,
    null,
    45.0,
);

pub const breastplate: Armor = Armor.compInit(
    "Breastplate",
    .medium,
    .{
        .base = 14,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    false,
    null,
    20.0,
);

pub const half_plate: Armor = Armor.compInit(
    "Half Plate",
    .medium,
    .{
        .base = 15,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    true,
    null,
    40.0,
);

// ============================================================================
// Heavy Armor
// ============================================================================

pub const ring_mail: Armor = Armor.compInit(
    "Ring Mail",
    .heavy,
    .{
        .base = 14,
        .modifier = null,
    },
    true,
    null,
    40.0,
);

pub const chain_mail: Armor = Armor.compInit(
    "Chain Mail",
    .heavy,
    .{
        .base = 16,
        .modifier = null,
    },
    true,
    13,
    55.0,
);

pub const splint: Armor = Armor.compInit(
    "Splint",
    .heavy,
    .{
        .base = 17,
        .modifier = null,
    },
    true,
    15,
    60.0,
);

pub const plate: Armor = Armor.compInit(
    "Plate",
    .heavy,
    .{
        .base = 18,
        .modifier = null,
    },
    true,
    15,
    65.0,
);

// ============================================================================
// Shield
// ============================================================================

pub const shield: Shield = Shield.compInit(
    "Shield",
    2,
    6,
);

pub const armor_arr = [_]Armor{
    padded,
    leather,
    studded_leather,
    hide,
    chain_shirt,
    scale_mail,
    breastplate,
    half_plate,
    ring_mail,
    chain_mail,
    splint,
    plate,
};

pub const shield_arr = [_]Shield{
    shield,
};

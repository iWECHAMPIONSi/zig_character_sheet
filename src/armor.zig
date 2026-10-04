const enums = @import("enums.zig");

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
    armor_type: enums.ArmorCategory,
    armor_class: ArmorClass,
    stealth_disadvantage: bool,
    strength: ?u8,
    weight: f32,
};

pub const Shield = struct {
    name: []const u8,
    armor_type: enums.ArmorCategory,
    armor_mod: u8,
    weight: f32,
};

// Light Armor

pub var padded: Armor = .{
    .name = "Padded",
    .armor_type = .light,
    .armor_class = .{
        .base = 11,
        .modifier = .{
            .ability = .dexterity,
            .max = null,
        },
    },
    .stealth_disadvantage = true,
    .strength = null,
    .weight = 8.0,
};

pub var leather: Armor = .{
    .name = "Leather",
    .armor_type = .light,
    .armor_class = .{
        .base = 11,
        .modifier = .{
            .ability = .dexterity,
            .max = null,
        },
    },
    .stealth_disadvantage = false,
    .strength = null,
    .weight = 10.0,
};

pub var studded_leather: Armor = .{
    .name = "Studded Leather",
    .armor_type = .light,
    .armor_class = .{
        .base = 12,
        .modifier = .{
            .ability = .dexterity,
            .max = null,
        },
    },
    .stealth_disadvantage = false,
    .strength = null,
    .weight = 13.0,
};

// Medium Armor

pub var hide: Armor = .{
    .name = "Hide",
    .armor_type = .medium,
    .armor_class = .{
        .base = 12,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    .stealth_disadvantage = false,
    .strength = null,
    .weight = 12.0,
};

pub var chain_shirt: Armor = .{
    .name = "Chain Shirt",
    .armor_type = .medium,
    .armor_class = .{
        .base = 13,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    .stealth_disadvantage = false,
    .strength = null,
    .weight = 20.0,
};

pub var scale_mail: Armor = .{
    .name = "Scale Mail",
    .armor_type = .medium,
    .armor_class = .{
        .base = 14,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    .stealth_disadvantage = true,
    .strength = null,
    .weight = 45.0,
};

pub var breastplate: Armor = .{
    .name = "Breastplate",
    .armor_type = .medium,
    .armor_class = .{
        .base = 14,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    .stealth_disadvantage = false,
    .strength = null,
    .weight = 20.0,
};

pub var half_plate: Armor = .{
    .name = "Half Plate",
    .armor_type = .medium,
    .armor_class = .{
        .base = 15,
        .modifier = .{
            .ability = .dexterity,
            .max = 2,
        },
    },
    .stealth_disadvantage = true,
    .strength = null,
    .weight = 40.0,
};

// Heavy Armor

pub var ring_mail: Armor = .{
    .name = "Ring Mail",
    .armor_type = .heavy,
    .armor_class = .{
        .base = 14,
        .modifier = null,
    },
    .stealth_disadvantage = true,
    .strength = null,
    .weight = 40.0,
};

pub var chain_mail: Armor = .{
    .name = "Chain Mail",
    .armor_type = .heavy,
    .armor_class = .{
        .base = 16,
        .modifier = null,
    },
    .stealth_disadvantage = true,
    .strength = 13,
    .weight = 55.0,
};

pub var splint: Armor = .{
    .name = "Splint",
    .armor_type = .heavy,
    .armor_class = .{
        .base = 17,
        .modifier = null,
    },
    .stealth_disadvantage = true,
    .strength = 15,
    .weight = 60.0,
};

pub var plate: Armor = .{
    .name = "Plate",
    .armor_type = .heavy,
    .armor_class = .{
        .base = 18,
        .modifier = null,
    },
    .stealth_disadvantage = true,
    .strength = 15,
    .weight = 65.0,
};

// Shield

pub var shield: Shield = .{
    .name = "Shield",
    .armor_type = .shield,
    .armor_mod = 2,
    .weight = 6.0,
};

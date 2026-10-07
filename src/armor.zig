const items = @import("items.zig");
const Item = items.Item;

// Armor values are based on the 2014 armor table.
// Spiked Armor is sourced from Sword Coast Adventurer's Guide.

// ============================================================================
// Light Armor
// ============================================================================

pub const padded: Item = Item.compInit(
    "Padded",
    .phb14,
    false,
    .{ .unit = .pound, .count = 8.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Don: 1 minute; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const leather: Item = Item.compInit(
    "Leather",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Don: 1 minute; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const studded_leather: Item = Item.compInit(
    "Studded Leather",
    .phb14,
    false,
    .{ .unit = .pound, .count = 13.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 45 },
    null,
    "Don: 1 minute; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 45 }, .count = 1, .wrapping_container = null },
);

// ============================================================================
// Medium Armor
// ============================================================================

pub const hide: Item = Item.compInit(
    "Hide",
    .phb14,
    false,
    .{ .unit = .pound, .count = 12.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Don: 5 minutes; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const chain_shirt: Item = Item.compInit(
    "Chain Shirt",
    .phb14,
    false,
    .{ .unit = .pound, .count = 20.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    "Don: 5 minutes; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = null },
);

pub const scale_mail: Item = Item.compInit(
    "Scale Mail",
    .phb14,
    false,
    .{ .unit = .pound, .count = 45.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    "Don: 5 minutes; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = null },
);

pub const spiked_armor: Item = Item.compInit(
    "Spiked Armor",
    .scag,
    false,
    .{ .unit = .pound, .count = 45.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 75 },
    null,
    "Don: 5 minutes; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 75 }, .count = 1, .wrapping_container = null },
);

pub const breastplate: Item = Item.compInit(
    "Breastplate",
    .phb14,
    false,
    .{ .unit = .pound, .count = 20.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 400 },
    null,
    "Don: 5 minutes; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 400 }, .count = 1, .wrapping_container = null },
);

pub const half_plate: Item = Item.compInit(
    "Half Plate",
    .phb14,
    false,
    .{ .unit = .pound, .count = 40.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 750 },
    null,
    "Don: 5 minutes; Doff: 1 minute.",
    null,
    null,
    null,
    .{
        .armor = .{
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
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 750 }, .count = 1, .wrapping_container = null },
);

// ============================================================================
// Heavy Armor
// ============================================================================

pub const ring_mail: Item = Item.compInit(
    "Ring Mail",
    .phb14,
    false,
    .{ .unit = .pound, .count = 40.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 30 },
    null,
    "Don: 10 minutes; Doff: 5 minutes.",
    null,
    null,
    null,
    .{
        .armor = .{
            .armor_type = .heavy,
            .armor_class = .{
                .base = 14,
                .modifier = null,
            },
            .stealth_disadvantage = true,
            .strength = null,
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 30 }, .count = 1, .wrapping_container = null },
);

pub const chain_mail: Item = Item.compInit(
    "Chain Mail",
    .phb14,
    false,
    .{ .unit = .pound, .count = 55.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 75 },
    null,
    "Don: 10 minutes; Doff: 5 minutes.",
    null,
    null,
    null,
    .{
        .armor = .{
            .armor_type = .heavy,
            .armor_class = .{
                .base = 16,
                .modifier = null,
            },
            .stealth_disadvantage = true,
            .strength = 13,
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 75 }, .count = 1, .wrapping_container = null },
);

pub const splint: Item = Item.compInit(
    "Splint",
    .phb14,
    false,
    .{ .unit = .pound, .count = 60.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 200 },
    null,
    "Don: 10 minutes; Doff: 5 minutes.",
    null,
    null,
    null,
    .{
        .armor = .{
            .armor_type = .heavy,
            .armor_class = .{
                .base = 17,
                .modifier = null,
            },
            .stealth_disadvantage = true,
            .strength = 15,
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 200 }, .count = 1, .wrapping_container = null },
);

pub const plate: Item = Item.compInit(
    "Plate",
    .phb14,
    false,
    .{ .unit = .pound, .count = 65.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 1500 },
    null,
    "Don: 10 minutes; Doff: 5 minutes.",
    null,
    null,
    null,
    .{
        .armor = .{
            .armor_type = .heavy,
            .armor_class = .{
                .base = 18,
                .modifier = null,
            },
            .stealth_disadvantage = true,
            .strength = 15,
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 1500 }, .count = 1, .wrapping_container = null },
);

// ============================================================================
// Shield
// ============================================================================

pub const shield: Item = Item.compInit(
    "Shield",
    .phb14,
    false,
    .{ .unit = .pound, .count = 6.0 },
    .{ .unit = .ounce, .count = 0.0 },
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Don: 1 action; Doff: 1 action.",
    null,
    null,
    null,
    .{
        .shield = .{
            .armor_type = .shield,
            .stealth_disadvantage = false,
            .strength = null,
            .armor_mod = 2,
        },
    },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

// ============================================================================
// Definition Arrays
// ============================================================================

pub const armor_arr = [_]Item{
    padded,
    leather,
    studded_leather,
    hide,
    chain_shirt,
    scale_mail,
    spiked_armor,
    breastplate,
    half_plate,
    ring_mail,
    chain_mail,
    splint,
    plate,
};

pub const shield_arr = [_]Item{
    shield,
};

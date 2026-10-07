const items = @import("items.zig");
const Item = items.Item;
const Description = items.Description;

const rope_desc: Description = .{
    .desc = "A fifty-foot length of rope.",
    .desc_fields = &.{
        .{
            .table = .{
                .headings = &.{ "Property", "Value" },
                .table_entry = &.{
                    &.{ .{ .str = "Hit Points" }, .{ .int = 2 } },
                    &.{ .{ .str = "Burst Strength DC" }, .{ .int = 17 } },
                },
            },
            .heading = "Durability",
            .desc = null,
        },
    },
};

const arcane_focus_desc: Description = .{
    .desc = "A specially constructed object used to channel arcane magic.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Spellcasting Focus",
            .desc = "A sorcerer, warlock, or wizard can use this item as a spellcasting focus.",
        },
    },
};

const druidic_focus_desc: Description = .{
    .desc = "A natural or sacred object used to channel druidic magic.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Spellcasting Focus",
            .desc = "A druid can use this item as a spellcasting focus.",
        },
    },
};

const holy_symbol_desc: Description = .{
    .desc = "A representation of a god or pantheon.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Spellcasting Focus",
            .desc = "A cleric or paladin can use the symbol as a spellcasting focus. To do so, the caster must hold it, wear it visibly, or bear it on a shield.",
        },
    },
};

const weapons = @import("weapons.zig");

// Adventuring gear definitions.
// Data source: 2014 Player's Handbook equipment tables as represented by
// dnd5e.wikidot.com/adventuring-gear, plus the Dragonlance-specific entries.
//
// Items without an explicit source price intentionally have shop_entry = null.
// Bundle prices use ShopEntry.count rather than turning a bundle into one Item.
// Descriptions are concise paraphrases, not source text.

pub const string_10_ft: Item = Item.compInit(
    "String (10 ft)",
    .phb14,
    false,
    null,
    null,
    .{ .unit = .foot, .count = 10 },
    null,
    null,
    null,
    .{ .desc = "A ten-foot length of string.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const alms_box: Item = Item.compInit(
    "Alms Box",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "A small box intended for collecting alms.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const incense_block: Item = Item.compInit(
    "Block of Incense",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "A block of incense.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const censer: Item = Item.compInit(
    "Censer",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "A vessel used for burning incense.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const vestments: Item = Item.compInit(
    "Vestments",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "Religious vestments.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const small_bag_of_sand: Item = Item.compInit(
    "Small Bag of Sand",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "A small bag containing sand.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const small_knife: Item = Item.compInit(
    "Small Knife",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "A small utility knife.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const abacus: Item = Item.compInit(
    "Abacus",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    .{ .desc = "A counting frame.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const bedroll: Item = Item.compInit(
    "Bedroll",
    .phb14,
    false,
    .{ .unit = .pound, .count = 7.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const bell: Item = Item.compInit(
    "Bell",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const blanket: Item = Item.compInit(
    "Blanket",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const block_and_tackle: Item = Item.compInit(
    "Block and Tackle",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    .{
        .desc = "A pulley-and-cable lifting rig with a hook for attaching to objects.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Hoisting",
                .desc = "The rig allows its user to hoist up to four times the weight they could normally lift.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const book: Item = Item.compInit(
    "Book",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    .{ .desc = "A bound book containing text, illustrations, notes, or other written material.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const candle: Item = Item.compInit(
    "Candle",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .copper, .count = 1 },
    null,
    null,
    .{
        .desc = null,
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Light",
                .desc = "Burns for 1 hour, shedding bright light in a 5-foot radius and dim light for another 5 feet.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const chain_10_ft: Item = Item.compInit(
    "Chain (10 ft)",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    null,
    .{ .unit = .foot, .count = 10 },
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    .{
        .desc = "A ten-foot length of chain.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Property", "Value" },
                    .table_entry = &.{
                        &.{ .{ .str = "Hit Points" }, .{ .int = 10 } },
                        &.{ .{ .str = "Burst Strength DC" }, .{ .int = 20 } },
                    },
                },
                .heading = "Durability",
                .desc = null,
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const chalk: Item = Item.compInit(
    "Chalk (1 pc)",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .copper, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const component_pouch: Item = Item.compInit(
    "Component Pouch",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    .{
        .desc = "A small, watertight, compartmentalized belt pouch for spellcasting materials.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Spell Components",
                .desc = "It can hold material components and similar spellcasting items, except components that have a specific listed cost.",
            },
        },
    },
    null,
    null,
    .{ .small_container = .{ .contents = null, .valid_items = .{ .items = true, .fluids = false } } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const fishing_tackle: Item = Item.compInit(
    "Fishing Tackle",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    .{ .desc = "A kit with a rod, line, hooks, sinkers, floats, lures, and narrow netting.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const grappling_hook: Item = Item.compInit(
    "Grappling Hook",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const hammer: Item = Item.compInit(
    "Hammer",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const hourglass: Item = Item.compInit(
    "Hourglass",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const ink_bottle_1_oz: Item = Item.compInit(
    "Ink Bottle (1 oz)",
    .phb14,
    false,
    null,
    .{ .unit = .ounce, .count = 1 },
    null,
    null,
    null,
    null,
    .{ .desc = "A small bottle sized to hold one ounce of ink.", .desc_fields = null },
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .ounce, .count = 1 }, .weight_full = null, .volume_of_contents = null } },
    null,
);

pub const ink: Item = Item.compInit(
    "Ink (1 oz)",
    .phb14,
    false,
    null,
    .{ .unit = .ounce, .count = 1 },
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    null,
    null,
    null,
    .{ .fluid = .{ .default_container = ink_bottle_1_oz.hash, .weight = null } },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = ink_bottle_1_oz.hash },
);

pub const ink_pen: Item = Item.compInit(
    "Ink Pen",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .copper, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const ladder_10_ft: Item = Item.compInit(
    "Ladder (10 ft)",
    .phb14,
    false,
    .{ .unit = .pound, .count = 25.0 },
    null,
    .{ .unit = .foot, .count = 10 },
    .{ .currency = .silver, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const lock: Item = Item.compInit(
    "Lock",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    .{
        .desc = "A lock supplied with a matching key.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Check", "DC" },
                    .table_entry = &.{
                        &.{ .{ .str = "Dexterity (Thieves' Tools)" }, .{ .int = 15 } },
                    },
                },
                .heading = "Picking the Lock",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Variants",
                .desc = "More expensive or difficult locks can exist at the DM's discretion.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const magnifying_glass: Item = Item.compInit(
    "Magnifying Glass",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 100 },
    null,
    null,
    .{
        .desc = "A lens for inspecting small or highly detailed objects.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Inspection",
                .desc = "Using it to appraise or inspect a small or highly detailed object grants advantage on the relevant ability check.",
            },
            .{
                .table = null,
                .heading = "Starting Fires",
                .desc = "In light as bright as sunlight, it can focus light onto tinder. Igniting a fire this way takes about 5 minutes.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 100 }, .count = 1, .wrapping_container = null },
);

pub const manacles: Item = Item.compInit(
    "Manacles",
    .phb14,
    false,
    .{ .unit = .pound, .count = 6.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    .{
        .desc = "Metal restraints sized to bind a Small or Medium creature.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Action", "Check", "DC" },
                    .table_entry = &.{
                        &.{ .{ .str = "Escape" }, .{ .str = "Dexterity" }, .{ .int = 20 } },
                        &.{ .{ .str = "Break" }, .{ .str = "Strength" }, .{ .int = 20 } },
                        &.{ .{ .str = "Pick Lock" }, .{ .str = "Dexterity (Thieves' Tools)" }, .{ .int = 15 } },
                    },
                },
                .heading = "Checks",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Durability",
                .desc = "A set of manacles has 15 hit points.",
            },
            .{
                .table = null,
                .heading = "Key",
                .desc = "Each set is supplied with one key.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const mess_kit: Item = Item.compInit(
    "Mess Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .silver, .count = 2 },
    null,
    null,
    .{ .desc = "A compact tin eating set whose two halves can serve as cookware and dishes.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const miners_pick: Item = Item.compInit(
    "Miner's Pick",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const paper: Item = Item.compInit(
    "Paper (1 sheet)",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .silver, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const parchment: Item = Item.compInit(
    "Parchment (1 sheet)",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .silver, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const pouch: Item = Item.compInit(
    "Pouch",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    "Capacity: about 1/5 cubic foot or 6 pounds of gear; commonly holds up to 20 sling bullets or 50 blowgun needles.",
    null,
    null,
    null,
    .{ .small_container = .{ .contents = null, .valid_items = .{ .items = true, .fluids = false } } },
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const perfume: Item = Item.compInit(
    "Perfume (vial)",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    .{ .fluid = .{ .default_container = vial.hash, .weight = null } },
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = vial.hash },
);

pub const piton: Item = Item.compInit(
    "Piton",
    .phb14,
    false,
    .{ .unit = .pound, .count = 0.25 },
    null,
    null,
    .{ .currency = .copper, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const pole_10_ft: Item = Item.compInit(
    "Pole (10 ft)",
    .phb14,
    false,
    .{ .unit = .pound, .count = 7.0 },
    null,
    .{ .unit = .foot, .count = 10 },
    .{ .currency = .copper, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const portable_ram: Item = Item.compInit(
    "Portable Ram",
    .phb14,
    false,
    .{ .unit = .pound, .count = 35.0 },
    null,
    null,
    .{ .currency = .gold, .count = 4 },
    null,
    null,
    .{
        .desc = "A heavy portable ram intended for forcing open doors.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Breaking Doors",
                .desc = "Using the ram grants a +4 bonus to the Strength check.",
            },
            .{
                .table = null,
                .heading = "Assistance",
                .desc = "One other creature can help operate the ram, granting advantage on the check.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 4 }, .count = 1, .wrapping_container = null },
);

pub const ration: Item = Item.compInit(
    "Rations (1 day)",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    .{ .desc = "Dry, travel-stable food sufficient for one day.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const hempen_rope_50_ft: Item = Item.compInit(
    "Hempen Rope (50 ft)",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    null,
    .{ .unit = .foot, .count = 50 },
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    rope_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const silk_rope_50_ft: Item = Item.compInit(
    "Silk Rope (50 ft)",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    .{ .unit = .foot, .count = 50 },
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    rope_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const sealing_wax: Item = Item.compInit(
    "Sealing Wax",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const shovel: Item = Item.compInit(
    "Shovel",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const signal_whistle: Item = Item.compInit(
    "Signal Whistle",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .copper, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const signet_ring: Item = Item.compInit(
    "Signet Ring",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const sledgehammer: Item = Item.compInit(
    "Sledgehammer",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const spellbook: Item = Item.compInit(
    "Spellbook",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    null,
    .{ .desc = "A leather-bound tome with 100 blank vellum pages suitable for recording spells.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = null },
);

pub const iron_spike: Item = Item.compInit(
    "Iron Spike",
    .phb14,
    false,
    .{ .unit = .pound, .count = 0.5 },
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 10, .wrapping_container = null },
);

pub const spyglass: Item = Item.compInit(
    "Spyglass",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1000 },
    null,
    null,
    .{ .desc = "Magnifies viewed objects to about twice their apparent size.", .desc_fields = null },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1000 }, .count = 1, .wrapping_container = null },
);

pub const two_person_tent: Item = Item.compInit(
    "Two-Person Tent",
    .phb14,
    false,
    .{ .unit = .pound, .count = 20.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const whetstone: Item = Item.compInit(
    "Whetstone",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .copper, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const backpack: Item = Item.compInit(
    "Backpack",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    "Capacity: 1 cubic foot or 30 pounds of gear. Items such as a bedroll or rope can be strapped outside.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = .{ .unit = .foot, .count = 1.0 }, .weight_limit = .{ .unit = .pound, .count = 30.0 }, .item_limit = null, .item_bias = null, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = true } },
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const barrel: Item = Item.compInit(
    "Barrel",
    .phb14,
    false,
    .{ .unit = .pound, .count = 70.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    "Capacity: 40 gallons of liquid or 4 cubic feet of solid material.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = .{ .unit = .gallon, .count = 40.0 }, .cubic_volume_limit = .{ .unit = .foot, .count = 4.0 }, .weight_limit = null, .item_limit = null, .item_bias = null, .valid_items = .{ .items = true, .fluids = true }, .outside_slots = false } },
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const basket: Item = Item.compInit(
    "Basket",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .silver, .count = 4 },
    null,
    "Capacity: 2 cubic feet or 40 pounds of gear.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = .{ .unit = .foot, .count = 2.0 }, .weight_limit = .{ .unit = .pound, .count = 40.0 }, .item_limit = null, .item_bias = null, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = false } },
    .{ .cost = .{ .currency = .silver, .count = 4 }, .count = 1, .wrapping_container = null },
);

pub const bucket: Item = Item.compInit(
    "Bucket",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .copper, .count = 5 },
    null,
    "Capacity: 3 gallons of liquid or 1/2 cubic foot of solid material.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = .{ .unit = .gallon, .count = 3.0 }, .cubic_volume_limit = .{ .unit = .foot, .count = 0.5 }, .weight_limit = null, .item_limit = null, .item_bias = null, .valid_items = .{ .items = true, .fluids = true }, .outside_slots = false } },
    .{ .cost = .{ .currency = .copper, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const crossbow_bolt_case: Item = Item.compInit(
    "Crossbow Bolt Case",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    "Capacity: 20 crossbow bolts.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = null, .weight_limit = null, .item_limit = 20, .item_bias = &.{weapons.crossbow_bolt.hash}, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = false } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const map_scroll_case: Item = Item.compInit(
    "Map or Scroll Case",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    "Capacity: ten rolled sheets of paper or five rolled sheets of parchment.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = null, .weight_limit = null, .item_limit = 10, .item_bias = &.{ parchment.hash, paper.hash }, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = false } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const chest: Item = Item.compInit(
    "Chest",
    .phb14,
    false,
    .{ .unit = .pound, .count = 25.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Capacity: 12 cubic feet or 300 pounds of gear.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = .{ .unit = .foot, .count = 12.0 }, .weight_limit = .{ .unit = .pound, .count = 300.0 }, .item_limit = null, .item_bias = null, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = false } },
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const flask: Item = Item.compInit(
    "Flask",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    .{ .unit = .pint, .count = 1 },
    null,
    .{ .currency = .copper, .count = 2 },
    null,
    "Capacity: 1 pint of liquid.",
    null,
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .pint, .count = 1.0 }, .weight_full = null, .volume_of_contents = null } },
    .{ .cost = .{ .currency = .copper, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const glass_bottle: Item = Item.compInit(
    "Glass Bottle",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    .{ .unit = .pint, .count = 1.5 },
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    "Capacity: 1.5 pints of liquid.",
    null,
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .pint, .count = 1.5 }, .weight_full = null, .volume_of_contents = null } },
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const jug: Item = Item.compInit(
    "Jug",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    .{ .unit = .gallon, .count = 1 },
    null,
    .{ .currency = .copper, .count = 2 },
    null,
    "Capacity: 1 gallon of liquid.",
    null,
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .gallon, .count = 1.0 }, .weight_full = null, .volume_of_contents = null } },
    .{ .cost = .{ .currency = .copper, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const iron_pot: Item = Item.compInit(
    "Iron Pot",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    .{ .unit = .gallon, .count = 1 },
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    "Capacity: 1 gallon of liquid.",
    null,
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .gallon, .count = 1.0 }, .weight_full = null, .volume_of_contents = null } },
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const quiver: Item = Item.compInit(
    "Quiver",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    "Capacity: 20 arrows.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = null, .weight_limit = null, .item_limit = 20, .item_bias = &.{weapons.arrow.hash}, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = false } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const sack: Item = Item.compInit(
    "Sack",
    .phb14,
    false,
    .{ .unit = .pound, .count = 0.5 },
    null,
    null,
    .{ .currency = .copper, .count = 1 },
    null,
    "Capacity: 1 cubic foot or 30 pounds of gear.",
    null,
    null,
    null,
    .{ .container = .{ .contents = null, .volume_limit = null, .cubic_volume_limit = .{ .unit = .foot, .count = 1.0 }, .weight_limit = .{ .unit = .pound, .count = 30.0 }, .item_limit = null, .item_bias = null, .valid_items = .{ .items = true, .fluids = false }, .outside_slots = false } },
    .{ .cost = .{ .currency = .copper, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const vial: Item = Item.compInit(
    "Vial",
    .phb14,
    false,
    null,
    .{ .unit = .ounce, .count = 4 },
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    "Capacity: 4 ounces of liquid.",
    null,
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .ounce, .count = 4.0 }, .weight_full = null, .volume_of_contents = null } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const water: Item = Item.compInit(
    "Water",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .fluid = .{ .weight = null, .default_container = waterskin.hash } },
    null,
);

pub const waterskin: Item = Item.compInit(
    "Waterskin",
    .phb14,
    false,
    null,
    .{ .unit = .pint, .count = 4 },
    null,
    .{ .currency = .silver, .count = 2 },
    null,
    "Capacity: 4 pints of liquid. Listed weight is 5 pounds when full.",
    null,
    null,
    null,
    .{ .fluid_container = .{ .fluid = null, .volume_limit = .{ .unit = .pint, .count = 4.0 }, .weight_full = .{ .unit = .pound, .count = 5.0 }, .volume_of_contents = null } },
    .{ .cost = .{ .currency = .silver, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const acid: Item = Item.compInit(
    "Acid",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    .{
        .desc = "A vial of corrosive acid.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Use",
                .desc = "As an action, the acid can be splashed onto a creature within 5 feet or thrown up to 20 feet. A thrown or splashed attack is treated as an improvised ranged weapon attack against a creature or object.",
            },
            .{
                .table = null,
                .heading = "On Hit",
                .desc = "The target takes 2d6 acid damage.",
            },
        },
    },
    null,
    null,
    .{ .fluid = .{ .default_container = vial.hash, .weight = .{ .unit = .pound, .count = 1.0 } } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = vial.hash },
);

pub const alchemists_fire: Item = Item.compInit(
    "Alchemist's Fire",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    null,
    .{
        .desc = "A sticky fluid that ignites when exposed to air.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Use",
                .desc = "As an action, the flask can be thrown up to 20 feet as an improvised ranged weapon attack against a creature or object.",
            },
            .{
                .table = null,
                .heading = "On Hit",
                .desc = "The target takes 1d4 fire damage at the start of each of its turns.",
            },
            .{
                .table = null,
                .heading = "Extinguish",
                .desc = "A creature can use its action to make a DC 10 Dexterity check to extinguish the flames.",
            },
        },
    },
    null,
    null,
    .{ .fluid = .{ .default_container = flask.hash, .weight = .{ .unit = .pound, .count = 1.0 } } },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = flask.hash },
);

pub const antitoxin: Item = Item.compInit(
    "Antitoxin",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    null,
    .{
        .desc = "A vial of liquid used to resist poison.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Effect",
                .desc = "For 1 hour after drinking it, the creature has advantage on saving throws against poison.",
            },
            .{
                .table = null,
                .heading = "Exceptions",
                .desc = "The antitoxin provides no benefit to undead or constructs.",
            },
        },
    },
    null,
    null,
    .{ .fluid = .{ .default_container = vial.hash, .weight = null } },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = vial.hash },
);

pub const ball_bearing: Item = Item.compInit(
    "Ball Bearing",
    .phb14,
    false,
    .{ .unit = .pound, .count = 0.002 },
    null,
    null,
    null,
    null,
    null,
    .{
        .desc = "A single steel ball bearing. The standard shop bundle contains 1,000 in a pouch.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Deploy (1,000 Bearings)",
                .desc = "As an action, a full bag can be spilled over a level 10-foot-square area.",
            },
            .{
                .table = null,
                .heading = "Effect",
                .desc = "A creature moving across the area must succeed on a DC 10 Dexterity saving throw or fall prone.",
            },
            .{
                .table = null,
                .heading = "Careful Movement",
                .desc = "A creature moving through the area at half speed does not need to make the saving throw.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1000, .wrapping_container = pouch.hash },
);

pub const caltrop: Item = Item.compInit(
    "Caltrop",
    .phb14,
    false,
    .{ .unit = .pound, .count = 0.1 },
    null,
    null,
    null,
    null,
    null,
    .{
        .desc = "A single caltrop. The standard shop bundle contains 20 in a pouch.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Deploy (20 Caltrops)",
                .desc = "As an action, a full bag can be spread over a 5-foot-square area.",
            },
            .{
                .table = null,
                .heading = "Effect",
                .desc = "A creature entering the area must succeed on a DC 15 Dexterity saving throw or stop moving and take 1 piercing damage. Its walking speed is reduced by 10 feet until it regains at least 1 hit point.",
            },
            .{
                .table = null,
                .heading = "Careful Movement",
                .desc = "A creature moving through the area at half speed does not need to make the saving throw.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 20, .wrapping_container = pouch.hash },
);

pub const climbers_kit: Item = Item.compInit(
    "Climber's Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 12.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    .{
        .desc = "A kit containing specialized pitons, boot tips, gloves, and a harness.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Anchor",
                .desc = "As an action, the user can anchor themself. While anchored, they cannot fall more than 25 feet from the anchor point and cannot climb more than 25 feet away without undoing the anchor.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const crowbar: Item = Item.compInit(
    "Crowbar",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    .{
        .desc = "A sturdy lever used to pry or force objects.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Leverage",
                .desc = "When the crowbar's leverage can be applied, it grants advantage on the relevant Strength check.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const healers_kit: Item = Item.compInit(
    "Healer's Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    .{
        .desc = "A leather pouch containing bandages, salves, and splints.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Uses",
                .desc = "The kit has 10 uses.",
            },
            .{
                .table = null,
                .heading = "Stabilize",
                .desc = "As an action, one use can be expended to stabilize a creature at 0 hit points without requiring a Wisdom (Medicine) check.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const holy_water: Item = Item.compInit(
    "Holy Water",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    .{
        .desc = "A flask of consecrated water.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Use",
                .desc = "As an action, it can be splashed onto a creature within 5 feet or thrown up to 20 feet as an improvised ranged weapon attack.",
            },
            .{
                .table = null,
                .heading = "Damage",
                .desc = "A fiend or undead hit by the holy water takes 2d6 radiant damage.",
            },
            .{
                .table = null,
                .heading = "Creation",
                .desc = "A cleric or paladin can create holy water with a 1-hour ritual that consumes 25 gp of powdered silver and a 1st-level spell slot.",
            },
        },
    },
    null,
    null,
    .{ .fluid = .{ .default_container = flask.hash, .weight = .{ .unit = .pound, .count = 1.0 } } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = flask.hash },
);

pub const hunting_trap: Item = Item.compInit(
    "Hunting Trap",
    .phb14,
    false,
    .{ .unit = .pound, .count = 25.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    .{
        .desc = "A chained, pressure-triggered steel trap.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Set",
                .desc = "Using an action sets the trap and secures its chain to an immobile object.",
            },
            .{
                .table = null,
                .heading = "Trigger",
                .desc = "A creature stepping on the pressure plate must make a DC 13 Dexterity saving throw. On a failure it takes 1d4 piercing damage and stops moving.",
            },
            .{
                .table = null,
                .heading = "Restrained Movement",
                .desc = "Until freed, the creature's movement is limited by the trap's chain, typically to about 3 feet.",
            },
            .{
                .table = null,
                .heading = "Escape",
                .desc = "A creature can use its action to make a DC 13 Strength check to free itself or another creature within reach. Each failed attempt deals 1 piercing damage to the trapped creature.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const lamp: Item = Item.compInit(
    "Lamp",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    .{
        .desc = "An oil-burning lamp.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Light", "Distance" },
                    .table_entry = &.{
                        &.{ .{ .str = "Bright" }, .{ .str = "15-foot radius" } },
                        &.{ .{ .str = "Dim" }, .{ .str = "Additional 30 feet" } },
                    },
                },
                .heading = "Light",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Fuel",
                .desc = "One pint of oil burns for 6 hours.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const bullseye_lantern: Item = Item.compInit(
    "Bullseye Lantern",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    .{
        .desc = "An oil-burning lantern that projects light forward.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Light", "Distance" },
                    .table_entry = &.{
                        &.{ .{ .str = "Bright" }, .{ .str = "60-foot cone" } },
                        &.{ .{ .str = "Dim" }, .{ .str = "Additional 60 feet" } },
                    },
                },
                .heading = "Light",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Fuel",
                .desc = "One pint of oil burns for 6 hours.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const hooded_lantern: Item = Item.compInit(
    "Hooded Lantern",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    .{
        .desc = "An oil-burning lantern with an adjustable hood.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Light", "Distance" },
                    .table_entry = &.{
                        &.{ .{ .str = "Bright" }, .{ .str = "30-foot radius" } },
                        &.{ .{ .str = "Dim" }, .{ .str = "Additional 30 feet" } },
                    },
                },
                .heading = "Light",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Fuel",
                .desc = "One pint of oil burns for 6 hours.",
            },
            .{
                .table = null,
                .heading = "Lower Hood",
                .desc = "As an action, the hood can be lowered to reduce the light to dim light in a 5-foot radius.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const oil: Item = Item.compInit(
    "Oil",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .silver, .count = 1 },
    null,
    null,
    .{
        .desc = "A pint of lamp oil, normally carried in a flask.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Splash or Throw",
                .desc = "As an action, the oil can be splashed onto a creature within 5 feet or thrown up to 20 feet as an improvised ranged weapon attack. On a hit, the target is coated in oil.",
            },
            .{
                .table = null,
                .heading = "Ignited Target",
                .desc = "If the coated target takes fire damage before the oil dries after 1 minute, it takes an additional 5 fire damage.",
            },
            .{
                .table = null,
                .heading = "Ground Use",
                .desc = "A flask can cover a level 5-foot-square area. If ignited, it burns for 2 rounds and deals 5 fire damage to a creature that enters the area or ends its turn there, at most once per turn.",
            },
        },
    },
    null,
    null,
    .{ .fluid = .{ .default_container = flask.hash, .weight = .{ .unit = .pound, .count = 1.0 } } },
    .{ .cost = .{ .currency = .silver, .count = 1 }, .count = 1, .wrapping_container = flask.hash },
);

pub const basic_poison: Item = Item.compInit(
    "Basic Poison",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 100 },
    null,
    null,
    .{
        .desc = "A vial of basic injury poison.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Application",
                .desc = "Applying it takes an action and can coat one slashing or piercing weapon or up to three pieces of ammunition.",
            },
            .{
                .table = null,
                .heading = "Effect",
                .desc = "A creature hit by the coated weapon or ammunition must succeed on a DC 10 Constitution saving throw or take 1d4 poison damage.",
            },
            .{
                .table = null,
                .heading = "Potency",
                .desc = "Once applied, the poison remains potent for 1 minute before drying.",
            },
        },
    },
    null,
    null,
    .{ .fluid = .{ .default_container = vial.hash, .weight = null } },
    .{ .cost = .{ .currency = .gold, .count = 100 }, .count = 1, .wrapping_container = vial.hash },
);

pub const potion_of_healing: Item = Item.compInit(
    "Potion of Healing",
    .phb14,
    true,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    .common,
    null,
    .{
        .desc = "A common red healing potion whose liquid glimmers when disturbed.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Effect",
                .desc = "Drinking the potion restores 2d4 + 2 hit points.",
            },
        },
    },
    null,
    null,
    .{ .potion = .{ .default_container = vial.hash, .weight = .{ .unit = .pound, .count = 0.5 } } },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = vial.hash },
);

pub const tinderbox: Item = Item.compInit(
    "Tinderbox",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    .{
        .desc = "A small container holding flint, fire steel, and tinder.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Exposed Fuel",
                .desc = "Lighting a torch or another object with abundant exposed fuel takes an action.",
            },
            .{
                .table = null,
                .heading = "Other Fires",
                .desc = "Lighting a less readily ignited fire takes about 1 minute.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const torch: Item = Item.compInit(
    "Torch",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .copper, .count = 1 },
    null,
    null,
    .{
        .desc = "A portable burning light source.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Light",
                .desc = "Burns for 1 hour, shedding bright light in a 20-foot radius and dim light for another 20 feet.",
            },
            .{
                .table = null,
                .heading = "Weapon",
                .desc = "A successful melee attack made with a burning torch deals 1 fire damage.",
            },
        },
    },
    null,
    null,
    null,
    .{ .cost = .{ .currency = .copper, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const common_clothes: Item = Item.compInit(
    "Common Clothes",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const costume: Item = Item.compInit(
    "Costume",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const fine_clothes: Item = Item.compInit(
    "Fine Clothes",
    .phb14,
    false,
    .{ .unit = .pound, .count = 6.0 },
    null,
    null,
    .{ .currency = .gold, .count = 15 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 15 }, .count = 1, .wrapping_container = null },
);

pub const robes: Item = Item.compInit(
    "Robes",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const travelers_clothes: Item = Item.compInit(
    "Traveler's Clothes",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const arcane_crystal: Item = Item.compInit(
    "Crystal",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Arcane spellcasting focus.",
    arcane_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const arcane_orb: Item = Item.compInit(
    "Orb",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 20 },
    null,
    "Arcane spellcasting focus.",
    arcane_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 20 }, .count = 1, .wrapping_container = null },
);

pub const arcane_rod: Item = Item.compInit(
    "Rod",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Arcane spellcasting focus.",
    arcane_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const arcane_staff: Item = Item.compInit(
    "Staff",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Arcane spellcasting focus.",
    arcane_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const arcane_wand: Item = Item.compInit(
    "Wand",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Arcane spellcasting focus.",
    arcane_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const sprig_of_mistletoe: Item = Item.compInit(
    "Sprig of Mistletoe",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    "Druidic spellcasting focus.",
    druidic_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const druidic_totem: Item = Item.compInit(
    "Totem",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    "Druidic spellcasting focus.",
    druidic_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const wooden_staff: Item = Item.compInit(
    "Wooden Staff",
    .phb14,
    false,
    .{ .unit = .pound, .count = 4.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Druidic spellcasting focus.",
    druidic_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const yew_wand: Item = Item.compInit(
    "Yew Wand",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    "Druidic spellcasting focus.",
    druidic_focus_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const holy_amulet: Item = Item.compInit(
    "Amulet",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Holy symbol suitable for use as a spellcasting focus.",
    holy_symbol_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const holy_emblem: Item = Item.compInit(
    "Emblem",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Holy symbol suitable for use as a spellcasting focus.",
    holy_symbol_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const holy_reliquary: Item = Item.compInit(
    "Reliquary",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    "Holy symbol suitable for use as a spellcasting focus.",
    holy_symbol_desc,
    null,
    null,
    null,
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const fargab: Item = Item.compInit(
    "Fargab",
    .dsotdq,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{
        .desc = "A backpack-sized radio device manufactured as one half of a matched pair.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Transmit",
                .desc = "While wearing it, a creature can use an action to send a spoken message of up to 25 words to the creature wearing the matched fargab.",
            },
            .{
                .table = null,
                .heading = "Range",
                .desc = "The matched fargab must be within 18 miles.",
            },
            .{
                .table = null,
                .heading = "Speaker",
                .desc = "The received message can be heard from the device's speakers up to 10 feet away.",
            },
            .{
                .table = null,
                .heading = "Unattended Device",
                .desc = "If no creature is wearing the matched fargab, the receiving speakers emit static instead.",
            },
        },
    },
    null,
    null,
    null,
    null,
);

pub const narycrash: Item = Item.compInit(
    "Narycrash",
    .dsotdq,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{
        .desc = "A backpack-sized device containing a balloon-based parachute.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Deploy",
                .desc = "When falling, the wearer can use a reaction to deploy the parachute.",
            },
            .{
                .table = null,
                .heading = "Descent",
                .desc = "While deployed, the wearer descends 60 feet per round and takes no falling damage.",
            },
            .{
                .table = null,
                .heading = "Failure Near Ground",
                .desc = "At 10 feet above the ground, roll a d20. On a 5 or lower, the parachute fails and the wearer resumes falling normally.",
            },
        },
    },
    null,
    null,
    null,
    null,
);

pub const soap: Item = Item.compInit(
    "Soap",
    .phb14,
    false,
    null,
    null,
    null,
    null,
    null,
    null,
    .{ .desc = "Soap included in the Diplomat's Pack. The cited adventuring-gear page does not list a standalone price.", .desc_fields = null },
    null,
    null,
    null,
    null,
);

pub const item_arr = [_]Item{
    soap,
    string_10_ft,
    alms_box,
    incense_block,
    censer,
    vestments,
    small_bag_of_sand,
    small_knife,
    abacus,
    bedroll,
    bell,
    blanket,
    block_and_tackle,
    book,
    candle,
    chain_10_ft,
    chalk,
    component_pouch,
    fishing_tackle,
    grappling_hook,
    hammer,
    hourglass,
    ink_bottle_1_oz,
    ink,
    ink_pen,
    ladder_10_ft,
    lock,
    magnifying_glass,
    manacles,
    mess_kit,
    miners_pick,
    paper,
    parchment,
    pouch,
    perfume,
    piton,
    pole_10_ft,
    portable_ram,
    ration,
    hempen_rope_50_ft,
    silk_rope_50_ft,
    sealing_wax,
    shovel,
    signal_whistle,
    signet_ring,
    sledgehammer,
    spellbook,
    iron_spike,
    spyglass,
    two_person_tent,
    whetstone,
    backpack,
    barrel,
    basket,
    bucket,
    crossbow_bolt_case,
    map_scroll_case,
    chest,
    flask,
    glass_bottle,
    jug,
    iron_pot,
    quiver,
    sack,
    vial,
    water,
    waterskin,
    acid,
    alchemists_fire,
    antitoxin,
    ball_bearing,
    caltrop,
    climbers_kit,
    crowbar,
    healers_kit,
    holy_water,
    hunting_trap,
    lamp,
    bullseye_lantern,
    hooded_lantern,
    oil,
    basic_poison,
    potion_of_healing,
    tinderbox,
    torch,
    common_clothes,
    costume,
    fine_clothes,
    robes,
    travelers_clothes,
    arcane_crystal,
    arcane_orb,
    arcane_rod,
    arcane_staff,
    arcane_wand,
    sprig_of_mistletoe,
    druidic_totem,
    wooden_staff,
    yew_wand,
    holy_amulet,
    holy_emblem,
    holy_reliquary,
    fargab,
    narycrash,
};

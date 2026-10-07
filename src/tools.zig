const items = @import("items.zig");
const Item = items.Item;
const Description = items.Description;

const artisan_tool_desc: Description = .{
    .desc = "A specialized set of implements used to practice a particular craft or trade.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made using this specific craft's tools. Each kind of artisan's tools is a separate proficiency.",
        },
    },
};

const gaming_set_desc: Description = .{
    .desc = "A set of pieces, cards, dice, or similar objects used to play a particular game.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made to play that specific game. Each kind of gaming set is a separate proficiency.",
        },
    },
};

const instrument_desc: Description = .{
    .desc = "A musical instrument used to perform music.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Each kind of musical instrument is a separate proficiency.",
        },
        .{
            .table = null,
            .heading = "Spellcasting Focus",
            .desc = "A bard can use a musical instrument as a spellcasting focus.",
        },
    },
};

const disguise_kit_desc: Description = .{
    .desc = "A pouch containing cosmetics, hair dye, and small props used to alter a creature's visible appearance.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made to create a visual disguise.",
        },
    },
};

const forgery_kit_desc: Description = .{
    .desc = "A collection of papers, inks, seals, waxes, metal leaf, and other supplies used to create convincing physical document forgeries.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made to create physical document forgeries.",
        },
    },
};

const herbalism_kit_desc: Description = .{
    .desc = "A collection of instruments, containers, and supplies used to identify and prepare herbs, remedies, and potions.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made to identify or apply herbs.",
        },
        .{
            .table = null,
            .heading = "Crafting",
            .desc = "Proficiency with an herbalism kit is required to create antitoxin and potions of healing.",
        },
    },
};

const navigators_tools_desc: Description = .{
    .desc = "A set of instruments used for navigation at sea.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency can be used to chart a ship's course, follow navigation charts, and make checks to avoid becoming lost at sea.",
        },
    },
};

const poisoners_kit_desc: Description = .{
    .desc = "Vials, chemicals, and other equipment used to create and handle poisons.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made to craft or use poisons.",
        },
    },
};

const thieves_tools_desc: Description = .{
    .desc = "A set containing a small file, lock picks, a handled mirror, narrow-bladed scissors, and pliers.",
    .desc_fields = &.{
        .{
            .table = null,
            .heading = "Proficiency",
            .desc = "Proficiency applies to ability checks made to disarm traps or open locks.",
        },
    },
};

// PHB 2014 tool table. Xanathar's Guide expands tool uses, but these
// definitions use the PHB item identities, prices, and weights.

pub const alchemists_supplies: Item = Item.compInit(
    "Alchemist's Supplies",
    .phb14,
    false,
    .{ .unit = .pound, .count = 8.0 },
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = null },
);

pub const brewers_supplies: Item = Item.compInit(
    "Brewer's Supplies",
    .phb14,
    false,
    .{ .unit = .pound, .count = 9.0 },
    null,
    null,
    .{ .currency = .gold, .count = 20 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 20 }, .count = 1, .wrapping_container = null },
);

pub const calligraphers_supplies: Item = Item.compInit(
    "Calligrapher's Supplies",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const carpenters_tools: Item = Item.compInit(
    "Carpenter's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 6.0 },
    null,
    null,
    .{ .currency = .gold, .count = 8 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 8 }, .count = 1, .wrapping_container = null },
);

pub const cartographers_tools: Item = Item.compInit(
    "Cartographer's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 6.0 },
    null,
    null,
    .{ .currency = .gold, .count = 15 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 15 }, .count = 1, .wrapping_container = null },
);

pub const cobblers_tools: Item = Item.compInit(
    "Cobbler's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const cooks_utensils: Item = Item.compInit(
    "Cook's Utensils",
    .phb14,
    false,
    .{ .unit = .pound, .count = 8.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const glassblowers_tools: Item = Item.compInit(
    "Glassblower's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 30 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 30 }, .count = 1, .wrapping_container = null },
);

pub const jewelers_tools: Item = Item.compInit(
    "Jeweler's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const leatherworkers_tools: Item = Item.compInit(
    "Leatherworker's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const masons_tools: Item = Item.compInit(
    "Mason's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 8.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const painters_supplies: Item = Item.compInit(
    "Painter's Supplies",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const potters_tools: Item = Item.compInit(
    "Potter's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 10 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 10 }, .count = 1, .wrapping_container = null },
);

pub const smiths_tools: Item = Item.compInit(
    "Smith's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 8.0 },
    null,
    null,
    .{ .currency = .gold, .count = 20 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 20 }, .count = 1, .wrapping_container = null },
);

pub const tinkers_tools: Item = Item.compInit(
    "Tinker's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = null },
);

pub const weavers_tools: Item = Item.compInit(
    "Weaver's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const woodcarvers_tools: Item = Item.compInit(
    "Woodcarver's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    artisan_tool_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .artisans } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const dice_set: Item = Item.compInit(
    "Dice Set",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .silver, .count = 1 },
    null,
    null,
    gaming_set_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .gaming_set } },
    .{ .cost = .{ .currency = .silver, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const dragonchess_set: Item = Item.compInit(
    "Dragonchess Set",
    .phb14,
    false,
    .{ .unit = .pound, .count = 0.5 },
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    gaming_set_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .gaming_set } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const playing_card_set: Item = Item.compInit(
    "Playing Card Set",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .silver, .count = 5 },
    null,
    null,
    gaming_set_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .gaming_set } },
    .{ .cost = .{ .currency = .silver, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const three_dragon_ante_set: Item = Item.compInit(
    "Three-Dragon Ante Set",
    .phb14,
    false,
    null,
    null,
    null,
    .{ .currency = .gold, .count = 1 },
    null,
    null,
    gaming_set_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .gaming_set } },
    .{ .cost = .{ .currency = .gold, .count = 1 }, .count = 1, .wrapping_container = null },
);

pub const bagpipes: Item = Item.compInit(
    "Bagpipes",
    .phb14,
    false,
    .{ .unit = .pound, .count = 6.0 },
    null,
    null,
    .{ .currency = .gold, .count = 30 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 30 }, .count = 1, .wrapping_container = null },
);

pub const drum: Item = Item.compInit(
    "Drum",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 6 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 6 }, .count = 1, .wrapping_container = null },
);

pub const dulcimer: Item = Item.compInit(
    "Dulcimer",
    .phb14,
    false,
    .{ .unit = .pound, .count = 10.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const flute: Item = Item.compInit(
    "Flute",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const lute: Item = Item.compInit(
    "Lute",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 35 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 35 }, .count = 1, .wrapping_container = null },
);

pub const lyre: Item = Item.compInit(
    "Lyre",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 30 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 30 }, .count = 1, .wrapping_container = null },
);

pub const horn: Item = Item.compInit(
    "Horn",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 3 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 3 }, .count = 1, .wrapping_container = null },
);

pub const pan_flute: Item = Item.compInit(
    "Pan Flute",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 12 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 12 }, .count = 1, .wrapping_container = null },
);

pub const shawm: Item = Item.compInit(
    "Shawm",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 2 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 2 }, .count = 1, .wrapping_container = null },
);

pub const viol: Item = Item.compInit(
    "Viol",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 30 },
    null,
    null,
    instrument_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .instrument } },
    .{ .cost = .{ .currency = .gold, .count = 30 }, .count = 1, .wrapping_container = null },
);

pub const disguise_kit: Item = Item.compInit(
    "Disguise Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    disguise_kit_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .misc } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const forgery_kit: Item = Item.compInit(
    "Forgery Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 5.0 },
    null,
    null,
    .{ .currency = .gold, .count = 15 },
    null,
    null,
    forgery_kit_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .misc } },
    .{ .cost = .{ .currency = .gold, .count = 15 }, .count = 1, .wrapping_container = null },
);

pub const herbalism_kit: Item = Item.compInit(
    "Herbalism Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 3.0 },
    null,
    null,
    .{ .currency = .gold, .count = 5 },
    null,
    null,
    herbalism_kit_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .misc } },
    .{ .cost = .{ .currency = .gold, .count = 5 }, .count = 1, .wrapping_container = null },
);

pub const navigators_tools: Item = Item.compInit(
    "Navigator's Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    navigators_tools_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .misc } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const poisoners_kit: Item = Item.compInit(
    "Poisoner's Kit",
    .phb14,
    false,
    .{ .unit = .pound, .count = 2.0 },
    null,
    null,
    .{ .currency = .gold, .count = 50 },
    null,
    null,
    poisoners_kit_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .misc } },
    .{ .cost = .{ .currency = .gold, .count = 50 }, .count = 1, .wrapping_container = null },
);

pub const thieves_tools: Item = Item.compInit(
    "Thieves' Tools",
    .phb14,
    false,
    .{ .unit = .pound, .count = 1.0 },
    null,
    null,
    .{ .currency = .gold, .count = 25 },
    null,
    null,
    thieves_tools_desc,
    null,
    null,
    .{ .tool = .{ .tool_type = .misc } },
    .{ .cost = .{ .currency = .gold, .count = 25 }, .count = 1, .wrapping_container = null },
);

pub const tool_arr = [_]Item{
    alchemists_supplies,
    brewers_supplies,
    calligraphers_supplies,
    carpenters_tools,
    cartographers_tools,
    cobblers_tools,
    cooks_utensils,
    glassblowers_tools,
    jewelers_tools,
    leatherworkers_tools,
    masons_tools,
    painters_supplies,
    potters_tools,
    smiths_tools,
    tinkers_tools,
    weavers_tools,
    woodcarvers_tools,
    dice_set,
    dragonchess_set,
    playing_card_set,
    three_dragon_ante_set,
    bagpipes,
    drum,
    dulcimer,
    flute,
    lute,
    lyre,
    horn,
    pan_flute,
    shawm,
    viol,
    disguise_kit,
    forgery_kit,
    herbalism_kit,
    navigators_tools,
    poisoners_kit,
    thieves_tools,
};

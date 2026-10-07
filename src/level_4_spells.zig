const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 4 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// the non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_10d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d4 } }, .negative = false }},
};

const roll_10d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false }},
};

const roll_10d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d8 } }, .negative = false }},
};

const roll_11d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d6 } }, .negative = false }},
};

const roll_11d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d8 } }, .negative = false }},
};

const roll_12d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d4 } }, .negative = false }},
};

const roll_12d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d6 } }, .negative = false }},
};

const roll_12d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d8 } }, .negative = false }},
};

const roll_13d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 13, .dice = &dice.d8 } }, .negative = false }},
};

const roll_14d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d4 } }, .negative = false }},
};

const roll_16d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 16, .dice = &dice.d4 } }, .negative = false }},
};

const roll_18d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 18, .dice = &dice.d4 } }, .negative = false }},
};

const roll_1d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }},
};

const roll_1d10_plus_10: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 10 }, .negative = false } },
};

const roll_1d10_plus_11: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 11 }, .negative = false } },
};

const roll_1d10_plus_12: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 12 }, .negative = false } },
};

const roll_1d10_plus_13: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 13 }, .negative = false } },
};

const roll_1d10_plus_7: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 7 }, .negative = false } },
};

const roll_1d10_plus_8: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 8 }, .negative = false } },
};

const roll_1d10_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_1d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }},
};

const roll_1d8_plus_10: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 10 }, .negative = false } },
};

const roll_1d8_plus_11: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 11 }, .negative = false } },
};

const roll_1d8_plus_12: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 12 }, .negative = false } },
};

const roll_1d8_plus_13: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 13 }, .negative = false } },
};

const roll_1d8_plus_7: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 7 }, .negative = false } },
};

const roll_1d8_plus_8: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 8 }, .negative = false } },
};

const roll_1d8_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_20: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 20 }, .negative = false }},
};

const roll_20d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 20, .dice = &dice.d4 } }, .negative = false }},
};

const roll_2d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }},
};

const roll_2d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }},
};

const roll_3d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d6 } }, .negative = false }},
};

const roll_3d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false }},
};

const roll_4d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false }},
};

const roll_4d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false }},
};

const roll_4d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false }},
};

const roll_5d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d10 } }, .negative = false }},
};

const roll_5d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d4 } }, .negative = false }},
};

const roll_5d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d6 } }, .negative = false }},
};

const roll_5d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d8 } }, .negative = false }},
};

const roll_6d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d10 } }, .negative = false }},
};

const roll_6d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d6 } }, .negative = false }},
};

const roll_6d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d8 } }, .negative = false }},
};

const roll_7d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d10 } }, .negative = false }},
};

const roll_7d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d6 } }, .negative = false }},
};

const roll_7d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d8 } }, .negative = false }},
};

const roll_8d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d10 } }, .negative = false }},
};

const roll_8d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d6 } }, .negative = false }},
};

const roll_8d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d8 } }, .negative = false }},
};

const roll_9d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d10 } }, .negative = false }},
};

const roll_9d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d6 } }, .negative = false }},
};

const roll_9d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d8 } }, .negative = false }},
};

// ============================================================================
// Level 4 spells
// ============================================================================

pub const arcane_eye: Spell = Spell.compInit(
    "Arcane Eye",
    .phb14,
    .level_4,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a bit of bat fur" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create an invisible magical sensor you can move remotely.",
    .{
        .desc = "An invisible hovering eye relays sight to you, including darkvision out to 30 feet. As an action, you can move it up to 30 feet; it can pass through openings at least 1 inch wide but not solid barriers or planar boundaries.",
        .desc_fields = &.{.{
            .table = null,
            .heading = "Movement",
            .desc = "There is no range limit after creation, but the eye cannot enter another plane.",
        }},
    },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const aura_of_life: Spell = Spell.compInit(
    "Aura of Life",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot radius" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Project a life-preserving aura around yourself.",
    .{ .desc = "Non-hostile creatures in the moving 30-foot aura resist necrotic damage, cannot have their hit point maximum reduced, and a living creature at 0 hit points regains 1 hit point when it starts its turn there.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    null,
    null,
);

pub const aura_of_purity: Spell = Spell.compInit(
    "Aura of Purity",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot radius" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Project a purifying aura around yourself.",
    .{ .desc = "Non-hostile creatures in the aura cannot become diseased, resist poison damage, and have advantage on saves against blinded, charmed, deafened, frightened, paralyzed, poisoned, and stunned.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    null,
    null,
);

pub const banishment: Spell = Spell.compInit(
    "Banishment",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "an item distasteful to the target" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Temporarily banish a creature, possibly returning it to its native plane.",
    .{ .desc = "A creature that fails a Charisma save is banished. A native creature waits in a harmless demiplane; a creature native to another plane returns home and stays there if concentration lasts the full minute.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Target 2 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Target 3 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Target 4 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Target 5 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Target 6 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Paladin, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const blight: Spell = Spell.compInit(
    "Blight",
    .phb14,
    .level_4,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Drain moisture and vitality from a creature.",
    .{ .desc = "The target makes a Constitution save, taking 8d8 necrotic damage on a failure or half on a success. Undead and constructs are unaffected. Plant creatures save with disadvantage and take maximum damage; nonmagical plants simply wither.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 10d8.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 11d8.", .desc_fields = null },
            .dice_rolls = &.{roll_11d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 12d8.", .desc_fields = null },
            .dice_rolls = &.{roll_12d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 13d8.", .desc_fields = null },
            .dice_rolls = &.{roll_13d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Warlock, Wizard
    &.{roll_8d8},
    null,
);

pub const charm_monster: Spell = Spell.compInit(
    "Charm Monster",
    .xge,
    .level_4,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Charm a creature for up to an hour.",
    .{ .desc = "A creature makes a Wisdom save, with advantage if you or your allies are fighting it. On a failure it is charmed and friendly until the spell ends or you or your allies harm it; afterward it knows it was charmed.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Target 2 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Target 3 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Target 4 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Target 5 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Target 6 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Druid, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const compulsion: Spell = Spell.compInit(
    "Compulsion",
    .phb14,
    .level_4,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Compel creatures to move in a direction you choose.",
    .{ .desc = "Creatures you choose that can hear you make Wisdom saves; creatures immune to charm automatically succeed. On later turns you can use a bonus action to designate a horizontal direction, forcing affected creatures to spend as much movement as possible traveling that way. They may save again after moving.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard
    null,
    null,
);

pub const confusion: Spell = Spell.compInit(
    "Confusion",
    .phb14,
    .level_4,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .sphere, .brief = "10-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = "three nut shells" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Disrupt creatures' behavior inside a sphere.",
    .{
        .desc = "Creatures in the area make Wisdom saves. Failed targets cannot take reactions and roll each turn to determine their behavior; they repeat the save at the end of each turn.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "d10", "Behavior" },
                .table_entry = &.{ &.{ .{ .str = "1" }, .{ .str = "Move in a random direction; no action." } }, &.{ .{ .str = "2-6" }, .{ .str = "Do not move or take actions." } }, &.{ .{ .str = "7-8" }, .{ .str = "Make a melee attack against a random creature in reach; otherwise do nothing." } }, &.{ .{ .str = "9-10" }, .{ .str = "Act and move normally." } } },
            },
            .heading = "Behavior Table",
            .desc = "An affected creature rolls at the start of each turn.",
        }},
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The sphere's radius becomes 15 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The sphere's radius becomes 20 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The sphere's radius becomes 25 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The sphere's radius becomes 30 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The sphere's radius becomes 35 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Druid, Sorcerer, Wizard
    null,
    null,
);

pub const conjure_minor_elementals: Spell = Spell.compInit(
    "Conjure Minor Elementals",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a group of minor elementals.",
    .{
        .desc = "Choose a summoning option. The elementals are friendly, share a group initiative, obey verbal commands, and disappear at 0 hit points or when the spell ends.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "Option", "Creatures" },
                .table_entry = &.{ &.{ .{ .str = "CR 2" }, .{ .str = "1 creature" } }, &.{ .{ .str = "CR 1" }, .{ .str = "2 creatures" } }, &.{ .{ .str = "CR 1/2" }, .{ .str = "4 creatures" } }, &.{ .{ .str = "CR 1/4" }, .{ .str = "8 creatures" } } },
            },
            .heading = "Summoning Options",
            .desc = null,
        }},
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Summon twice as many elementals.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Summon twice as many elementals.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Summon three times as many elementals.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Summon three times as many elementals.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Wizard
    null,
    null,
);

pub const conjure_woodland_beings: Spell = Spell.compInit(
    "Conjure Woodland Beings",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "one holly berry per creature summoned" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a group of fey creatures.",
    .{
        .desc = "Choose a summoning option. The fey are friendly, share a group initiative, obey verbal commands, and disappear at 0 hit points or when the spell ends.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "Option", "Creatures" },
                .table_entry = &.{ &.{ .{ .str = "CR 2" }, .{ .str = "1 creature" } }, &.{ .{ .str = "CR 1" }, .{ .str = "2 creatures" } }, &.{ .{ .str = "CR 1/2" }, .{ .str = "4 creatures" } }, &.{ .{ .str = "CR 1/4" }, .{ .str = "8 creatures" } } },
            },
            .heading = "Summoning Options",
            .desc = null,
        }},
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Summon twice as many fey.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Summon twice as many fey.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Summon three times as many fey.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Summon three times as many fey.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const control_water: Spell = Spell.compInit(
    "Control Water",
    .phb14,
    .level_4,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .cube, .brief = "up to a 100-foot cube of freestanding water" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a drop of water and a pinch of dust" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Control freestanding water with one of four effects.",
    .{
        .desc = "Choose an effect when you cast the spell; as an action on later turns you can repeat it or choose another.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Flood",
            .desc = "Raise standing water by up to 20 feet, or create a repeating 20-foot wave in a large body of water.",
        }, .{
            .table = null,
            .heading = "Part Water",
            .desc = "Create a trench across the area with walls of separated water on each side.",
        }, .{
            .table = null,
            .heading = "Redirect Flow",
            .desc = "Force flowing water in the area to move in a direction you choose.",
        }, .{
            .table = null,
            .heading = "Whirlpool",
            .desc = "In a sufficiently large body of water, create a vortex that pulls creatures and objects inward; creatures entering or starting there make Strength saves against 2d8 bludgeoning damage and being caught.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Druid, Wizard
    &.{roll_2d8},
    null,
);

pub const death_ward: Spell = Spell.compInit(
    "Death Ward",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Protect a creature from one lethal event.",
    .{ .desc = "The first time damage would reduce the target to 0 hit points, it drops to 1 instead and the spell ends. If an effect would kill it instantly without damage, that effect is negated and the spell ends.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Paladin
    null,
    null,
);

pub const dimension_door: Spell = Spell.compInit(
    "Dimension Door",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 500 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Teleport yourself and optionally one nearby willing creature.",
    .{ .desc = "Teleport to a destination within range that you can see, visualize, or describe by distance and direction. You may bring one willing creature of your size or smaller within 5 feet. If the destination is occupied, each traveler takes 4d6 force damage and the teleport fails.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_4d6},
    null,
);

pub const divination: Spell = Spell.compInit(
    "Divination",
    .phb14,
    .level_4,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "incense and a sacrificial offering worth at least 25 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Ask a divine power about a specific event within the next seven days.",
    .{ .desc = "You receive a truthful but potentially cryptic reply. Repeated castings before your next long rest create a cumulative 25% chance per casting after the first of receiving a random reading.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const dominate_beast: Spell = Spell.compInit(
    "Dominate Beast",
    .phb14,
    .level_4,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm and mentally command a beast.",
    .{ .desc = "A beast that fails a Wisdom save is charmed. You can issue telepathic commands and may use your action to take precise control. Each time it takes damage, it makes another Wisdom save to end the spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Duration becomes concentration, up to 10 minutes.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration becomes concentration, up to 1 hour.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes concentration, up to 8 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration becomes concentration, up to 8 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes concentration, up to 8 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer
    null,
    null,
);

pub const elemental_bane: Spell = Spell.compInit(
    "Elemental Bane",
    .xge,
    .level_4,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Strip a creature's resistance to one elemental damage type.",
    .{ .desc = "Choose acid, cold, fire, lightning, or thunder. On a failed Constitution save, the target loses resistance to that type and takes an extra 2d6 of that damage the first time each turn it takes damage of the chosen type.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Target 2 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Target 3 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Target 4 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Target 5 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Target 6 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Warlock, Wizard, Artificer
    &.{roll_2d6},
    null,
);

pub const evards_black_tentacles: Spell = Spell.compInit(
    "Evard's Black Tentacles",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .cube, .brief = "20-foot square on the ground" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a piece of tentacle from a giant octopus or giant squid" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Fill an area with restraining black tentacles.",
    .{ .desc = "The area is difficult terrain. A creature entering or starting there makes a Dexterity save or takes 3d6 bludgeoning damage and becomes restrained. Restrained creatures take the damage again when starting there and can use an action to make a Strength or Dexterity check against your spell save DC to escape.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    &.{roll_3d6},
    null,
);

pub const fabricate: Spell = Spell.compInit(
    "Fabricate",
    .phb14,
    .level_4,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Turn raw materials into finished objects made from the same material.",
    .{ .desc = "You fabricate a Large or smaller object from visible raw material; mineral objects are limited to Medium. The spell cannot create creatures or magic items, and complex crafted goods require proficiency with the relevant artisan's tools.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const find_greater_steed: Spell = Spell.compInit(
    "Find Greater Steed",
    .xge,
    .level_4,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Summon a bonded celestial, fey, or fiendish mount.",
    .{ .desc = "Choose a griffon, pegasus, peryton, dire wolf, rhinoceros, or saber-toothed tiger form. The mount is loyal, can communicate telepathically with you within 1 mile, and can share spells you cast that target only yourself while you are mounted.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    null,
    null,
);

pub const fire_shield: Spell = Spell.compInit(
    "Fire Shield",
    .phb14,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a bit of phosphorus or a firefly" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Wreathe yourself in protective hot or cold flames.",
    .{
        .desc = "The flames shed bright light for 10 feet and dim light for another 10 feet. Choose a warm or chill shield.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Warm Shield",
            .desc = "Gain resistance to cold damage; a melee attacker within 5 feet takes 2d8 fire damage.",
        }, .{
            .table = null,
            .heading = "Chill Shield",
            .desc = "Gain resistance to fire damage; a melee attacker within 5 feet takes 2d8 cold damage.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    &.{roll_2d8},
    null,
);

pub const freedom_of_movement: Spell = Spell.compInit(
    "Freedom of Movement",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a leather strap bound around an arm or similar appendage" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Protect a creature's movement from hindrance.",
    .{ .desc = "The target ignores difficult terrain, cannot have its speed reduced by magic, and cannot be paralyzed or restrained by magical effects. It can spend 5 feet of movement to escape nonmagical restraints and suffers no underwater movement or attack penalties.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Cleric, Druid, Ranger
    null,
    null,
);

pub const galders_speedy_courier: Spell = Spell.compInit(
    "Galder's Speedy Courier",
    .llk,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "25 gp or equivalent mineral goods, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Send a small chest of items to a known creature.",
    .{ .desc = "A nearly untouchable air elemental carries an open 3-foot cube chest. After you name a valid recipient and close the chest, it appears beside that creature; rejected or unretrieved contents ultimately return to you.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The courier can deliver to a creature on another plane.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The courier can deliver to a creature on another plane.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const gate_seal: Spell = Spell.compInit(
    "Gate Seal",
    .paitm,
    .level_4,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "30-foot cube" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a broken portal key, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Seal portals and planar travel within a stationary cube.",
    .{ .desc = "Portals in the cube close and cannot open. Planar travel and portal-opening effects fail when used to enter or leave the area.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration becomes until dispelled.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes until dispelled.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration becomes until dispelled.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes until dispelled.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const giant_insect: Spell = Spell.compInit(
    "Giant Insect",
    .phb14,
    .level_4,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Transform ordinary insects into giant versions.",
    .{ .desc = "Transform up to ten centipedes, three spiders, five wasps, or one scorpion into their giant forms. They obey your verbal commands and remain transformed until the spell ends, they reach 0 hit points, or you dismiss the effect.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const grasping_vine: Spell = Spell.compInit(
    "Grasping Vine",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Conjure a vine that repeatedly pulls creatures toward it.",
    .{ .desc = "When cast, and as a bonus action on later turns, choose a creature within 30 feet of the vine. On a failed Dexterity save it is pulled 20 feet directly toward the vine.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const greater_invisibility: Spell = Spell.compInit(
    "Greater Invisibility",
    .phb14,
    .level_4,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Make a creature and its carried gear invisible without ending on attack or casting.",
    .{ .desc = "You or a touched creature becomes invisible for the duration. Anything worn or carried remains invisible while on the target.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const guardian_of_faith: Spell = Spell.compInit(
    "Guardian of Faith",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Create a stationary spectral guardian.",
    .{ .desc = "A hostile creature entering within 10 feet of the guardian for the first time on a turn makes a Dexterity save, taking 20 radiant damage on a failure or half on a success. The guardian disappears after dealing 60 total damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    &.{roll_20},
    null,
);

pub const guardian_of_nature: Spell = Spell.compInit(
    "Guardian of Nature",
    .xge,
    .level_4,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Assume a Primal Beast or Great Tree guardian form.",
    .{
        .desc = "Choose one nature-spirit form when you cast the spell.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Primal Beast",
            .desc = "Walking speed +10 feet; darkvision 120 feet; advantage on Strength-based attacks; melee weapon hits deal an extra 1d6 force damage.",
        }, .{
            .table = null,
            .heading = "Great Tree",
            .desc = "Gain 10 temporary hit points; advantage on Constitution saves and Dexterity/Wisdom-based attacks; enemies treat ground within 15 feet of you as difficult terrain.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Ranger
    &.{roll_1d6},
    null,
);

pub const hallucinatory_terrain: Spell = Spell.compInit(
    "Hallucinatory Terrain",
    .phb14,
    .level_4,
    .illusion,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .cube, .brief = "150-foot cube" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a stone, a twig, and a bit of green plant" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Make natural terrain look, sound, and smell like another natural terrain.",
    .{ .desc = "Natural terrain in a large cube takes on an illusory appearance. Structures, equipment, creatures, and tactile properties remain unchanged. Careful examination can reveal the illusion with an Intelligence (Investigation) check against your spell save DC.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid, Warlock, Wizard
    null,
    null,
);

pub const ice_storm: Spell = Spell.compInit(
    "Ice Storm",
    .phb14,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .cylinder, .brief = "20-foot radius, 40-foot-high cylinder" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a pinch of dust and a few drops of water" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Pummel an area with ice and hail.",
    .{ .desc = "Creatures in the cylinder make Dexterity saves, taking 2d8 bludgeoning plus 4d6 cold damage on a failure or half on a success. The area becomes difficult terrain until the end of your next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Bludgeoning damage becomes 3d8; cold damage remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d8, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Bludgeoning damage becomes 4d8; cold damage remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d8, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Bludgeoning damage becomes 5d8; cold damage remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d8, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Bludgeoning damage becomes 6d8; cold damage remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d8, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Bludgeoning damage becomes 7d8; cold damage remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d8, roll_4d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{ roll_2d8, roll_4d6 },
    null,
);

pub const leomunds_secret_chest: Spell = Spell.compInit(
    "Leomund's Secret Chest",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "an exquisite 3-by-2-by-2-foot chest worth at least 5,000 gp and a Tiny replica worth at least 50 gp" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Hide a specially prepared chest on the Ethereal Plane.",
    .{ .desc = "The chest can hold up to 12 cubic feet of nonliving material. Touching the replica lets you recall or resend it. After 60 days there is a cumulative 5% daily chance the effect ends; if it ends while the chest is ethereal, the chest is lost.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const locate_creature: Spell = Spell.compInit(
    "Locate Creature",
    .phb14,
    .level_4,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a bit of fur from a bloodhound" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Sense the direction of a familiar creature within 1,000 feet.",
    .{ .desc = "Name or describe a familiar creature or the nearest creature of a familiar kind. You sense its direction and movement while within 1,000 feet. Different forms and sufficiently wide running water can defeat the spell.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Druid, Paladin, Ranger, Wizard
    null,
    null,
);

pub const mordenkainens_faithful_hound: Spell = Spell.compInit(
    "Mordenkainen's Faithful Hound",
    .phb14,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a tiny silver whistle, a piece of bone, and a thread" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Conjure an invisible watchdog that warns and attacks.",
    .{ .desc = "The hound remains until dismissed, the duration ends, or you move more than 100 feet away. It barks when an unapproved Small or larger creature approaches, detects invisible and ethereal creatures, and each turn bites one hostile creature within 5 feet for 4d8 piercing damage on a hit.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    &.{roll_4d8},
    null,
);

pub const mordenkainens_private_sanctum: Spell = Spell.compInit(
    "Mordenkainen's Private Sanctum",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "5- to 100-foot cube" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a thin sheet of lead, opaque glass, cotton or cloth, and powdered chrysolite" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Ward an area against observation, teleportation, and planar intrusion.",
    .{
        .desc = "Create a magically secure cube and choose any combination of security properties.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Security Options",
            .desc = "Choose any combination: block sound; block vision through the boundary; block divination sensors; prevent divination targeting inside; block teleportation; block planar travel.",
        }, .{
            .table = null,
            .heading = "Permanence",
            .desc = "Casting on the same location every day for one year makes the effect permanent.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Maximum cube side becomes 200 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum cube side becomes 300 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum cube side becomes 400 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum cube side becomes 500 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum cube side becomes 600 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const otilukes_resilient_sphere: Spell = Spell.compInit(
    "Otiluke's Resilient Sphere",
    .phb14,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = .sphere, .brief = "sphere enclosing one Large or smaller target" },
    .{ .v = true, .s = true, .m = false, .m_brief = "matching hemispheres of clear crystal and gum arabic" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Enclose a creature or object in an invulnerable sphere of force.",
    .{ .desc = "An unwilling creature makes a Dexterity save. Nothing except air passes through the sphere; it is immune to damage and blocks attacks and effects in both directions. The enclosed creature can roll it by pushing from within. Disintegrate destroys the sphere.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const phantasmal_killer: Spell = Spell.compInit(
    "Phantasmal Killer",
    .phb14,
    .level_4,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Manifest a target's deepest fear.",
    .{ .desc = "On a failed Wisdom save the target becomes frightened. At the end of each of its turns it repeats the save; on a failure it takes 4d10 psychic damage, while a success ends the spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 5d10.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 7d10.", .desc_fields = null },
            .dice_rolls = &.{roll_7d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 8d10.", .desc_fields = null },
            .dice_rolls = &.{roll_8d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 9d10.", .desc_fields = null },
            .dice_rolls = &.{roll_9d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    &.{roll_4d10},
    null,
);

pub const polymorph: Spell = Spell.compInit(
    "Polymorph",
    .phb14,
    .level_4,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a caterpillar cocoon" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Transform a creature into a beast.",
    .{ .desc = "An unwilling target makes a Wisdom save. The new beast form is limited by the target's CR or level and replaces its game statistics, while retaining alignment and personality. The form supplies its own hit points; excess damage carries over when the target reverts.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid, Sorcerer, Wizard
    null,
    null,
);

pub const raulothims_psychic_lance: Spell = Spell.compInit(
    "Raulothim's Psychic Lance",
    .ftd,
    .level_4,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Strike a creature's mind with a psychic lance.",
    .{ .desc = "Target a visible creature or speak a creature's name to target it if it is within range. On a failed Intelligence save it takes 7d6 psychic damage and is incapacitated until the start of your next turn; on a success it takes half damage and is not incapacitated.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 11d6.", .desc_fields = null },
            .dice_rolls = &.{roll_11d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 12d6.", .desc_fields = null },
            .dice_rolls = &.{roll_12d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_7d6},
    null,
);

pub const shadow_of_moil: Spell = Spell.compInit(
    "Shadow of Moil",
    .xge,
    .level_4,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "an undead eyeball encased in a gem worth at least 150 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Wrap yourself in flame-like shadow.",
    .{ .desc = "You are heavily obscured to others, nearby light is reduced, and you gain resistance to radiant damage. A creature within 10 feet that hits you with an attack takes 2d8 necrotic damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock
    &.{roll_2d8},
    null,
);

pub const sickening_radiance: Spell = Spell.compInit(
    "Sickening Radiance",
    .xge,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .sphere, .brief = "30-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Fill an area with harmful green radiance.",
    .{ .desc = "A creature entering the area for the first time on a turn or starting there makes a Constitution save. On a failure it takes 4d10 radiant damage, gains one level of exhaustion, emits dim light, and cannot benefit from invisibility. Exhaustion from the spell disappears when the spell ends.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_4d10},
    null,
);

pub const spirit_of_death: Spell = Spell.compInit(
    "Spirit of Death",
    .bmt,
    .level_4,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a gilded playing card worth at least 400 gp depicting an avatar of death" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a reaper spirit whose statistics scale with slot level.",
    .{
        .desc = "The spirit manifests in an empty space, shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Base Statistics",
            .desc = "At 4th level: AC 15, 40 hit points, 30-foot walk and fly speed (hover), darkvision 60 feet, necrotic and poison immunity, and proficiency bonus equal to yours.",
        }, .{
            .table = null,
            .heading = "Reaping Scythe",
            .desc = "The spirit makes floor(spell level / 2) attacks. Each hit deals 1d8 + 3 + spell level necrotic damage.",
        }, .{
            .table = null,
            .heading = "Haunt Creature",
            .desc = "As a bonus action the spirit can haunt one nearby creature, allowing you and the spirit to track it on the same plane and potentially frighten it when it starts near the spirit.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Reaper Spirit: AC 16; HP 50; Multiattack 2; Reaping Scythe deals 1d8 + 8 necrotic damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_8, roll_1d8_plus_8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Reaper Spirit: AC 17; HP 60; Multiattack 3; Reaping Scythe deals 1d8 + 9 necrotic damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_9, roll_1d8_plus_9, roll_1d8_plus_9 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Reaper Spirit: AC 18; HP 70; Multiattack 3; Reaping Scythe deals 1d8 + 10 necrotic damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_10, roll_1d8_plus_10, roll_1d8_plus_10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Reaper Spirit: AC 19; HP 80; Multiattack 4; Reaping Scythe deals 1d8 + 11 necrotic damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_11, roll_1d8_plus_11, roll_1d8_plus_11, roll_1d8_plus_11 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Reaper Spirit: AC 20; HP 90; Multiattack 4; Reaping Scythe deals 1d8 + 12 necrotic damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{ roll_1d8_plus_7, roll_1d8_plus_7 },
    null,
);

pub const staggering_smite: Spell = Spell.compInit(
    "Staggering Smite",
    .phb14,
    .level_4,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower your next melee weapon hit with psychic force.",
    .{ .desc = "The next melee weapon hit deals an extra 4d6 psychic damage. The target makes a Wisdom save; on a failure it has disadvantage on attacks and ability checks and cannot take reactions until the end of its next turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{roll_4d6},
    null,
);

pub const stone_shape: Spell = Spell.compInit(
    "Stone Shape",
    .phb14,
    .level_4,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "soft clay worked into roughly the desired shape" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Reshape a Medium or smaller stone object or a 5-foot section of stone.",
    .{ .desc = "Form the stone into a shape you choose, including passages or simple objects. You can create up to two hinges and a latch, but not fine mechanical detail.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Druid, Wizard
    null,
    null,
);

pub const stoneskin: Spell = Spell.compInit(
    "Stoneskin",
    .phb14,
    .level_4,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "diamond dust worth 100 gp, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Harden a willing creature's flesh like stone.",
    .{ .desc = "The target gains resistance to nonmagical bludgeoning, piercing, and slashing damage for the duration.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const storm_sphere: Spell = Spell.compInit(
    "Storm Sphere",
    .xge,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a sphere of violent wind and lightning.",
    .{ .desc = "Creatures in the sphere when it appears or ending a turn there make Strength saves or take 2d6 bludgeoning damage. The area is difficult terrain. As a bonus action you can make a ranged spell attack from the sphere's center against a creature within 60 feet, dealing 4d6 lightning damage on a hit.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Sphere damage becomes 3d6 bludgeoning; lightning damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d6, roll_5d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Sphere damage becomes 4d6 bludgeoning; lightning damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d6, roll_6d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Sphere damage becomes 5d6 bludgeoning; lightning damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d6, roll_7d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Sphere damage becomes 6d6 bludgeoning; lightning damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d6, roll_8d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Sphere damage becomes 7d6 bludgeoning; lightning damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d6, roll_9d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_2d6, roll_4d6 },
    null,
);

pub const summon_aberration: Spell = Spell.compInit(
    "Summon Aberration",
    .tce,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a pickled tentacle and eyeball in a platinum-inlaid vial worth at least 400 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon an aberrant spirit whose statistics scale with slot level.",
    .{
        .desc = "Choose Beholderkin, Slaad, or Star Spawn. The spirit shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Forms",
            .desc = "Choose Beholderkin, Slaad, or Star Spawn. The form determines special traits and the available attack.",
        }, .{
            .table = null,
            .heading = "Base Statistics",
            .desc = "At 4th level: AC 15, 40 hit points, darkvision 60 feet, psychic immunity, and proficiency bonus equal to yours.",
        }, .{
            .table = null,
            .heading = "Attacks",
            .desc = "Multiattack equals floor(spell level / 2). Claws deal 1d10 + 3 + spell level; Eye Ray or Psychic Slam deal 1d8 + 3 + spell level. Star Spawn also has a 2d6 psychic aura.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Aberrant Spirit: AC 16; HP 50; Multiattack 2; Claws 1d10 + 8; Eye Ray/Psychic Slam 1d8 + 8.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_8, roll_1d10_plus_8, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Aberrant Spirit: AC 17; HP 60; Multiattack 3; Claws 1d10 + 9; Eye Ray/Psychic Slam 1d8 + 9.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_9, roll_1d10_plus_9, roll_1d10_plus_9, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Aberrant Spirit: AC 18; HP 70; Multiattack 3; Claws 1d10 + 10; Eye Ray/Psychic Slam 1d8 + 10.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_10, roll_1d10_plus_10, roll_1d10_plus_10, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Aberrant Spirit: AC 19; HP 80; Multiattack 4; Claws 1d10 + 11; Eye Ray/Psychic Slam 1d8 + 11.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_11, roll_1d10_plus_11, roll_1d10_plus_11, roll_1d10_plus_11, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Aberrant Spirit: AC 20; HP 90; Multiattack 4; Claws 1d10 + 12; Eye Ray/Psychic Slam 1d8 + 12.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_12, roll_1d10_plus_12, roll_1d10_plus_12, roll_1d10_plus_12, roll_2d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{ roll_1d10_plus_7, roll_1d10_plus_7, roll_2d6 },
    null,
);

pub const summon_construct: Spell = Spell.compInit(
    "Summon Construct",
    .tce,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "an ornate stone and metal lockbox worth at least 400 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a construct spirit whose statistics scale with slot level.",
    .{
        .desc = "Choose Clay, Metal, or Stone. The spirit shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Forms",
            .desc = "Choose Clay, Metal, or Stone; the material determines the construct's special trait.",
        }, .{
            .table = null,
            .heading = "Base Statistics",
            .desc = "At 4th level: AC 17, 40 hit points, 30-foot speed, darkvision 60 feet, and proficiency bonus equal to yours.",
        }, .{
            .table = null,
            .heading = "Attacks",
            .desc = "Multiattack equals floor(spell level / 2). Slam deals 1d8 + 4 + spell level bludgeoning damage. Metal constructs also deal 1d10 fire damage through Heated Body.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Construct Spirit: AC 18; HP 55; Multiattack 2; Slam deals 1d8 + 9.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_9, roll_1d8_plus_9, roll_1d10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Construct Spirit: AC 19; HP 70; Multiattack 3; Slam deals 1d8 + 10.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_10, roll_1d8_plus_10, roll_1d8_plus_10, roll_1d10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Construct Spirit: AC 20; HP 85; Multiattack 3; Slam deals 1d8 + 11.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_11, roll_1d8_plus_11, roll_1d8_plus_11, roll_1d10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Construct Spirit: AC 21; HP 100; Multiattack 4; Slam deals 1d8 + 12.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_1d10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Construct Spirit: AC 22; HP 115; Multiattack 4; Slam deals 1d8 + 13.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_13, roll_1d8_plus_13, roll_1d8_plus_13, roll_1d8_plus_13, roll_1d10 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer
    &.{ roll_1d8_plus_8, roll_1d8_plus_8, roll_1d10 },
    null,
);

pub const summon_elemental: Spell = Spell.compInit(
    "Summon Elemental",
    .tce,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "air, a pebble, ash, and water inside a gold-inlaid vial worth at least 400 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon an elemental spirit whose statistics scale with slot level.",
    .{
        .desc = "Choose Air, Earth, Fire, or Water. The spirit shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Forms",
            .desc = "Choose Air, Earth, Fire, or Water. The element changes movement and resistances/immunities.",
        }, .{
            .table = null,
            .heading = "Base Statistics",
            .desc = "At 4th level: AC 15, 50 hit points, 40-foot speed, darkvision 60 feet, and proficiency bonus equal to yours.",
        }, .{
            .table = null,
            .heading = "Attacks",
            .desc = "Multiattack equals floor(spell level / 2). Slam deals 1d10 + 4 + spell level bludgeoning damage, or fire damage for Fire spirits.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Elemental Spirit: AC 16; HP 60; Multiattack 2; Slam deals 1d10 + 9.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_9, roll_1d10_plus_9 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Elemental Spirit: AC 17; HP 70; Multiattack 3; Slam deals 1d10 + 10.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_10, roll_1d10_plus_10, roll_1d10_plus_10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Elemental Spirit: AC 18; HP 80; Multiattack 3; Slam deals 1d10 + 11.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_11, roll_1d10_plus_11, roll_1d10_plus_11 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Elemental Spirit: AC 19; HP 90; Multiattack 4; Slam deals 1d10 + 12.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_12, roll_1d10_plus_12, roll_1d10_plus_12, roll_1d10_plus_12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Elemental Spirit: AC 20; HP 100; Multiattack 4; Slam deals 1d10 + 13.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10_plus_13, roll_1d10_plus_13, roll_1d10_plus_13, roll_1d10_plus_13 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{ roll_1d10_plus_8, roll_1d10_plus_8 },
    null,
);

pub const summon_greater_demon: Spell = Spell.compInit(
    "Summon Greater Demon",
    .xge,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a vial of blood from a humanoid killed within the past 24 hours" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a demon of challenge rating 5 or lower.",
    .{ .desc = "The demon has its own initiative and obeys your verbal commands while it fails repeated Charisma saves. If control ends it pursues nearby non-demons. You can consume the blood component to make a protective circle the demon cannot cross or target through.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Maximum demon challenge rating becomes 6.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum demon challenge rating becomes 7.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum demon challenge rating becomes 8.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum demon challenge rating becomes 9.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum demon challenge rating becomes 10.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const vitriolic_sphere: Spell = Spell.compInit(
    "Vitriolic Sphere",
    .xge,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a drop of giant slug bile" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Explode a sphere of corrosive acid.",
    .{ .desc = "Creatures in the area make Dexterity saves. On a failure a creature takes 10d4 acid damage and another 5d4 at the end of its next turn; on a success it takes half the initial damage and no delayed damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Initial acid damage becomes 12d4; delayed damage remains 5d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_12d4, roll_5d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Initial acid damage becomes 14d4; delayed damage remains 5d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_14d4, roll_5d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Initial acid damage becomes 16d4; delayed damage remains 5d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_16d4, roll_5d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Initial acid damage becomes 18d4; delayed damage remains 5d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_18d4, roll_5d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Initial acid damage becomes 20d4; delayed damage remains 5d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_20d4, roll_5d4 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_10d4, roll_5d4 },
    null,
);

pub const wall_of_fire: Spell = Spell.compInit(
    "Wall of Fire",
    .phb14,
    .level_4,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .line, .brief = "up to 60 feet long, 20 feet high, and 1 foot thick; or a ring up to 20 feet in diameter" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a small piece of phosphorus" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create an opaque wall of fire with one damaging side.",
    .{ .desc = "Creatures in the wall when it appears make Dexterity saves against 5d8 fire damage. One side of the wall also deals 5d8 to creatures entering it for the first time on a turn or ending a turn within 10 feet of that side.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 10d8.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_5d8},
    null,
);

pub const watery_sphere: Spell = Spell.compInit(
    "Watery Sphere",
    .xge,
    .level_4,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .sphere, .brief = "5-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = "a droplet of water" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Conjure a movable sphere of water that restrains creatures.",
    .{ .desc = "Creatures in the sphere make Strength saves; failed targets are restrained and engulfed. The sphere can hold up to four Medium-or-smaller creatures or one Large creature. As an action you can move it up to 30 feet in a straight line and ram creatures into it.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_4_spell_arr = [_]Spell{
    arcane_eye,
    aura_of_life,
    aura_of_purity,
    banishment,
    blight,
    charm_monster,
    compulsion,
    confusion,
    conjure_minor_elementals,
    conjure_woodland_beings,
    control_water,
    death_ward,
    dimension_door,
    divination,
    dominate_beast,
    elemental_bane,
    evards_black_tentacles,
    fabricate,
    find_greater_steed,
    fire_shield,
    freedom_of_movement,
    galders_speedy_courier,
    gate_seal,
    giant_insect,
    grasping_vine,
    greater_invisibility,
    guardian_of_faith,
    guardian_of_nature,
    hallucinatory_terrain,
    ice_storm,
    leomunds_secret_chest,
    locate_creature,
    mordenkainens_faithful_hound,
    mordenkainens_private_sanctum,
    otilukes_resilient_sphere,
    phantasmal_killer,
    polymorph,
    raulothims_psychic_lance,
    shadow_of_moil,
    sickening_radiance,
    spirit_of_death,
    staggering_smite,
    stone_shape,
    stoneskin,
    storm_sphere,
    summon_aberration,
    summon_construct,
    summon_elemental,
    summon_greater_demon,
    vitriolic_sphere,
    wall_of_fire,
    watery_sphere,
};

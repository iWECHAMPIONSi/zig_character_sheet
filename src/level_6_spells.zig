const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 6 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// only non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_100: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 100 }, .negative = false }},
};

const roll_10d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d10 } }, .negative = false }},
};

const roll_10d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false }},
};

const roll_10d6_plus_40: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 40 }, .negative = false } },
};

const roll_10d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d8 } }, .negative = false }},
};

const roll_11d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d6 } }, .negative = false }},
};

const roll_12d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d6 } }, .negative = false }},
};

const roll_13d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 13, .dice = &dice.d6 } }, .negative = false }},
};

const roll_13d6_plus_40: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 13, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 40 }, .negative = false } },
};

const roll_14d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d6 } }, .negative = false }},
};

const roll_16d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 16, .dice = &dice.d6 } }, .negative = false }},
};

const roll_16d6_plus_40: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 16, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 40 }, .negative = false } },
};

const roll_19d6_plus_40: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 19, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 40 }, .negative = false } },
};

const roll_1d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }},
};

const roll_1d12_plus_10: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false }, .{ .roll = .{ .flat = 10 }, .negative = false } },
};

const roll_1d12_plus_11: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false }, .{ .roll = .{ .flat = 11 }, .negative = false } },
};

const roll_1d12_plus_12: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false }, .{ .roll = .{ .flat = 12 }, .negative = false } },
};

const roll_1d12_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
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

const roll_1d8_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_2d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false }},
};

const roll_2d10_plus_6: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 6 }, .negative = false } },
};

const roll_2d10_plus_7: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 7 }, .negative = false } },
};

const roll_2d10_plus_8: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 8 }, .negative = false } },
};

const roll_2d10_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_2d12: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d12 } }, .negative = false }},
};

const roll_2d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false }},
};

const roll_2d6_plus_10: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 10 }, .negative = false } },
};

const roll_2d6_plus_11: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 11 }, .negative = false } },
};

const roll_2d6_plus_12: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 12 }, .negative = false } },
};

const roll_2d6_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_2d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }},
};

const roll_4d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false }},
};

const roll_4d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false }},
};

const roll_50: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 50 }, .negative = false }},
};

const roll_5d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d10 } }, .negative = false }},
};

const roll_5d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d6 } }, .negative = false }},
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

const roll_70: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 70 }, .negative = false }},
};

const roll_7d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d6 } }, .negative = false }},
};

const roll_7d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d8 } }, .negative = false }},
};

const roll_80: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 80 }, .negative = false }},
};

const roll_8d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d6 } }, .negative = false }},
};

const roll_8d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d8 } }, .negative = false }},
};

const roll_90: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 90 }, .negative = false }},
};

const roll_9d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d8 } }, .negative = false }},
};

// ============================================================================
// Shared modifiers
// ============================================================================

const fizban_shield_ac: modifier.Modifier = .{
    .name = "Fizban Shield Ac",
    .modifier = .{ .bonus = .armor_class },
    .brief = "Half cover grants +2 AC.",
    .amount = 2,
};

const fizban_shield_dex_save: modifier.Modifier = .{
    .name = "Fizban Shield Dex Save",
    .modifier = .{ .ability_save = .dexterity },
    .brief = "Half cover grants +2 to Dexterity saving throws.",
    .amount = 2,
};

const otherworldly_guise_ac: modifier.Modifier = .{
    .name = "Otherworldly Guise Ac",
    .modifier = .{ .bonus = .armor_class },
    .brief = "Gain +2 AC.",
    .amount = 2,
};

// ============================================================================
// Level 6 spells
// ============================================================================

pub const arcane_gate: Spell = Spell.compInit(
    "Arcane Gate",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 500 }, .shape = null, .brief = "two linked 10-foot-diameter portals" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create two linked portals between points you can see.",
    .{ .desc = "Choose one ground point within 10 feet of you and another within 500 feet. Two one-sided circular portals appear; entering the active side of either exits through the other. A bonus action can rotate their active faces.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const blade_barrier: Spell = Spell.compInit(
    "Blade Barrier",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = "straight wall up to 100 feet long or ring up to 60 feet in diameter" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a wall of whirling magical blades.",
    .{ .desc = "The wall is 20 feet high and 5 feet thick, provides three-quarters cover, and is difficult terrain. A creature entering it for the first time on a turn or starting there makes a Dexterity save against 6d10 slashing damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    &.{roll_6d10},
    null,
);

pub const bones_of_the_earth: Spell = Spell.compInit(
    "Bones of the Earth",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Raise up to six stone pillars from the ground.",
    .{ .desc = "Each pillar is a 5-foot-diameter cylinder up to 30 feet high with AC 5 and 30 hit points. A Medium-or-smaller creature above a rising pillar can be lifted; if trapped against a ceiling it takes 6d6 bludgeoning damage and is restrained.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create up to 8 pillars.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create up to 10 pillars.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create up to 12 pillars.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid
    &.{roll_6d6},
    null,
);

pub const chain_lightning: Spell = Spell.compInit(
    "Chain Lightning",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "fur, amber, glass, or crystal, and three silver pins" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Strike one target and arc lightning to several nearby targets.",
    .{ .desc = "The primary target and up to three secondary targets within 30 feet of it each make a Dexterity save against 10d8 lightning damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The lightning can strike 5 total targets.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The lightning can strike 6 total targets.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The lightning can strike 7 total targets.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_10d8},
    null,
);

pub const circle_of_death: Spell = Spell.compInit(
    "Circle of Death",
    .phb14,
    .level_6,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "60-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "powdered black pearl worth at least 500 gp" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Release a large sphere of necrotic energy.",
    .{ .desc = "Creatures in the area make Constitution saves, taking 8d6 necrotic damage on a failure or half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Necrotic damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Necrotic damage becomes 12d6.", .desc_fields = null },
            .dice_rolls = &.{roll_12d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Necrotic damage becomes 14d6.", .desc_fields = null },
            .dice_rolls = &.{roll_14d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_8d6},
    null,
);

pub const conjure_fey: Spell = Spell.compInit(
    "Conjure Fey",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a fey creature or fey spirit in beast form.",
    .{ .desc = "Summon a friendly fey of CR 6 or lower. It has its own initiative and obeys verbal commands. If concentration breaks, it remains for the rest of the hour but becomes uncontrolled and potentially hostile.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum challenge rating becomes 7.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum challenge rating becomes 8.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum challenge rating becomes 9.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Warlock
    null,
    null,
);

pub const contingency: Spell = Spell.compInit(
    "Contingency",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an ivory statuette of yourself decorated with gems worth at least 1,500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Store a spell that automatically triggers under a chosen condition.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Contingent Spell",
            .desc = "Choose another spell of 5th level or lower that you can cast, has a casting time of 1 action, and can target you. You cast it as part of Contingency, but it remains dormant.",
        }, .{
            .table = null,
            .heading = "Trigger",
            .desc = "Describe a circumstance. The contingent spell affects only you and triggers immediately the first time that circumstance occurs.",
        }, .{
            .table = null,
            .heading = "Limit",
            .desc = "Only one Contingency can affect you at a time, and losing the statuette ends it.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const create_homunculus: Spell = Spell.compInit(
    "Create Homunculus",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "clay, ash, mandrake root, and a jewel-encrusted dagger worth at least 1,000 gp" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a loyal homunculus linked to your life force.",
    .{ .desc = "You take 2d4 unavoidable piercing damage and create a homunculus. After long rests, you can spend Hit Dice to temporarily transfer maximum hit points to the homunculus. You can have only one homunculus at a time.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    &.{roll_2d4},
    null,
);

pub const create_undead: Spell = Spell.compInit(
    "Create Undead",
    .phb14,
    .level_6,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "grave dirt, brackish water, and a 150 gp black onyx stone for each corpse" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Animate and control more powerful undead at night.",
    .{ .desc = "Animate up to three Small or Medium humanoid corpses as ghouls. They remain under your control for 24 hours; recasting can reassert control.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Animate or reassert control over four ghouls.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Animate or reassert control over five ghouls, or two ghasts or wights.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Animate or reassert control over six ghouls, three ghasts or wights, or two mummies.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Warlock, Wizard
    null,
    null,
);

pub const disintegrate: Spell = Spell.compInit(
    "Disintegrate",
    .phb14,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a lodestone and a pinch of dust" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Fire a destructive ray at a creature, object, or magical force.",
    .{ .desc = "A creature failing a Dexterity save takes 10d6 + 40 force damage and is disintegrated if reduced to 0 hit points. The spell automatically destroys a Large-or-smaller nonmagical object or force creation, or a 10-foot cube of a larger one.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Force damage becomes 13d6 + 40.", .desc_fields = null },
            .dice_rolls = &.{roll_13d6_plus_40},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Force damage becomes 16d6 + 40.", .desc_fields = null },
            .dice_rolls = &.{roll_16d6_plus_40},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Force damage becomes 19d6 + 40.", .desc_fields = null },
            .dice_rolls = &.{roll_19d6_plus_40},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_10d6_plus_40},
    null,
);

pub const drawmijs_instant_summons: Spell = Spell.compInit(
    "Drawmij's Instant Summons",
    .phb14,
    .level_6,
    .conjuration,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a sapphire worth 1,000 gp" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Bind a portable object to a sapphire for later recall.",
    .{ .desc = "Mark an object weighing 10 pounds or less and no more than 6 feet in its longest dimension. Crushing the sapphire later summons the object to your hand unless another creature is holding it, in which case you instead learn who has it and roughly where they are.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const druid_grove: Spell = Spell.compInit(
    "Druid Grove",
    .xge,
    .level_6,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = "30-foot to 90-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "mistletoe harvested with a golden sickle under a full moon, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Ward a natural area with multiple druidic defenses.",
    .{
        .desc = "Choose an outdoor or underground area between a 30-foot and 90-foot cube. You can exempt friends or a password. Casting it daily for a year makes it permanent.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Solid Fog",
            .desc = "Fill chosen ground squares with heavy fog and extra movement cost.",
        }, .{
            .table = null,
            .heading = "Grasping Undergrowth",
            .desc = "Fill chosen squares with entangling plants.",
        }, .{
            .table = null,
            .heading = "Grove Guardians",
            .desc = "Animate up to four trees as awakened-tree-like guardians that remain inside the ward.",
        }, .{
            .table = null,
            .heading = "Additional Spell Effect",
            .desc = "Place gust of wind in two locations, spike growth in one location, or wind wall in two locations.",
        } },
    },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const eyebite: Spell = Spell.compInit(
    "Eyebite",
    .phb14,
    .level_6,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "choose a visible creature within 60 feet each turn" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Repeatedly afflict visible creatures with one of three gaze effects.",
    .{
        .desc = "Each turn you can use your action on a new creature within 60 feet. A target that succeeds against this casting cannot be targeted again.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Asleep",
            .desc = "The target becomes unconscious until damaged or awakened by another creature's action.",
        }, .{
            .table = null,
            .heading = "Panicked",
            .desc = "The target is frightened and must Dash away by the safest route until it gets far enough away and can no longer see you.",
        }, .{
            .table = null,
            .heading = "Sickened",
            .desc = "The target has disadvantage on attacks and ability checks and repeats the Wisdom save each turn.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const find_the_path: Spell = Spell.compInit(
    "Find the Path",
    .phb14,
    .level_6,
    .divination,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "divinatory tools worth 100 gp and an object from the destination" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Know the shortest direct physical route to a familiar fixed destination.",
    .{ .desc = "While on the same plane as the destination, you know its direction and distance and automatically identify the shortest route whenever paths diverge.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Druid
    null,
    null,
);

pub const fizbans_platinum_shield: Spell = Spell.compInit(
    "Fizban's Platinum Shield",
    .ftd,
    .level_6,
    .abjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a platinum-plated dragon scale worth at least 500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Surround a creature with a mobile platinum defensive field.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Cover",
            .desc = "The protected creature has half cover.",
        }, .{
            .table = null,
            .heading = "Damage Resistance",
            .desc = "Resistance to acid, cold, fire, lightning, and poison damage.",
        }, .{
            .table = null,
            .heading = "Evasion",
            .desc = "Dexterity-save effects that normally deal half on success instead deal none on success and half on failure.",
        }, .{
            .table = null,
            .heading = "Move Shield",
            .desc = "On later turns, a bonus action can move the field to another creature within 60 feet of it.",
        } },
    },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    null,
    &.{ fizban_shield_ac, fizban_shield_dex_save },
);

pub const flesh_to_stone: Spell = Spell.compInit(
    "Flesh to Stone",
    .phb14,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "lime, water, and earth" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Gradually petrify a creature made of flesh.",
    .{ .desc = "On a failed Constitution save the target becomes restrained. It then tracks successes and failures at the end of its turns; three successes end the spell, while three failures petrify it. Maintaining concentration for the full duration makes the petrification persist until removed.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const forbiddance: Spell = Spell.compInit(
    "Forbiddance",
    .phb14,
    .level_6,
    .abjuration,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = "up to 40,000 square feet, 30 feet high" },
    .{ .v = true, .s = true, .m = true, .m_brief = "holy water, rare incense, and powdered ruby worth at least 1,000 gp" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Ward a large area against teleportation and extraplanar intrusion.",
    .{ .desc = "The area blocks teleportation, portals, and planar travel. Chosen celestials, elementals, fey, fiends, and undead take 5d10 radiant or necrotic damage on entry or at the start of their turns. Daily casting for 30 days makes it permanent.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    &.{roll_5d10},
    null,
);

pub const globe_of_invulnerability: Spell = Spell.compInit(
    "Globe of Invulnerability",
    .phb14,
    .level_6,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "10-foot radius" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a glass or crystal bead" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a stationary barrier that excludes lower-level spells.",
    .{ .desc = "Spells of 5th level or lower cast from outside the globe cannot affect creatures or objects inside, even when cast using higher-level slots.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The globe blocks spells of 6th level or lower.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The globe blocks spells of 7th level or lower.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The globe blocks spells of 8th level or lower.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    null,
    null,
);

pub const guards_and_wards: Spell = Spell.compInit(
    "Guards and Wards",
    .phb14,
    .level_6,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = "protects up to 2,500 square feet of floor space" },
    .{ .v = true, .s = true, .m = true, .m_brief = "incense, brimstone, oil, knotted string, umber hulk blood, and a silver rod worth at least 10 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Fill a stronghold with layered magical defenses.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Corridors",
            .desc = "Fog heavily obscures corridors and intersections can mislead creatures about direction.",
        }, .{
            .table = null,
            .heading = "Doors",
            .desc = "Doors are arcane-locked; up to ten doors can be disguised as plain wall.",
        }, .{
            .table = null,
            .heading = "Stairs",
            .desc = "Webs fill stairways and regrow after 10 minutes if removed.",
        }, .{
            .table = null,
            .heading = "Additional Effect",
            .desc = "Add programmed dancing lights, magic mouth, stinking cloud, gust of wind, or suggestion effects in chosen locations.",
        }, .{
            .table = null,
            .heading = "Permanence",
            .desc = "Casting the spell in the same structure every day for one year makes the ward permanent.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const harm: Spell = Spell.compInit(
    "Harm",
    .phb14,
    .level_6,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Ravage one creature with necrotic energy.",
    .{ .desc = "A Constitution save determines 14d6 necrotic damage. On a failed save, the target's hit point maximum is also reduced by the damage for 1 hour. The spell cannot reduce a target below 1 hit point and has no effect on constructs or undead.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    &.{roll_14d6},
    null,
);

pub const heal: Spell = Spell.compInit(
    "Heal",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Restore a large amount of health and end several ailments.",
    .{ .desc = "One visible creature regains 70 hit points and is cured of blindness, deafness, and disease. Constructs and undead are unaffected.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Healing becomes 80 hit points.", .desc_fields = null },
            .dice_rolls = &.{roll_80},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Healing becomes 90 hit points.", .desc_fields = null },
            .dice_rolls = &.{roll_90},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Healing becomes 100 hit points.", .desc_fields = null },
            .dice_rolls = &.{roll_100},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Druid
    &.{roll_70},
    null,
);

pub const heroes_feast: Spell = Spell.compInit(
    "Heroes' Feast",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a gem-encrusted bowl worth at least 1,000 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a feast that grants powerful 24-hour benefits to up to twelve creatures.",
    .{ .desc = "After spending 1 hour eating, participants are cured of disease and poison, become immune to poison and fear, gain advantage on Wisdom saves, and increase both current and maximum hit points by 2d10 for 24 hours.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Druid
    &.{roll_2d10},
    null,
);

pub const investiture_of_flame: Spell = Spell.compInit(
    "Investiture of Flame",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Become wreathed in elemental fire.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Defenses",
            .desc = "Immunity to fire and resistance to cold.",
        }, .{
            .table = null,
            .heading = "Burning Aura",
            .desc = "A creature that first moves within 5 feet of you on a turn or ends there takes 1d10 fire damage.",
        }, .{
            .table = null,
            .heading = "Flame Line",
            .desc = "As an action, create a 15-foot-by-5-foot line for 4d8 fire damage, Dexterity save for half.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Warlock, Wizard
    &.{ roll_1d10, roll_4d8 },
    null,
);

pub const investiture_of_ice: Spell = Spell.compInit(
    "Investiture of Ice",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Assume a protective form of elemental ice.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Defenses",
            .desc = "Immunity to cold and resistance to fire.",
        }, .{
            .table = null,
            .heading = "Frozen Ground",
            .desc = "Ignore ice/snow difficult terrain; ground within 10 feet becomes difficult terrain for other creatures.",
        }, .{
            .table = null,
            .heading = "Freezing Cone",
            .desc = "As an action, create a 15-foot cone for 4d6 cold damage; failed targets also have speed halved until your next turn.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Warlock, Wizard
    &.{roll_4d6},
    null,
);

pub const investiture_of_stone: Spell = Spell.compInit(
    "Investiture of Stone",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Take on the endurance and mobility of stone.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Defense",
            .desc = "Resistance to nonmagical bludgeoning, piercing, and slashing damage.",
        }, .{
            .table = null,
            .heading = "Earthquake",
            .desc = "As an action, creatures on ground within 15 feet make Dexterity saves or fall prone.",
        }, .{
            .table = null,
            .heading = "Stone Movement",
            .desc = "Ignore earth/stone difficult terrain and move through solid earth or stone, but ending movement there ejects and stuns you as the spell ends.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const investiture_of_wind: Spell = Spell.compInit(
    "Investiture of Wind",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Surround yourself with powerful elemental winds.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Deflection",
            .desc = "Ranged weapon attacks against you have disadvantage.",
        }, .{
            .table = null,
            .heading = "Flight",
            .desc = "Gain a 60-foot flying speed.",
        }, .{
            .table = null,
            .heading = "Wind Cube",
            .desc = "As an action, create a 15-foot cube within 60 feet for 2d10 bludgeoning damage; failed Large-or-smaller targets are pushed up to 10 feet.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Warlock, Wizard
    &.{roll_2d10},
    null,
);

pub const magic_jar: Spell = Spell.compInit(
    "Magic Jar",
    .phb14,
    .level_6,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a gem, crystal, reliquary, or ornamental container worth at least 500 gp" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Place your soul in a container and possess humanoids.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Jar",
            .desc = "Your body falls catatonic while your soul enters the container. From there you can attempt to possess a humanoid within 100 feet.",
        }, .{
            .table = null,
            .heading = "Possession",
            .desc = "A failed Charisma save lets you control the target's body while retaining your own alignment, Intelligence, Wisdom, Charisma, and class features.",
        }, .{
            .table = null,
            .heading = "Return and Death",
            .desc = "You can return to the container or your body under the spell's distance rules. Destroying the container or killing a possessed host can endanger or kill your soul.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const mass_suggestion: Spell = Spell.compInit(
    "Mass Suggestion",
    .phb14,
    .level_6,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = true, .m_brief = "a snake's tongue and honeycomb or sweet oil" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Magically suggest a reasonable course of action to up to twelve creatures.",
    .{ .desc = "Each target that can hear and understand you makes a Wisdom save. Failed targets pursue the suggestion until it is completed, the duration ends, or you or your companions damage them.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes 10 days.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration becomes 30 days.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes 1 year and 1 day.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const mental_prison: Spell = Spell.compInit(
    "Mental Prison",
    .xge,
    .level_6,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Trap a creature inside a terrifying illusion only it perceives.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Successful Save",
            .desc = "The target takes 5d10 psychic damage and the spell ends.",
        }, .{
            .table = null,
            .heading = "Failed Save",
            .desc = "The target takes 5d10 psychic damage, becomes restrained, and cannot see or hear beyond an illusory danger surrounding it.",
        }, .{
            .table = null,
            .heading = "Breaking the Prison",
            .desc = "If the target is moved out, attacks through the illusion, or reaches through it, it takes 10d10 psychic damage and the spell ends.",
        } },
    },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{ roll_5d10, roll_10d10 },
    null,
);

pub const move_earth: Spell = Spell.compInit(
    "Move Earth",
    .phb14,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = "reshape one side of a 40-foot cube of dirt, sand, or clay" },
    .{ .v = true, .s = true, .m = true, .m_brief = "an iron blade and a bag containing soil" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 2 } }, .concentration = true, .special = false, .brief = null },
    "Gradually reshape large areas of natural earth.",
    .{ .desc = "Choose dirt, sand, or clay in an area no larger than 40 feet on a side and alter elevation, trenches, embankments, or similar terrain. You can choose a new area every 10 minutes.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

pub const otilukes_freezing_sphere: Spell = Spell.compInit(
    "Otiluke's Freezing Sphere",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .sphere, .brief = "60-foot-radius explosion" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small crystal sphere" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Launch or hold a globe of intense cold.",
    .{ .desc = "The globe explodes for 10d6 cold damage, Constitution save for half, and can freeze a 30-foot-square surface of water. You may hold the globe for up to 1 minute and later throw or sling it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Cold damage becomes 11d6.", .desc_fields = null },
            .dice_rolls = &.{roll_11d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Cold damage becomes 12d6.", .desc_fields = null },
            .dice_rolls = &.{roll_12d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Cold damage becomes 13d6.", .desc_fields = null },
            .dice_rolls = &.{roll_13d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    &.{roll_10d6},
    null,
);

pub const ottos_irresistible_dance: Spell = Spell.compInit(
    "Otto's Irresistible Dance",
    .phb14,
    .level_6,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Force a creature to dance uncontrollably.",
    .{ .desc = "The target spends its movement dancing, has disadvantage on Dexterity saves and attacks, and grants advantage to attacks against it. As an action it can make a Wisdom save to end the spell.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const planar_ally: Spell = Spell.compInit(
    "Planar Ally",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Request service from a celestial, elemental, or fiend sent by an otherworldly power.",
    .{ .desc = "A suitable extraplanar creature appears. It is not automatically under your control and may negotiate payment for a task. The spell itself does not compel agreement.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const primordial_ward: Spell = Spell.compInit(
    "Primordial Ward",
    .xge,
    .level_6,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Gain broad elemental resistance and a one-time reactive immunity.",
    .{ .desc = "You resist acid, cold, fire, lightning, and thunder. When one of those damages you, a reaction can grant immunity to that type including the triggering damage; doing so ends the resistances and the spell ends after your next turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const programmed_illusion: Spell = Spell.compInit(
    "Programmed Illusion",
    .phb14,
    .level_6,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "up to a 30-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "fleece and jade dust worth at least 25 gp" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Create a persistent illusion that activates under programmed conditions.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Program",
            .desc = "Define the illusion's appearance, sounds, behavior, and a trigger based on visible or audible conditions within 30 feet.",
        }, .{
            .table = null,
            .heading = "Cycle",
            .desc = "The illusion can perform for up to 5 minutes, then becomes dormant for 10 minutes before it can trigger again.",
        }, .{
            .table = null,
            .heading = "Inspection",
            .desc = "Physical interaction reveals its nature; an Intelligence (Investigation) check against your spell save DC can identify it as an illusion.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const scatter: Spell = Spell.compInit(
    "Scatter",
    .xge,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Teleport up to five creatures to visible spaces near you.",
    .{ .desc = "Choose up to five creatures within 30 feet. Unwilling creatures make Wisdom saves. Each affected target teleports to a visible unoccupied ground or floor space within 120 feet of you.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const soul_cage: Spell = Spell.compInit(
    "Soul Cage",
    .xge,
    .level_6,
    .necromancy,
    false,
    .{ .time = .reaction, .brief = "when a humanoid you can see within 60 feet dies" },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny silver cage worth 100 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Trap a dying humanoid's soul and exploit it up to six times.",
    .{
        .desc = "While trapped, the humanoid cannot be revived. The soul is released when the spell ends, the cage is destroyed, or after the sixth use.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Steal Life",
            .desc = "Bonus action: regain 2d8 hit points.",
        }, .{
            .table = null,
            .heading = "Query Soul",
            .desc = "Ask one brief question and receive a truthful telepathic answer based on what the humanoid knew in life.",
        }, .{
            .table = null,
            .heading = "Borrow Experience",
            .desc = "Bonus action: gain advantage on your next attack roll, ability check, or saving throw before your next turn.",
        }, .{
            .table = null,
            .heading = "Eyes of the Dead",
            .desc = "Action: create a sensor at a place the dead humanoid saw on your current plane and perceive through it for up to 10 minutes with concentration.",
        } },
    },
    null,
    &.{}, // Classes: Warlock, Wizard
    &.{roll_2d8},
    null,
);

pub const summon_fiend: Spell = Spell.compInit(
    "Summon Fiend",
    .tce,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "humanoid blood inside a ruby vial worth at least 600 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a Demon, Devil, or Yugoloth spirit.",
    .{
        .desc = "The spirit shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Forms",
            .desc = "Choose Demon, Devil, or Yugoloth. The form changes hit points, movement, and attack options.",
        }, .{
            .table = null,
            .heading = "Scaling",
            .desc = "AC equals 12 + spell level. Hit points increase by 15 for each slot above 6th. Multiattack equals half the spell level, rounded down.",
        }, .{
            .table = null,
            .heading = "Attacks",
            .desc = "Demon Bite: 1d12 + 3 + spell level necrotic. Yugoloth Claws: 1d8 + 3 + spell level slashing. Devil Hurl Flame: 2d6 + 3 + spell level fire.",
        }, .{
            .table = null,
            .heading = "Death Throes",
            .desc = "Demon only: when it drops to 0 hit points or the spell ends, nearby creatures save against 2d10 + spell level fire damage.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Fiendish Spirit: AC 19; Demon HP 65, Devil HP 55, Yugoloth HP 75; Multiattack 3; Bite 1d12 + 10; Claws 1d8 + 10; Hurl Flame 2d6 + 10; Death Throes 2d10 + 7.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_10, roll_1d12_plus_10, roll_1d12_plus_10, roll_1d8_plus_10, roll_1d8_plus_10, roll_1d8_plus_10, roll_2d6_plus_10, roll_2d6_plus_10, roll_2d6_plus_10, roll_2d10_plus_7 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Fiendish Spirit: AC 20; Demon HP 80, Devil HP 70, Yugoloth HP 90; Multiattack 4; Bite 1d12 + 11; Claws 1d8 + 11; Hurl Flame 2d6 + 11; Death Throes 2d10 + 8.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_11, roll_1d12_plus_11, roll_1d12_plus_11, roll_1d12_plus_11, roll_1d8_plus_11, roll_1d8_plus_11, roll_1d8_plus_11, roll_1d8_plus_11, roll_2d6_plus_11, roll_2d6_plus_11, roll_2d6_plus_11, roll_2d6_plus_11, roll_2d10_plus_8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Fiendish Spirit: AC 21; Demon HP 95, Devil HP 85, Yugoloth HP 105; Multiattack 4; Bite 1d12 + 12; Claws 1d8 + 12; Hurl Flame 2d6 + 12; Death Throes 2d10 + 9.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_12, roll_1d12_plus_12, roll_1d12_plus_12, roll_1d12_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_2d6_plus_12, roll_2d6_plus_12, roll_2d6_plus_12, roll_2d6_plus_12, roll_2d10_plus_9 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{ roll_1d12_plus_9, roll_1d8_plus_9, roll_2d6_plus_9, roll_2d10_plus_6 },
    null,
);

pub const sunbeam: Spell = Spell.compInit(
    "Sunbeam",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .line, .brief = "60-foot line, 5 feet wide" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a magnifying glass" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Project repeated beams of sunlight.",
    .{ .desc = "Creatures in the line make Constitution saves against 6d8 radiant damage and blindness until your next turn; undead and oozes save with disadvantage. You can create a new beam as an action each turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_6d8},
    null,
);

pub const tashas_otherworldly_guise: Spell = Spell.compInit(
    "Tasha's Otherworldly Guise",
    .tce,
    .level_6,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an Outer Planes symbol worth at least 500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Transform yourself using power from the Upper or Lower Planes.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Lower Planes",
            .desc = "Immunity to fire and poison damage and to the poisoned condition.",
        }, .{
            .table = null,
            .heading = "Upper Planes",
            .desc = "Immunity to radiant and necrotic damage and to the charmed condition.",
        }, .{
            .table = null,
            .heading = "Shared Benefits",
            .desc = "40-foot flying speed, +2 AC, magical weapon attacks, spellcasting ability can replace Strength/Dexterity for weapon attack and damage, and two attacks with the Attack action unless you already attack more.",
        } },
    },
    null,
    &.{}, // Classes: none (all listed classes are optional)
    null,
    &.{otherworldly_guise_ac},
);

pub const tensers_transformation: Spell = Spell.compInit(
    "Tenser's Transformation",
    .xge,
    .level_6,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a few hairs from a bull" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Temporarily transform yourself into a martial combatant.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Temporary Hit Points",
            .desc = "Gain 50 temporary hit points.",
        }, .{
            .table = null,
            .heading = "Weapons and Armor",
            .desc = "Gain proficiency with simple and martial weapons, shields, and all armor.",
        }, .{
            .table = null,
            .heading = "Attacks",
            .desc = "Advantage on weapon attacks; weapon hits deal an extra 2d12 force damage; you can attack twice with the Attack action if you do not already attack more.",
        }, .{
            .table = null,
            .heading = "Saves",
            .desc = "Gain proficiency in Strength and Constitution saving throws.",
        }, .{
            .table = null,
            .heading = "Aftereffect",
            .desc = "When the spell ends, make a DC 15 Constitution save or gain one level of exhaustion.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    &.{ roll_50, roll_2d12 },
    null,
);

pub const transport_via_plants: Spell = Spell.compInit(
    "Transport via Plants",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .round, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Link two Large-or-larger plants on the same plane as a temporary portal.",
    .{ .desc = "Touch a Large-or-larger plant and name or describe another such plant you have seen or touched on the same plane. Creatures can step through the first plant and emerge from the second until the spell ends.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const true_seeing: Spell = Spell.compInit(
    "True Seeing",
    .phb14,
    .level_6,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an ointment worth 25 gp made from mushroom powder, saffron, and fat, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Grant truesight out to 120 feet.",
    .{ .desc = "The target sees through normal and magical darkness, sees invisible creatures and objects, detects visual illusions and automatically succeeds on saves against them, perceives shapechangers' true forms, and can see into the Ethereal Plane.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const wall_of_ice: Spell = Spell.compInit(
    "Wall of Ice",
    .phb14,
    .level_6,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = "sphere, hemisphere, or ten contiguous panels" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small piece of quartz" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a durable wall of magical ice.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Creation",
            .desc = "Form a 10-foot-radius sphere or hemisphere, or ten contiguous 10-foot-square panels. The wall is 1 foot thick.",
        }, .{
            .table = null,
            .heading = "Initial Damage",
            .desc = "Creatures cut by the appearing wall make Dexterity saves against 10d6 cold damage.",
        }, .{
            .table = null,
            .heading = "Breach",
            .desc = "Each 10-foot section has AC 12, 30 hit points, and fire vulnerability. Destroyed sections leave frigid air that deals 5d6 cold damage to creatures moving through it.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Initial wall damage becomes 12d6; frigid-air damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_12d6, roll_6d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Initial wall damage becomes 14d6; frigid-air damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_14d6, roll_7d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Initial wall damage becomes 16d6; frigid-air damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_16d6, roll_8d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    &.{ roll_10d6, roll_5d6 },
    null,
);

pub const wall_of_thorns: Spell = Spell.compInit(
    "Wall of Thorns",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = "straight wall or circular wall" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a handful of thorns" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a thick wall of magical thorny brush.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Shape",
            .desc = "Create a straight wall up to 60 feet long and 10 feet high, or a 20-foot-diameter ring up to 20 feet high; it is 5 feet thick and blocks line of sight.",
        }, .{
            .table = null,
            .heading = "Appearance Damage",
            .desc = "Creatures in its area when it appears make Dexterity saves against 7d8 piercing damage.",
        }, .{
            .table = null,
            .heading = "Moving Through",
            .desc = "Each foot costs 4 feet of movement. Entering for the first time on a turn or ending there causes a Dexterity save against 7d8 slashing damage.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Both piercing and slashing damage become 8d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d8, roll_8d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Both piercing and slashing damage become 9d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_9d8, roll_9d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Both piercing and slashing damage become 10d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_10d8, roll_10d8 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid
    &.{ roll_7d8, roll_7d8 },
    null,
);

pub const wind_walk: Spell = Spell.compInit(
    "Wind Walk",
    .phb14,
    .level_6,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "fire and holy water" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Transform yourself and up to ten willing creatures into fast-moving cloud forms.",
    .{ .desc = "Cloud forms have a 300-foot flying speed, resistance to nonmagical weapon damage, and limited actions. Returning to normal or changing back into cloud form takes 1 minute.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const word_of_recall: Spell = Spell.compInit(
    "Word of Recall",
    .phb14,
    .level_6,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 5 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Teleport yourself and up to five willing nearby creatures to a prepared sanctuary.",
    .{ .desc = "The sanctuary must have been designated beforehand by casting this spell at a location strongly linked to your deity. Without a valid sanctuary, the spell has no effect.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_6_spell_arr = [_]Spell{
    arcane_gate,
    blade_barrier,
    bones_of_the_earth,
    chain_lightning,
    circle_of_death,
    conjure_fey,
    contingency,
    create_homunculus,
    create_undead,
    disintegrate,
    drawmijs_instant_summons,
    druid_grove,
    eyebite,
    find_the_path,
    fizbans_platinum_shield,
    flesh_to_stone,
    forbiddance,
    globe_of_invulnerability,
    guards_and_wards,
    harm,
    heal,
    heroes_feast,
    investiture_of_flame,
    investiture_of_ice,
    investiture_of_stone,
    investiture_of_wind,
    magic_jar,
    mass_suggestion,
    mental_prison,
    move_earth,
    otilukes_freezing_sphere,
    ottos_irresistible_dance,
    planar_ally,
    primordial_ward,
    programmed_illusion,
    scatter,
    soul_cage,
    summon_fiend,
    sunbeam,
    tashas_otherworldly_guise,
    tensers_transformation,
    transport_via_plants,
    true_seeing,
    wall_of_ice,
    wall_of_thorns,
    wind_walk,
    word_of_recall,
};

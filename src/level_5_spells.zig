const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 5 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// only non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_10d6_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_10d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d8 } }, .negative = false }},
};

const roll_11d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d8 } }, .negative = false }},
};

const roll_12d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d8 } }, .negative = false }},
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

const roll_1d10_plus_8: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 8 }, .negative = false } },
};

const roll_1d10_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_1d6_plus_10: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 10 }, .negative = false } },
};

const roll_1d6_plus_11: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 11 }, .negative = false } },
};

const roll_1d6_plus_12: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 12 }, .negative = false } },
};

const roll_1d6_plus_13: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 13 }, .negative = false } },
};

const roll_1d6_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_2d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }},
};

const roll_2d6_plus_10: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 10 }, .negative = false } },
};

const roll_2d6_plus_11: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 11 }, .negative = false } },
};

const roll_2d6_plus_7: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 7 }, .negative = false } },
};

const roll_2d6_plus_8: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 8 }, .negative = false } },
};

const roll_2d6_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_2d6_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_2d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }},
};

const roll_2d8_plus_5: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 5 }, .negative = false } },
};

const roll_2d8_plus_6: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 6 }, .negative = false } },
};

const roll_2d8_plus_7: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 7 }, .negative = false } },
};

const roll_2d8_plus_8: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 8 }, .negative = false } },
};

const roll_2d8_plus_9: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 9 }, .negative = false } },
};

const roll_3d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d6 } }, .negative = false }},
};

const roll_3d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false }},
};

const roll_3d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_4d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false }},
};

const roll_4d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false }},
};

const roll_4d6_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_4d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false }},
};

const roll_4d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_5d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d10 } }, .negative = false }},
};

const roll_5d12: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d12 } }, .negative = false }},
};

const roll_5d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d6 } }, .negative = false }},
};

const roll_5d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d8 } }, .negative = false }},
};

const roll_5d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_6d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d10 } }, .negative = false }},
};

const roll_6d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d6 } }, .negative = false }},
};

const roll_6d6_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_6d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d8 } }, .negative = false }},
};

const roll_6d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
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

const roll_7d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_8d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d10 } }, .negative = false }},
};

const roll_8d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d6 } }, .negative = false }},
};

const roll_8d6_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d6 } }, .negative = false }, .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false } },
};

const roll_8d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d8 } }, .negative = false }},
};

const roll_9d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d8 } }, .negative = false }},
};

const roll_negative_1d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = true }},
};

// ============================================================================
// Level 5 spells
// ============================================================================

pub const animate_objects: Spell = Spell.compInit(
    "Animate Objects",
    .phb14,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Animate up to ten points' worth of unattended nonmagical objects.",
    .{
        .desc = "Chosen objects become constructs under your control; larger objects consume more of the ten-object allowance.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Object Cost",
            .desc = "Medium objects count as 2, Large as 4, and Huge as 8; nothing larger than Huge can be animated.",
        }, .{
            .table = .{
                .headings = &.{ "Size", "HP", "AC", "Attack", "STR", "DEX" },
                .table_entry = &.{
                    &.{ .{ .str = "Tiny" }, .{ .int = 20 }, .{ .int = 18 }, .{ .str = "+8 to hit; 1d4 + 4" }, .{ .int = 4 }, .{ .int = 18 } },
                    &.{ .{ .str = "Small" }, .{ .int = 25 }, .{ .int = 16 }, .{ .str = "+6 to hit; 1d8 + 2" }, .{ .int = 6 }, .{ .int = 14 } },
                    &.{ .{ .str = "Medium" }, .{ .int = 40 }, .{ .int = 13 }, .{ .str = "+5 to hit; 2d6 + 1" }, .{ .int = 10 }, .{ .int = 12 } },
                    &.{ .{ .str = "Large" }, .{ .int = 50 }, .{ .int = 10 }, .{ .str = "+6 to hit; 2d10 + 2" }, .{ .int = 14 }, .{ .int = 10 } },
                    &.{ .{ .str = "Huge" }, .{ .int = 80 }, .{ .int = 10 }, .{ .str = "+8 to hit; 2d12 + 4" }, .{ .int = 18 }, .{ .int = 6 } },
                },
            },
            .heading = "Statistics",
            .desc = "Animated objects use statistics based on size.",
        }, .{
            .table = null,
            .heading = "Commands",
            .desc = "As a bonus action, command any or all animated objects within 500 feet. Without a command, they defend themselves.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum animation allowance becomes 12 objects' worth.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum animation allowance becomes 14 objects' worth.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum animation allowance becomes 16 objects' worth.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum animation allowance becomes 18 objects' worth.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    null,
    null,
);

pub const antilife_shell: Spell = Spell.compInit(
    "Antilife Shell",
    .phb14,
    .level_5,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "10-foot radius" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a mobile barrier that excludes most living creatures.",
    .{ .desc = "A 10-foot-radius barrier centered on you prevents creatures other than undead and constructs from passing or reaching through it. Ranged and spell attacks can cross it. Forcing an affected creature through by your own movement ends the spell.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const awaken: Spell = Spell.compInit(
    "Awaken",
    .phb14,
    .level_5,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 8 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an agate worth at least 1,000 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Grant sapience and speech to a beast or plant.",
    .{ .desc = "A Huge-or-smaller beast or plant with Intelligence 3 or lower gains Intelligence 10 and one language you know. Plants also gain suitable mobility and senses. The creature is charmed by you for 30 days, then decides its attitude based on how it was treated.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid
    null,
    null,
);

pub const banishing_smite: Spell = Spell.compInit(
    "Banishing Smite",
    .phb14,
    .level_5,
    .abjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower your next weapon hit with force and possible banishment.",
    .{ .desc = "The next weapon hit before the spell ends deals 5d10 extra force damage. If that hit leaves the target at 50 hit points or fewer, the target is banished; extraplanar targets return home, while native targets wait incapacitated in a harmless demiplane until the spell ends.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{roll_5d10},
    null,
);

pub const bigbys_hand: Spell = Spell.compInit(
    "Bigby's Hand",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an eggshell and a snakeskin glove" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a Large force hand with several command modes.",
    .{
        .desc = "The hand has AC 20, hit points equal to your hit point maximum, Strength 26, Dexterity 10, and can move 60 feet when commanded.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Clenched Fist",
            .desc = "Make a melee spell attack through the hand; on a hit it deals 4d8 force damage.",
        }, .{
            .table = null,
            .heading = "Forceful Hand",
            .desc = "Contest the hand's Strength against a nearby creature to push it; Medium or smaller targets give the hand advantage.",
        }, .{
            .table = null,
            .heading = "Grasping Hand",
            .desc = "Use the hand's Strength to grapple a Huge-or-smaller creature. A later bonus action can crush a grappled target for 2d6 + your spellcasting ability modifier bludgeoning damage.",
        }, .{
            .table = null,
            .heading = "Interposing Hand",
            .desc = "Place the hand between you and a creature for half cover and movement obstruction.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Clenched Fist deals 6d8 force; Grasping Hand crush deals 4d6 + spellcasting ability modifier bludgeoning.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d8, roll_4d6_plus_spell_mod },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Clenched Fist deals 8d8 force; Grasping Hand crush deals 6d6 + spellcasting ability modifier bludgeoning.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d8, roll_6d6_plus_spell_mod },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Clenched Fist deals 10d8 force; Grasping Hand crush deals 8d6 + spellcasting ability modifier bludgeoning.", .desc_fields = null },
            .dice_rolls = &.{ roll_10d8, roll_8d6_plus_spell_mod },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Clenched Fist deals 12d8 force; Grasping Hand crush deals 10d6 + spellcasting ability modifier bludgeoning.", .desc_fields = null },
            .dice_rolls = &.{ roll_12d8, roll_10d6_plus_spell_mod },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Wizard
    &.{ roll_4d8, roll_2d6_plus_spell_mod },
    null,
);

pub const circle_of_power: Spell = Spell.compInit(
    "Circle of Power",
    .phb14,
    .level_5,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot radius" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Project an aura that protects allies from magic.",
    .{ .desc = "Friendly creatures in the moving 30-foot aura have advantage on saves against spells and magical effects. If such an effect normally deals half damage on a successful save, an affected creature instead takes no damage on that success.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    null,
    null,
);

pub const cloudkill: Spell = Spell.compInit(
    "Cloudkill",
    .phb14,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a poisonous fog bank that moves away from you.",
    .{ .desc = "A heavily obscuring 20-foot-radius fog sphere damages creatures that enter or begin their turn inside. It moves 10 feet away from you at the start of each of your turns and can be dispersed by strong wind.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Poison damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Poison damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Poison damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Poison damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_5d8},
    null,
);

pub const commune: Spell = Spell.compInit(
    "Commune",
    .phb14,
    .level_5,
    .divination,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "incense and a vial of holy or unholy water" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Ask your deity or a divine proxy up to three yes-or-no questions.",
    .{ .desc = "You receive truthful answers, although limited divine knowledge can produce an unclear response. Repeated castings before a long rest risk producing no answer.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const commune_with_nature: Spell = Spell.compInit(
    "Commune with Nature",
    .phb14,
    .level_5,
    .divination,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Learn up to three facts about the surrounding natural region.",
    .{
        .desc = "You briefly attune to the local environment and choose up to three facts to learn.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Possible Subjects",
            .desc = "You can ask about terrain and water; common plants, minerals, animals, or peoples; powerful extraplanar or undead creatures; planar influence; or buildings.",
        }, .{
            .table = null,
            .heading = "Area",
            .desc = "Outdoors, the spell covers terrain within 3 miles. In natural underground environments, the radius is 300 feet. It fails where construction has replaced nature.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const cone_of_cold: Spell = Spell.compInit(
    "Cone of Cold",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "60-foot cone" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small crystal or glass cone" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast creatures in a large cone with lethal cold.",
    .{ .desc = "Creatures in the cone make Constitution saves, taking 8d8 cold damage on a failure or half on a success. Creatures killed by the spell freeze until they thaw.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Cold damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Cold damage becomes 10d8.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Cold damage becomes 11d8.", .desc_fields = null },
            .dice_rolls = &.{roll_11d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Cold damage becomes 12d8.", .desc_fields = null },
            .dice_rolls = &.{roll_12d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_8d8},
    null,
);

pub const conjure_elemental: Spell = Spell.compInit(
    "Conjure Elemental",
    .phb14,
    .level_5,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "burning incense, clay, sulfur and phosphorus, or water and sand, matching the elemental type" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Call an elemental servant from an appropriate elemental medium.",
    .{ .desc = "Choose an area of air, earth, fire, or water and summon an appropriate elemental of CR 5 or lower. It obeys commands while you maintain concentration; losing concentration can leave it uncontrolled and hostile until the original hour expires.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum challenge rating becomes 6.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
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
    &.{}, // Classes: Druid, Wizard
    null,
    null,
);

pub const conjure_volley: Spell = Spell.compInit(
    "Conjure Volley",
    .phb14,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .cylinder, .brief = "40-foot radius, 20-foot-high cylinder" },
    .{ .v = true, .s = true, .m = true, .m_brief = "one piece of ammunition or one thrown weapon" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a massive volley from one piece of ammunition or a thrown weapon.",
    .{ .desc = "Copies rain through a 40-foot-radius, 20-foot-high cylinder. Creatures make Dexterity saves against 8d8 damage of the same type as the ammunition or weapon, taking half on a success.", .desc_fields = null },
    null,
    &.{}, // Classes: Ranger
    &.{roll_8d8},
    null,
);

pub const contact_other_plane: Spell = Spell.compInit(
    "Contact Other Plane",
    .phb14,
    .level_5,
    .divination,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Question an extraplanar intelligence at risk to your mind.",
    .{ .desc = "Make a DC 15 Intelligence save when casting. Failure causes 6d6 psychic damage and temporary insanity until a long rest; success lets you ask up to five questions answered briefly by the contacted entity.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock, Wizard
    &.{roll_6d6},
    null,
);

pub const contagion: Spell = Spell.compInit(
    "Contagion",
    .phb14,
    .level_5,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 7 } }, .concentration = false, .special = false, .brief = null },
    "Poison a creature, potentially inflicting one of six long-lasting diseases.",
    .{
        .desc = "Make a melee spell attack. On a hit, the target becomes poisoned and makes Constitution saves at the end of its turns. Three successes end the spell; three failures replace the poison with one chosen disease for the remaining duration.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Blinding Sickness",
            .desc = "Disadvantage on Wisdom checks and saves; blinded.",
        }, .{
            .table = null,
            .heading = "Filth Fever",
            .desc = "Disadvantage on Strength checks, Strength saves, and Strength-based attacks.",
        }, .{
            .table = null,
            .heading = "Flesh Rot",
            .desc = "Disadvantage on Charisma checks and vulnerability to all damage.",
        }, .{
            .table = null,
            .heading = "Mindfire",
            .desc = "Disadvantage on Intelligence checks and saves; behaves as if affected by confusion during combat.",
        }, .{
            .table = null,
            .heading = "Seizure",
            .desc = "Disadvantage on Dexterity checks, Dexterity saves, and Dexterity-based attacks.",
        }, .{
            .table = null,
            .heading = "Slimy Doom",
            .desc = "Disadvantage on Constitution checks and saves; taking damage also stuns the creature until the end of its next turn.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Druid
    null,
    null,
);

pub const control_winds: Spell = Spell.compInit(
    "Control Winds",
    .xge,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .cube, .brief = "100-foot cube" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Control the wind inside a large cube.",
    .{
        .desc = "Choose one wind pattern when cast; later actions can switch, halt, or restart the effect.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Gusts",
            .desc = "Choose calm, moderate, or strong horizontal wind. Moderate or strong wind hinders ranged weapon attacks; strong wind also impedes movement against it.",
        }, .{
            .table = null,
            .heading = "Downdraft",
            .desc = "Strong downward wind hinders ranged attacks and can knock flying creatures prone.",
        }, .{
            .table = null,
            .heading = "Updraft",
            .desc = "Falling creatures take half normal fall damage and vertical jumps can reach 10 feet higher.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

pub const create_spelljamming_helm: Spell = Spell.compInit(
    "Create Spelljamming Helm",
    .sais,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a crystal rod worth at least 5,000 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Transform an unoccupied chair into a spelljamming helm.",
    .{ .desc = "Touch a Large-or-smaller unoccupied chair while holding the costly crystal rod; the rod is consumed and the chair becomes a spelljamming helm.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const creation: Spell = Spell.compInit(
    "Creation",
    .phb14,
    .level_5,
    .illusion,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = .cube, .brief = "object no larger than a 5-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny sample of the material to be created" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "duration depends on material" },
    "Create a temporary nonliving object from shadow material.",
    .{
        .desc = "The object must be made from a material and in a form you have seen. Mixed-material objects use the shortest applicable duration. Created material cannot function as another spell's material component.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "Material", "Duration" },
                .table_entry = &.{ &.{ .{ .str = "Vegetable matter" }, .{ .str = "1 day" } }, &.{ .{ .str = "Stone or crystal" }, .{ .str = "12 hours" } }, &.{ .{ .str = "Precious metals" }, .{ .str = "1 hour" } }, &.{ .{ .str = "Gems" }, .{ .str = "10 minutes" } }, &.{ .{ .str = "Adamantine or mithral" }, .{ .str = "1 minute" } } },
            },
            .heading = "Material Duration",
            .desc = null,
        }},
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum cube side becomes 10 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum cube side becomes 15 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum cube side becomes 20 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum cube side becomes 25 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    null,
);

pub const danse_macabre: Spell = Spell.compInit(
    "Danse Macabre",
    .xge,
    .level_5,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Animate up to five humanoid corpses as temporary skeletons or zombies.",
    .{ .desc = "The undead gain bonuses to attack and damage equal to your spellcasting ability modifier. A bonus action can issue one shared command to those within 60 feet; they collapse back into corpses when the spell ends.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Animate up to 7 corpses.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Animate up to 9 corpses.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Animate up to 11 corpses.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Animate up to 13 corpses.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const dawn: Spell = Spell.compInit(
    "Dawn",
    .xge,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cylinder, .brief = "30-foot radius, 40-foot-high cylinder" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a sunburst pendant worth at least 100 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a movable cylinder of sunlight.",
    .{ .desc = "Creatures in the cylinder when it appears, or ending a turn there, make Constitution saves against 4d10 radiant damage. If you remain within 60 feet, a bonus action can move the cylinder up to 60 feet.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Wizard
    &.{roll_4d10},
    null,
);

pub const destructive_wave: Spell = Spell.compInit(
    "Destructive Wave",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot radius" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast chosen nearby creatures with thunder and divine energy.",
    .{ .desc = "Chosen creatures within 30 feet make Constitution saves. Failure deals 5d6 thunder plus 5d6 radiant or necrotic damage and knocks the creature prone; success halves the damage and avoids being knocked prone.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{ roll_5d6, roll_5d6 },
    null,
);

pub const dispel_evil_and_good: Spell = Spell.compInit(
    "Dispel Evil and Good",
    .phb14,
    .level_5,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "holy water or powdered silver and iron" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Protect yourself from extraplanar and undead creatures, with optional dismissal effects.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Protection",
            .desc = "Celestials, elementals, fey, fiends, and undead have disadvantage on attacks against you while the spell lasts.",
        }, .{
            .table = null,
            .heading = "Break Enchantment",
            .desc = "End a charm, fear, or possession caused by one of those creature types on a creature you can touch.",
        }, .{
            .table = null,
            .heading = "Dismissal",
            .desc = "Make a melee spell attack against one of those creature types; on a hit and failed Charisma save, send it away from the current plane.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Paladin
    null,
    null,
);

pub const dominate_person: Spell = Spell.compInit(
    "Dominate Person",
    .phb14,
    .level_5,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm a humanoid and issue telepathic commands.",
    .{ .desc = "A failed Wisdom save establishes a telepathic link and charm. You can issue general commands or use your action for precise control. Damage gives the target another save to end the spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration becomes concentration, up to 10 minutes.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes concentration, up to 1 hour.", .desc_fields = null },
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
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const dream: Spell = Spell.compInit(
    "Dream",
    .phb14,
    .level_5,
    .illusion,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "range: special; target must be on the same plane" },
    .{ .v = true, .s = true, .m = true, .m_brief = "sand, ink, and a writing quill from a sleeping bird" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Enter the dreams of a known creature on the same plane.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Messenger",
            .desc = "You or a willing touched creature enters a trance and appears in the target's dreams, able to converse and shape the dream environment.",
        }, .{
            .table = null,
            .heading = "Nightmare",
            .desc = "The messenger can instead deliver a short terrifying message. A failed Wisdom save prevents benefit from the target's rest and deals 3d6 psychic damage on waking.",
        }, .{
            .table = null,
            .heading = "Physical Connection",
            .desc = "Having a piece of the target's body imposes disadvantage on the nightmare saving throw.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Warlock, Wizard
    &.{roll_3d6},
    null,
);

pub const enervation: Spell = Spell.compInit(
    "Enervation",
    .xge,
    .level_5,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Drain a creature through a sustained necrotic tendril.",
    .{ .desc = "The target makes a Dexterity save. Success deals 2d8 necrotic and ends the spell. Failure deals 4d8 and lets you use later actions to automatically deal the same damage while the link remains valid; you regain half the necrotic damage dealt as hit points.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Failed-save/repeat damage becomes 5d8; successful initial save deals half that amount (5d8 halved by the spell rule).", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Failed-save/repeat damage becomes 6d8; successful initial save deals half that amount (6d8 halved by the spell rule).", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Failed-save/repeat damage becomes 7d8; successful initial save deals half that amount (7d8 halved by the spell rule).", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Failed-save/repeat damage becomes 8d8; successful initial save deals half that amount (8d8 halved by the spell rule).", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{ roll_4d8, roll_2d8 },
    null,
);

pub const far_step: Spell = Spell.compInit(
    "Far Step",
    .xge,
    .level_5,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Teleport up to 60 feet repeatedly.",
    .{ .desc = "When cast, and again as a bonus action on each of your turns while the spell lasts, teleport to an unoccupied space you can see within 60 feet.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const flame_strike: Spell = Spell.compInit(
    "Flame Strike",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cylinder, .brief = "10-foot radius, 40-foot-high cylinder" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of sulfur" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Call down a column of fire and radiant energy.",
    .{ .desc = "Creatures in the cylinder make Dexterity saves, taking 4d6 fire plus 4d6 radiant damage on a failure or half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Choose fire or radiant damage to increase by 1d6; the chosen portion becomes 5d6 while the other remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d6, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Choose fire or radiant damage to increase by 2d6; the chosen portion becomes 6d6 while the other remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d6, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Choose fire or radiant damage to increase by 3d6; the chosen portion becomes 7d6 while the other remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d6, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Choose fire or radiant damage to increase by 4d6; the chosen portion becomes 8d6 while the other remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d6, roll_4d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric
    &.{ roll_4d6, roll_4d6 },
    null,
);

pub const geas: Spell = Spell.compInit(
    "Geas",
    .phb14,
    .level_5,
    .enchantment,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 30 } }, .concentration = false, .special = false, .brief = null },
    "Bind a creature to a command with a long-lasting charm.",
    .{ .desc = "A creature that understands you makes a Wisdom save. On a failure it is charmed and takes 5d10 psychic damage when it directly violates your instruction, at most once per day. Suicidal commands end the spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes 1 year.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration remains 1 year.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes indefinite until ended by the specified magic or dismissal.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Druid, Paladin, Wizard
    &.{roll_5d10},
    null,
);

pub const greater_restoration: Spell = Spell.compInit(
    "Greater Restoration",
    .phb14,
    .level_5,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "diamond dust worth at least 100 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Remove one major debilitating effect from a touched creature.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Exhaustion",
            .desc = "Reduce exhaustion by one level.",
        }, .{
            .table = null,
            .heading = "Condition",
            .desc = "End one effect causing charm or petrification.",
        }, .{
            .table = null,
            .heading = "Curse",
            .desc = "End one curse, including attunement to a cursed magic item.",
        }, .{
            .table = null,
            .heading = "Ability Score",
            .desc = "End any reduction to one ability score.",
        }, .{
            .table = null,
            .heading = "Hit Point Maximum",
            .desc = "End one effect reducing the target's hit point maximum.",
        } },
    },
    null,
    &.{}, // Classes: Artificer, Bard, Cleric, Druid
    null,
    null,
);

pub const hallow: Spell = Spell.compInit(
    "Hallow",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 24 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = .radius, .brief = "up to 60-foot radius" },
    .{ .v = true, .s = true, .m = true, .m_brief = "herbs, oils, and incense worth at least 1,000 gp, consumed" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Consecrate or desecrate an area and bind one additional magical effect to it.",
    .{
        .desc = "The warded area can be up to 60 feet in radius and cannot overlap another Hallow.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Creature Ward",
            .desc = "Normally bars celestials, elementals, fey, fiends, and undead from entering or using charm, fear, or possession in the area; chosen creature types can be exempted.",
        }, .{
            .table = null,
            .heading = "Courage",
            .desc = "Affected creatures cannot be frightened.",
        }, .{
            .table = null,
            .heading = "Darkness",
            .desc = "The area is dark, defeating normal light and lower-level magical light.",
        }, .{
            .table = null,
            .heading = "Daylight",
            .desc = "The area is brightly lit and suppresses lower-level magical darkness.",
        }, .{
            .table = null,
            .heading = "Energy Protection",
            .desc = "Grant resistance to one non-physical damage type.",
        }, .{
            .table = null,
            .heading = "Energy Vulnerability",
            .desc = "Impose vulnerability to one non-physical damage type.",
        }, .{
            .table = null,
            .heading = "Everlasting Rest",
            .desc = "Bodies interred in the area cannot become undead.",
        }, .{
            .table = null,
            .heading = "Extradimensional Interference",
            .desc = "Block teleportation and extradimensional or interplanar travel for affected creatures.",
        }, .{
            .table = null,
            .heading = "Fear",
            .desc = "Affected creatures are frightened while in the area.",
        }, .{
            .table = null,
            .heading = "Silence",
            .desc = "Sound cannot enter, leave, or originate within the area.",
        }, .{
            .table = null,
            .heading = "Tongues",
            .desc = "Affected creatures can communicate with each other regardless of shared language.",
        } },
    },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const hold_monster: Spell = Spell.compInit(
    "Hold Monster",
    .phb14,
    .level_5,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small straight piece of iron" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Paralyze a creature that fails a Wisdom save.",
    .{ .desc = "The target repeats the save at the end of each turn. Undead are unaffected.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Target up to 2 creatures, each within 30 feet of the others.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Target up to 3 creatures, each within 30 feet of the others.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Target up to 4 creatures, each within 30 feet of the others.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Target up to 5 creatures, each within 30 feet of the others.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const holy_weapon: Spell = Spell.compInit(
    "Holy Weapon",
    .xge,
    .level_5,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Imbue a weapon with radiant power.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Empowered Weapon",
            .desc = "Weapon attacks deal an extra 2d8 radiant damage; a nonmagical weapon becomes magical and sheds bright and dim light.",
        }, .{
            .table = null,
            .heading = "Radiant Burst",
            .desc = "As a bonus action, end the spell to force chosen creatures within 30 feet to save against 4d8 radiant damage and possible blindness.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Paladin
    &.{ roll_2d8, roll_4d8 },
    null,
);

pub const immolation: Spell = Spell.compInit(
    "Immolation",
    .xge,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Engulf one creature in magical fire.",
    .{ .desc = "A Dexterity save determines the initial 8d6 fire damage. On a failed save the target continues burning and repeats the save each turn, taking 4d6 more fire damage on each failure until it succeeds. A creature killed by the spell becomes ash.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_8d6, roll_4d6 },
    null,
);

pub const infernal_calling: Spell = Spell.compInit(
    "Infernal Calling",
    .xge,
    .level_5,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a ruby worth at least 999 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon an unfriendly devil of CR 6 or lower.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Command",
            .desc = "The summoned devil is unfriendly. Commands that oppose its desires require a Charisma skill contest against its Insight; knowing its true name gives you advantage.",
        }, .{
            .table = null,
            .heading = "Lost Concentration",
            .desc = "If concentration ends after the devil has become immune to your commands, it remains for 3d6 minutes and acts as it chooses.",
        }, .{
            .table = null,
            .heading = "Talisman",
            .desc = "A specific devil's talisman can summon that devil at one CR higher than normally allowed and makes it obey without command checks.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum ordinary devil challenge rating becomes 7.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum ordinary devil challenge rating becomes 8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum ordinary devil challenge rating becomes 9.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum ordinary devil challenge rating becomes 10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock, Wizard
    &.{roll_3d6},
    null,
);

pub const insect_plague: Spell = Spell.compInit(
    "Insect Plague",
    .phb14,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "sugar, grain, and a smear of fat" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Fill an area with biting locusts.",
    .{ .desc = "The sphere is difficult terrain and lightly obscured. Creatures entering or ending a turn there make Constitution saves against 4d10 piercing damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Piercing damage becomes 5d10.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Piercing damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Piercing damage becomes 7d10.", .desc_fields = null },
            .dice_rolls = &.{roll_7d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Piercing damage becomes 8d10.", .desc_fields = null },
            .dice_rolls = &.{roll_8d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Druid, Sorcerer
    &.{roll_4d10},
    null,
);

pub const legend_lore: Spell = Spell.compInit(
    "Legend Lore",
    .phb14,
    .level_5,
    .divination,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "incense worth at least 250 gp, consumed, plus four ivory strips worth at least 50 gp each" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Learn significant lore about a legendary person, place, or object.",
    .{ .desc = "Name or describe the subject. If it is sufficiently important, you receive accurate but potentially figurative lore; existing knowledge can make the result more precise.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Wizard
    null,
    null,
);

pub const maelstrom: Spell = Spell.compInit(
    "Maelstrom",
    .xge,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cylinder, .brief = "30-foot radius, 5 feet deep" },
    .{ .v = true, .s = true, .m = true, .m_brief = "paper or a leaf shaped like a funnel" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a deep swirling pool that drags creatures inward.",
    .{ .desc = "The 30-foot-radius area is difficult terrain. A creature starting its turn there makes a Strength save or takes 6d6 bludgeoning damage and is pulled 10 feet toward the center.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    &.{roll_6d6},
    null,
);

pub const mass_cure_wounds: Spell = Spell.compInit(
    "Mass Cure Wounds",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "choose up to six creatures in a 30-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Heal up to six creatures in a broad area.",
    .{ .desc = "Each chosen creature regains 3d8 + your spellcasting ability modifier hit points. Undead and constructs are unaffected.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Healing becomes 4d8 + spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Healing becomes 5d8 + spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Healing becomes 6d8 + spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Healing becomes 7d8 + spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8_plus_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Druid
    &.{roll_3d8_plus_spell_mod},
    null,
);

pub const mislead: Spell = Spell.compInit(
    "Mislead",
    .phb14,
    .level_5,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Become invisible while creating an illusory double.",
    .{ .desc = "The double can move, gesture, and speak as you direct. You can switch your senses between yourself and the double as a bonus action. Your invisibility ends if you attack or cast a spell, but the double can remain.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const modify_memory: Spell = Spell.compInit(
    "Modify Memory",
    .phb14,
    .level_5,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Rewrite one creature's memory of a limited event.",
    .{ .desc = "On a failed Wisdom save the target is charmed and incapacitated while you describe the altered memory. At base level, the event must have happened within the last 24 hours and lasted no more than 10 minutes.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The affected event may have occurred up to 7 days ago.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The affected event may have occurred up to 30 days ago.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The affected event may have occurred up to 1 year ago.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The affected event may come from any point in the target's past.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const negative_energy_flood: Spell = Spell.compInit(
    "Negative Energy Flood",
    .xge,
    .level_5,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = true, .m_brief = "a broken bone and a square of black silk" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Flood one creature with necrotic energy.",
    .{ .desc = "A living target makes a Constitution save against 5d12 necrotic damage; one killed by it rises as a zombie on your next turn. An undead target instead gains temporary hit points equal to half a 5d12 roll.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock, Wizard
    &.{roll_5d12},
    null,
);

pub const passwall: Spell = Spell.compInit(
    "Passwall",
    .phb14,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of sesame seeds" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Open a temporary passage through wood, plaster, or stone.",
    .{ .desc = "The opening can be up to 5 feet wide, 8 feet tall, and 20 feet deep. When it closes, creatures and objects still inside are safely expelled to the nearest open space.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const planar_binding: Spell = Spell.compInit(
    "Planar Binding",
    .phb14,
    .level_5,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a jewel worth at least 1,000 gp, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Bind a celestial, elemental, fey, or fiend to service.",
    .{ .desc = "The target must remain in range throughout casting and makes a Charisma save at completion. On a failure it serves for the duration; if another spell summoned it, that spell's duration extends to match this one.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration becomes 10 days.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes 30 days.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration becomes 180 days.", .desc_fields = null },
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
    &.{}, // Classes: Bard, Cleric, Druid, Wizard
    null,
    null,
);

pub const raise_dead: Spell = Spell.compInit(
    "Raise Dead",
    .phb14,
    .level_5,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a diamond worth at least 500 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Return a recently dead creature to life with 1 hit point.",
    .{
        .desc = "The spell cures poison and nonmagical disease present at death but does not remove magical disease, curses, or similar effects.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Limit",
            .desc = "The creature must have been dead no more than 10 days and its soul must be willing and free.",
        }, .{
            .table = null,
            .heading = "Body",
            .desc = "Mortal wounds close, but missing vital body parts are not restored.",
        }, .{
            .table = null,
            .heading = "Recovery Penalty",
            .desc = "The returned creature has a -4 penalty to attacks, saves, and ability checks. Each long rest reduces the penalty by 1.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Cleric, Paladin
    null,
    null,
);

pub const rarys_telepathic_bond: Spell = Spell.compInit(
    "Rary's Telepathic Bond",
    .phb14,
    .level_5,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "eggshell pieces from two different kinds of creatures" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create a telepathic network among up to eight willing creatures.",
    .{ .desc = "Affected creatures can communicate telepathically with one another over any distance on the same plane, even without a common language. Creatures with Intelligence 2 or less are unaffected.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const reincarnate: Spell = Spell.compInit(
    "Reincarnate",
    .phb14,
    .level_5,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "rare oils and unguents worth at least 1,000 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a new adult body for a humanoid dead no more than ten days.",
    .{
        .desc = "A willing, free soul returns in a newly formed body. The creature keeps its memories and capabilities but replaces its former racial traits with those of the new form.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "d100", "New Form" },
                .table_entry = &.{ &.{ .{ .str = "01-04" }, .{ .str = "Dragonborn" } }, &.{ .{ .str = "05-13" }, .{ .str = "Hill dwarf" } }, &.{ .{ .str = "14-21" }, .{ .str = "Mountain dwarf" } }, &.{ .{ .str = "22-25" }, .{ .str = "Dark elf" } }, &.{ .{ .str = "26-34" }, .{ .str = "High elf" } }, &.{ .{ .str = "35-42" }, .{ .str = "Wood elf" } }, &.{ .{ .str = "43-46" }, .{ .str = "Forest gnome" } }, &.{ .{ .str = "47-52" }, .{ .str = "Rock gnome" } }, &.{ .{ .str = "53-56" }, .{ .str = "Half-elf" } }, &.{ .{ .str = "57-60" }, .{ .str = "Half-orc" } }, &.{ .{ .str = "61-68" }, .{ .str = "Lightfoot halfling" } }, &.{ .{ .str = "69-76" }, .{ .str = "Stout halfling" } }, &.{ .{ .str = "77-96" }, .{ .str = "Human" } }, &.{ .{ .str = "97-00" }, .{ .str = "Tiefling" } } },
            },
            .heading = "Reincarnation Table",
            .desc = "The DM can roll or choose the resulting form.",
        }},
    },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const scrying: Spell = Spell.compInit(
    "Scrying",
    .phb14,
    .level_5,
    .divination,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a focus worth at least 1,000 gp, such as a crystal ball, silver mirror, or holy-water font" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Observe a creature or known location on the same plane through an invisible sensor.",
    .{
        .desc = "A creature target makes a Wisdom save modified by familiarity and physical connection. On failure, a sensor appears near it and moves with it; a previously seen location can instead be observed directly.",
        .desc_fields = &.{ .{
            .table = .{
                .headings = &.{ "Knowledge", "Save Modifier" },
                .table_entry = &.{ &.{ .{ .str = "Secondhand" }, .{ .str = "+5" } }, &.{ .{ .str = "Firsthand" }, .{ .str = "+0" } }, &.{ .{ .str = "Familiar" }, .{ .str = "-5" } } },
            },
            .heading = "Knowledge",
            .desc = null,
        }, .{
            .table = .{
                .headings = &.{ "Connection", "Save Modifier" },
                .table_entry = &.{ &.{ .{ .str = "Likeness or picture" }, .{ .str = "-2" } }, &.{ .{ .str = "Possession or garment" }, .{ .str = "-4" } }, &.{ .{ .str = "Body part, hair, nail, or similar" }, .{ .str = "-10" } } },
            },
            .heading = "Connection",
            .desc = null,
        } },
    },
    null,
    &.{}, // Classes: Bard, Cleric, Druid, Warlock, Wizard
    null,
    null,
);

pub const seeming: Spell = Spell.compInit(
    "Seeming",
    .phb14,
    .level_5,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Give any number of visible creatures illusory appearances.",
    .{ .desc = "Each chosen creature can appear differently while retaining the same basic body arrangement. Unwilling targets may resist with Charisma saves. Physical interaction reveals inconsistencies, and an Intelligence (Investigation) check against your spell save DC can identify the disguise.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const skill_empowerment: Spell = Spell.compInit(
    "Skill Empowerment",
    .xge,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Grant expertise in one skill the target already knows.",
    .{ .desc = "A willing creature doubles its proficiency bonus for one proficient skill that is not already benefiting from another expertise-like doubling effect.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    null,
    null,
);

pub const steel_wind_strike: Spell = Spell.compInit(
    "Steel Wind Strike",
    .xge,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = true, .m_brief = "a melee weapon worth at least 1 sp" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Strike up to five creatures with rapid force attacks, then teleport.",
    .{ .desc = "Make a separate melee spell attack against each chosen target. A hit deals 6d10 force damage. Afterward, teleport to an open space within 5 feet of one of the targets, whether that attack hit or missed.", .desc_fields = null },
    null,
    &.{}, // Classes: Ranger, Wizard
    &.{roll_6d10},
    null,
);

pub const summon_celestial: Spell = Spell.compInit(
    "Summon Celestial",
    .tce,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a golden reliquary worth at least 500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon an Avenger or Defender celestial spirit.",
    .{
        .desc = "The spirit shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Base Statistics",
            .desc = "At 5th level: AC 16 (18 for Defender), 40 HP, 30-foot walk, 40-foot fly, radiant resistance, and immunity to charm and fear.",
        }, .{
            .table = null,
            .heading = "Multiattack",
            .desc = "The spirit attacks a number of times equal to half the spell level, rounded down.",
        }, .{
            .table = null,
            .heading = "Avenger",
            .desc = "Radiant Bow deals 2d6 + 2 + spell level radiant damage.",
        }, .{
            .table = null,
            .heading = "Defender",
            .desc = "Radiant Mace deals 1d10 + 3 + spell level radiant damage and can grant 1d10 temporary hit points nearby.",
        }, .{
            .table = null,
            .heading = "Healing Touch",
            .desc = "Once per day, heals 2d8 + spell level hit points.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Celestial Spirit: AC 17 (19 Defender); HP 50; Multiattack 3; Bow 2d6 + 8; Mace 1d10 + 9; Healing Touch 2d8 + 6.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6_plus_8, roll_1d10_plus_9, roll_1d10, roll_2d8_plus_6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Celestial Spirit: AC 18 (20 Defender); HP 60; Multiattack 3; Bow 2d6 + 9; Mace 1d10 + 10; Healing Touch 2d8 + 7.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6_plus_9, roll_1d10_plus_10, roll_1d10, roll_2d8_plus_7 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Celestial Spirit: AC 19 (21 Defender); HP 70; Multiattack 4; Bow 2d6 + 10; Mace 1d10 + 11; Healing Touch 2d8 + 8.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6_plus_10, roll_1d10_plus_11, roll_1d10, roll_2d8_plus_8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Celestial Spirit: AC 20 (22 Defender); HP 80; Multiattack 4; Bow 2d6 + 11; Mace 1d10 + 12; Healing Touch 2d8 + 9.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6_plus_11, roll_1d10_plus_12, roll_1d10, roll_2d8_plus_9 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{ roll_2d6_plus_7, roll_1d10_plus_8, roll_1d10, roll_2d8_plus_5 },
    null,
);

pub const summon_draconic_spirit: Spell = Spell.compInit(
    "Summon Draconic Spirit",
    .ftd,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an object engraved with a dragon image worth at least 500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a chromatic, gem, or metallic draconic spirit.",
    .{
        .desc = "The dragon shares your initiative, acts immediately after you, and obeys verbal commands.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Family",
            .desc = "Choose chromatic, gem, or metallic. The choice determines its available resistances; you also gain one chosen resistance from the spirit for the duration.",
        }, .{
            .table = null,
            .heading = "Base Statistics",
            .desc = "At 5th level: AC 19, 50 HP, 30-foot walk, 60-foot fly, 30-foot swim, blindsight 30 feet, darkvision 60 feet.",
        }, .{
            .table = null,
            .heading = "Multiattack",
            .desc = "The spirit makes floor(spell level / 2) Rend attacks and also uses its Breath Weapon.",
        }, .{
            .table = null,
            .heading = "Rend",
            .desc = "Deals 1d6 + 4 + spell level piercing damage.",
        }, .{
            .table = null,
            .heading = "Breath Weapon",
            .desc = "A 30-foot cone deals 2d6 damage of one type the dragon resists, Dexterity save for half.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Draconic Spirit: AC 20; HP 60; Multiattack 3 Rend attacks plus Breath Weapon; Rend 1d6 + 10; Breath 2d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d6_plus_10, roll_1d6_plus_10, roll_1d6_plus_10, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Draconic Spirit: AC 21; HP 70; Multiattack 3 Rend attacks plus Breath Weapon; Rend 1d6 + 11; Breath 2d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d6_plus_11, roll_1d6_plus_11, roll_1d6_plus_11, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Draconic Spirit: AC 22; HP 80; Multiattack 4 Rend attacks plus Breath Weapon; Rend 1d6 + 12; Breath 2d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d6_plus_12, roll_1d6_plus_12, roll_1d6_plus_12, roll_1d6_plus_12, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Draconic Spirit: AC 23; HP 90; Multiattack 4 Rend attacks plus Breath Weapon; Rend 1d6 + 13; Breath 2d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d6_plus_13, roll_1d6_plus_13, roll_1d6_plus_13, roll_1d6_plus_13, roll_2d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{ roll_1d6_plus_9, roll_1d6_plus_9, roll_2d6 },
    null,
);

pub const swift_quiver: Spell = Spell.compInit(
    "Swift Quiver",
    .phb14,
    .level_5,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a quiver containing at least one piece of ammunition" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Turn a quiver into an endless temporary ammunition source.",
    .{ .desc = "On each of your turns you can use a bonus action to make two attacks with a weapon using ammunition from the quiver. Used ammunition is immediately replaced with a matching nonmagical copy, which disappears when the spell ends.", .desc_fields = null },
    null,
    &.{}, // Classes: Ranger
    null,
    null,
);

pub const synaptic_static: Spell = Spell.compInit(
    "Synaptic Static",
    .xge,
    .level_5,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Explode psychic energy and scramble the thoughts of creatures in an area.",
    .{ .desc = "Targets with Intelligence 3 or higher make Intelligence saves against 8d6 psychic damage. Failed targets also subtract 1d6 from attack rolls, ability checks, and Constitution saves to maintain concentration for up to 1 minute, repeating the Intelligence save each turn to end the penalty.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{ roll_8d6, roll_negative_1d6 },
    null,
);

pub const telekinesis: Spell = Spell.compInit(
    "Telekinesis",
    .phb14,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Move creatures and objects by force of thought.",
    .{
        .desc = "When cast and as an action on later rounds, choose one creature or object in range and apply the appropriate effect.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Creature",
            .desc = "Contest your spellcasting ability against the creature's Strength to move a Huge-or-smaller creature up to 30 feet and restrain it until the end of your next turn; later actions can maintain the grip.",
        }, .{
            .table = null,
            .heading = "Object",
            .desc = "Move an object up to 1,000 pounds automatically if unattended; worn or carried objects require a contest. Fine manipulation of simple objects is possible.",
        } },
    },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    null,
    null,
);

pub const teleportation_circle: Spell = Spell.compInit(
    "Teleportation Circle",
    .phb14,
    .level_5,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = "10-foot-diameter circle" },
    .{ .v = true, .s = false, .m = true, .m_brief = "rare chalks and inks with gems worth 50 gp, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .round, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Open a short-lived portal to a permanent teleportation circle whose sigil sequence you know.",
    .{ .desc = "The circle remains open until the end of your next turn. Studying a new sigil sequence for one minute lets you memorize it; casting in the same place daily for a year creates a permanent circle.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const transmute_rock: Spell = Spell.compInit(
    "Transmute Rock",
    .xge,
    .level_5,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "40-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "clay and water" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Transform a large area of stone into mud or mud into stone.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Rock to Mud",
            .desc = "Turn nonmagical stone into deep mud that severely impedes movement and can restrain creatures; a transformed ceiling falls as mud for 4d8 bludgeoning damage on a failed Dexterity save.",
        }, .{
            .table = null,
            .heading = "Mud to Rock",
            .desc = "Turn mud or quicksand up to 10 feet deep into soft stone. Creatures caught in it can become restrained and may break free with a DC 20 Strength check or by damaging the surrounding stone.",
        } },
    },
    null,
    &.{}, // Classes: Artificer, Druid, Wizard
    &.{roll_4d8},
    null,
);

pub const tree_stride: Spell = Spell.compInit(
    "Tree Stride",
    .phb14,
    .level_5,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Travel between nearby living trees of the same kind.",
    .{ .desc = "Spend 5 feet of movement to enter a tree and emerge from another suitable tree within 500 feet, spending another 5 feet to exit. The transport can be used once per round, and each turn must end outside a tree.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const wall_of_force: Spell = Spell.compInit(
    "Wall of Force",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = "sphere, dome, or ten contiguous panels" },
    .{ .v = true, .s = true, .m = true, .m_brief = "powder from a crushed clear gemstone" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create an invisible and nearly indestructible force barrier.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Forms",
            .desc = "Create either a sphere or hemisphere up to 10 feet in radius, or up to ten contiguous 10-by-10-foot panels.",
        }, .{
            .table = null,
            .heading = "Barrier",
            .desc = "Nothing physical passes through. The wall is immune to damage, extends into the Ethereal Plane, and cannot be dispelled normally; disintegrate destroys it.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const wall_of_light: Spell = Spell.compInit(
    "Wall of Light",
    .xge,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .line, .brief = "up to 60 feet long, 10 feet high, and 5 feet thick" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a hand mirror" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a brilliant wall that damages, blinds, and can fire radiant beams.",
    .{
        .desc = "The wall blocks line of sight but not movement and sheds bright light for 120 feet plus another 120 feet of dim light.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Initial Flash",
                .desc = "Creatures in the wall when it appears make Constitution saves against 4d8 radiant damage and possible blindness.",
            },
            .{
                .table = null,
                .heading = "Inside the Wall",
                .desc = "Ending a turn in the wall deals 4d8 radiant damage.",
            },
            .{
                .table = null,
                .heading = "Radiant Beam",
                .desc = "As an action, make a ranged spell attack against a creature within 60 feet of the wall for 4d8 radiant damage; each use shortens the wall by 10 feet.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "All 4d8 radiant damage instances become 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "All 4d8 radiant damage instances become 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "All 4d8 radiant damage instances become 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "All 4d8 radiant damage instances become 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_4d8},
    null,
);

pub const wall_of_stone: Spell = Spell.compInit(
    "Wall of Stone",
    .phb14,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = "ten configurable stone panels" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small block of granite" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a configurable wall of solid stone.",
    .{
        .desc = "The wall must be supported by existing stone, but can form ramps, bridges, battlements, and similar crude shapes.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Panels",
            .desc = "Create ten contiguous 10-by-10-foot panels 6 inches thick, or 10-by-20-foot panels 3 inches thick.",
        }, .{
            .table = null,
            .heading = "Durability",
            .desc = "Each panel has AC 15 and 30 hit points per inch of thickness.",
        }, .{
            .table = null,
            .heading = "Permanence",
            .desc = "Maintaining concentration for the full 10 minutes makes the wall permanent and nonmagical.",
        } },
    },
    null,
    &.{}, // Classes: Artificer, Druid, Sorcerer, Wizard
    null,
    null,
);

pub const wrath_of_nature: Spell = Spell.compInit(
    "Wrath of Nature",
    .xge,
    .level_5,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "60-foot cube" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Animate natural terrain inside a large cube against your enemies.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Grasses and Undergrowth",
            .desc = "Ground covered in vegetation becomes difficult terrain for your enemies.",
        }, .{
            .table = null,
            .heading = "Trees",
            .desc = "At the start of each of your turns, enemies within 10 feet of a tree make Dexterity saves or take 4d6 slashing damage.",
        }, .{
            .table = null,
            .heading = "Roots and Vines",
            .desc = "At the end of each of your turns, one chosen grounded creature makes a Strength save or becomes restrained; it can use an action to attempt escape.",
        }, .{
            .table = null,
            .heading = "Rocks",
            .desc = "As a bonus action, make a ranged spell attack with a loose rock for 3d8 bludgeoning damage and a Strength save against being knocked prone.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Ranger
    &.{ roll_4d6, roll_3d8 },
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_5_spell_arr = [_]Spell{
    animate_objects,
    antilife_shell,
    awaken,
    banishing_smite,
    bigbys_hand,
    circle_of_power,
    cloudkill,
    commune,
    commune_with_nature,
    cone_of_cold,
    conjure_elemental,
    conjure_volley,
    contact_other_plane,
    contagion,
    control_winds,
    create_spelljamming_helm,
    creation,
    danse_macabre,
    dawn,
    destructive_wave,
    dispel_evil_and_good,
    dominate_person,
    dream,
    enervation,
    far_step,
    flame_strike,
    geas,
    greater_restoration,
    hallow,
    hold_monster,
    holy_weapon,
    immolation,
    infernal_calling,
    insect_plague,
    legend_lore,
    maelstrom,
    mass_cure_wounds,
    mislead,
    modify_memory,
    negative_energy_flood,
    passwall,
    planar_binding,
    raise_dead,
    rarys_telepathic_bond,
    reincarnate,
    scrying,
    seeming,
    skill_empowerment,
    steel_wind_strike,
    summon_celestial,
    summon_draconic_spirit,
    swift_quiver,
    synaptic_static,
    telekinesis,
    teleportation_circle,
    transmute_rock,
    tree_stride,
    wall_of_force,
    wall_of_light,
    wall_of_stone,
    wrath_of_nature,
};

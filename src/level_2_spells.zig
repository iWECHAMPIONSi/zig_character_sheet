const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 2 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// the non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_10d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_10d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_10d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_11d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_12d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_14d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_16d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 16, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_18d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 18, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_1d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_1d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_1d8_plus_10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 10 }, .negative = false },
    },
};

const roll_1d8_plus_11: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 11 }, .negative = false },
    },
};

const roll_1d8_plus_12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 12 }, .negative = false },
    },
};

const roll_1d8_plus_13: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 13 }, .negative = false },
    },
};

const roll_1d8_plus_6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 6 }, .negative = false },
    },
};

const roll_1d8_plus_7: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 7 }, .negative = false },
    },
};

const roll_1d8_plus_8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 8 }, .negative = false },
    },
};

const roll_1d8_plus_9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .flat = 9 }, .negative = false },
    },
};

const roll_1d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_2d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_2d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_2d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_2d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_2d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_3d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_3d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_3d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_3d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_3d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_4d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_4d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_4d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_4d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_4d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_5d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_5d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_5d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_5d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_5d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_6d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_6d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_6d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_6d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_6d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_7d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_7d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_7d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_7d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_7d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_8d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_8d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_8d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_8d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_8d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_9d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_9d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_9d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_9d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_9d8_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

// ============================================================================
// Shared modifiers
// ============================================================================

const aid_hp_5: modifier.Modifier = .{
    .name = "Aid current hit point increase of 5",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 5.",
    .amount = 5,
};

const aid_max_hp_5: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 5",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 5.",
    .amount = 5,
};

const aid_hp_10: modifier.Modifier = .{
    .name = "Aid current hit point increase of 10",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 10.",
    .amount = 10,
};

const aid_max_hp_10: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 10",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 10.",
    .amount = 10,
};

const aid_hp_15: modifier.Modifier = .{
    .name = "Aid current hit point increase of 15",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 15.",
    .amount = 15,
};

const aid_max_hp_15: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 15",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 15.",
    .amount = 15,
};

const aid_hp_20: modifier.Modifier = .{
    .name = "Aid current hit point increase of 20",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 20.",
    .amount = 20,
};

const aid_max_hp_20: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 20",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 20.",
    .amount = 20,
};

const aid_hp_25: modifier.Modifier = .{
    .name = "Aid current hit point increase of 25",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 25.",
    .amount = 25,
};

const aid_max_hp_25: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 25",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 25.",
    .amount = 25,
};

const aid_hp_30: modifier.Modifier = .{
    .name = "Aid current hit point increase of 30",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 30.",
    .amount = 30,
};

const aid_max_hp_30: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 30",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 30.",
    .amount = 30,
};

const aid_hp_35: modifier.Modifier = .{
    .name = "Aid current hit point increase of 35",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 35.",
    .amount = 35,
};

const aid_max_hp_35: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 35",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 35.",
    .amount = 35,
};

const aid_hp_40: modifier.Modifier = .{
    .name = "Aid current hit point increase of 40",
    .modifier = .{ .player_stat = .hit_points },
    .brief = "Aid current hit point increase of 40.",
    .amount = 40,
};

const aid_max_hp_40: modifier.Modifier = .{
    .name = "Aid maximum hit point increase of 40",
    .modifier = .{ .player_stat = .max_hit_points },
    .brief = "Aid maximum hit point increase of 40.",
    .amount = 40,
};

const kinetic_jaunt_speed: modifier.Modifier = .{
    .name = "Kinetic Jaunt speed increase",
    .modifier = .{ .bonus = .speed },
    .brief = "Kinetic Jaunt speed increase.",
    .amount = 10,
};

const pass_without_trace_stealth: modifier.Modifier = .{
    .name = "Pass Without Trace Stealth bonus",
    .modifier = .{ .skill = .stealth },
    .brief = "Pass Without Trace Stealth bonus.",
    .amount = 10,
};

const warding_bond_ac: modifier.Modifier = .{
    .name = "Warding Bond AC bonus",
    .modifier = .{ .bonus = .armor_class },
    .brief = "Warding Bond AC bonus.",
    .amount = 1,
};

const warding_bond_save: modifier.Modifier = .{
    .name = "Warding Bond saving throw bonus",
    .modifier = .{ .bonus = .saving_throw },
    .brief = "Warding Bond saving throw bonus.",
    .amount = 1,
};

const magic_weapon_attack_1: modifier.Modifier = .{
    .name = "Magic Weapon attack bonus of +1",
    .modifier = .{ .bonus = .weapon_attack },
    .brief = "Magic Weapon attack bonus of +1.",
    .amount = 1,
};

const magic_weapon_damage_1: modifier.Modifier = .{
    .name = "Magic Weapon damage bonus of +1",
    .modifier = .{ .bonus = .weapon_damage },
    .brief = "Magic Weapon damage bonus of +1.",
    .amount = 1,
};

const magic_weapon_attack_2: modifier.Modifier = .{
    .name = "Magic Weapon attack bonus of +2",
    .modifier = .{ .bonus = .weapon_attack },
    .brief = "Magic Weapon attack bonus of +2.",
    .amount = 2,
};

const magic_weapon_damage_2: modifier.Modifier = .{
    .name = "Magic Weapon damage bonus of +2",
    .modifier = .{ .bonus = .weapon_damage },
    .brief = "Magic Weapon damage bonus of +2.",
    .amount = 2,
};

const magic_weapon_attack_3: modifier.Modifier = .{
    .name = "Magic Weapon attack bonus of +3",
    .modifier = .{ .bonus = .weapon_attack },
    .brief = "Magic Weapon attack bonus of +3.",
    .amount = 3,
};

const magic_weapon_damage_3: modifier.Modifier = .{
    .name = "Magic Weapon damage bonus of +3",
    .modifier = .{ .bonus = .weapon_damage },
    .brief = "Magic Weapon damage bonus of +3.",
    .amount = 3,
};

// ============================================================================
// Level 2 spell definitions
// ============================================================================

pub const aganazzars_scorcher: Spell = Spell.compInit(
    "Aganazzar's Scorcher",
    .xge,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = .line, .brief = "30-foot-long, 5-foot-wide line from you" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a red dragon's scale" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Burn creatures in a line with roaring flame.",
    .{ .desc = "A line of flame extends from you. Creatures in it make Dexterity saves, taking 3d8 fire damage on a failure or half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
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
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_3d8},
    null,
);

pub const aid: Spell = Spell.compInit(
    "Aid",
    .phb14,
    .level_2,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny strip of white cloth" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Increase three creatures' current and maximum hit points.",
    .{ .desc = "Choose up to three creatures. Each target's current hit points and hit point maximum increase by 5 for the duration.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Each target gains 10 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_10, aid_max_hp_10 },
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Each target gains 15 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_15, aid_max_hp_15 },
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Each target gains 20 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_20, aid_max_hp_20 },
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Each target gains 25 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_25, aid_max_hp_25 },
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Each target gains 30 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_30, aid_max_hp_30 },
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Each target gains 35 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_35, aid_max_hp_35 },
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Each target gains 40 current and maximum hit points instead.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ aid_hp_40, aid_max_hp_40 },
        },
    },
    &.{}, // Classes: Artificer, Cleric, Paladin
    null,
    &.{ aid_hp_5, aid_max_hp_5 },
);

pub const air_bubble: Spell = Spell.compInit(
    "Air Bubble",
    .sais,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Create a globe of breathable air around a willing creature's head.",
    .{ .desc = "Create a fresh-air globe around one head of a willing creature you can see. The globe prevents suffocation for the spell's duration.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Create 3 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Create 5 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Create 7 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Create 9 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create 11 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create 13 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create 15 globes of fresh air.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const alter_self: Spell = Spell.compInit(
    "Alter Self",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Assume one of several physical adaptations.",
    .{
        .desc = "Magically reshape your body and choose one adaptation for the duration.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Aquatic Adaptation",
                .desc = "Gain the ability to breathe underwater and a swimming speed equal to your walking speed.",
            },
            .{
                .table = null,
                .heading = "Change Appearance",
                .desc = "Alter your appearance and basic physical characteristics while remaining the same general body plan and size category.",
            },
            .{
                .table = null,
                .heading = "Natural Weapons",
                .desc = "Grow claws, fangs, horns, or another natural weapon. You are proficient with it; it is magical and deals 1d6 damage using Strength for attacks and damage.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    null,
);

pub const animal_messenger: Spell = Spell.compInit(
    "Animal Messenger",
    .phb14,
    .level_2,
    .enchantment,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a morsel of food" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Send a Tiny beast to deliver a short spoken message.",
    .{
        .desc = "Choose a Tiny beast, describe a destination and recipient, and speak a message. The beast travels toward the destination and repeats the message when it reaches the described recipient.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Travel",
                .desc = "The messenger covers about 50 miles per 24 hours if it flies, or about 25 miles otherwise. If it cannot arrive before the spell ends, the message is lost.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Duration becomes 72 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Duration becomes 120 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Duration becomes 168 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration becomes 216 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes 264 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration becomes 312 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes 360 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Druid, Ranger
    null,
    null,
);

pub const arcane_lock: Spell = Spell.compInit(
    "Arcane Lock",
    .phb14,
    .level_2,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "gold dust worth at least 25 gp, which the spell consumes" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Magically secure a closed door, window, gate, chest, or similar entry.",
    .{ .desc = "Touch a closed entry or container. It becomes magically locked until dispelled. You and designated creatures can open it normally; otherwise the DC to break it or pick its lock increases by 10.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const augury: Spell = Spell.compInit(
    "Augury",
    .phb14,
    .level_2,
    .divination,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "specially marked sticks, bones, or similar tokens worth at least 25 gp" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Receive an omen about a planned course of action within the next 30 minutes.",
    .{
        .desc = "Cast marked tokens to receive an omen concerning a specific course of action you plan to take soon.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Omen", "Meaning" },
                    .table_entry = &.{
                        &.{ .{ .str = "Weal" }, .{ .str = "Good results" } },
                        &.{ .{ .str = "Woe" }, .{ .str = "Bad results" } },
                        &.{ .{ .str = "Weal and woe" }, .{ .str = "Both good and bad results" } },
                        &.{ .{ .str = "Nothing" }, .{ .str = "Neither especially good nor bad" } },
                    },
                },
                .heading = "Possible Omens",
                .desc = "The response reflects the likely immediate result of the proposed action.",
            },
            .{
                .table = null,
                .heading = "Repeated Castings",
                .desc = "After the first casting before your next long rest, each additional casting has a cumulative 25% chance to produce a random result instead of a truthful omen.",
            },
        },
    },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const barkskin: Spell = Spell.compInit(
    "Barkskin",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a handful of oak bark" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Set a willing creature's minimum Armor Class to 16.",
    .{ .desc = "A willing creature's skin becomes barklike. Its AC cannot be lower than 16 for the duration, regardless of armor.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const beast_sense: Spell = Spell.compInit(
    "Beast Sense",
    .phb14,
    .level_2,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Perceive through a willing beast's senses.",
    .{ .desc = "Touch a willing beast. For the duration you can use your action to see through its eyes and hear through its ears, gaining any special senses it has; while doing so you are blind and deaf to your own surroundings.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const blindness_deafness: Spell = Spell.compInit(
    "Blindness/Deafness",
    .phb14,
    .level_2,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Blind or deafen a creature that fails a Constitution save.",
    .{ .desc = "Choose one creature and one condition: blinded or deafened. On a failed Constitution save the target suffers that condition, repeating the save at the end of each of its turns to end it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 2 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 3 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 4 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 5 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 6 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 7 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 8 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Sorcerer, Wizard
    null,
    null,
);

pub const blur: Spell = Spell.compInit(
    "Blur",
    .phb14,
    .level_2,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Make your body visually indistinct, hindering sight-based attacks.",
    .{ .desc = "Your form becomes blurred and shifting. Attack rolls against you have disadvantage while the attacker relies on sight to perceive you.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    null,
);

pub const borrowed_knowledge: Spell = Spell.compInit(
    "Borrowed Knowledge",
    .scc,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a book worth at least 25 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Temporarily gain proficiency in one skill.",
    .{ .desc = "Choose one skill in which you lack proficiency. You gain proficiency in that skill for the duration.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Warlock, Wizard
    null,
    null,
);

pub const branding_smite: Spell = Spell.compInit(
    "Branding Smite",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower your next weapon hit with radiant damage and revealing light.",
    .{ .desc = "The next time you hit with a weapon before the spell ends, the attack deals an extra 2d6 radiant damage. An invisible target becomes visible and sheds dim light while the spell persists.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Paladin
    &.{roll_2d6},
    null,
);

pub const calm_emotions: Spell = Spell.compInit(
    "Calm Emotions",
    .phb14,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Suppress powerful emotions in humanoids within an area.",
    .{
        .desc = "Humanoids in the area make Charisma saves, which they may choose to fail. Choose one of two effects for affected creatures.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Suppress Emotion",
                .desc = "Temporarily suppress effects causing a target to be charmed or frightened; suppressed effects resume if still applicable when this spell ends.",
            },
            .{
                .table = null,
                .heading = "Indifference",
                .desc = "Make a target indifferent toward creatures it was hostile toward. The effect ends early for a target that is attacked, harmed, or sees its allies harmed.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Cleric
    null,
    null,
);

pub const cloud_of_daggers: Spell = Spell.compInit(
    "Cloud of Daggers",
    .phb14,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "5-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a sliver of glass" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Fill a small cube with spinning daggers.",
    .{ .desc = "A 5-foot cube becomes filled with magical daggers. A creature takes 4d4 slashing damage when it enters the area for the first time on a turn or starts its turn there.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 6d4.", .desc_fields = null },
            .dice_rolls = &.{roll_6d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 8d4.", .desc_fields = null },
            .dice_rolls = &.{roll_8d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 10d4.", .desc_fields = null },
            .dice_rolls = &.{roll_10d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 12d4.", .desc_fields = null },
            .dice_rolls = &.{roll_12d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 14d4.", .desc_fields = null },
            .dice_rolls = &.{roll_14d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 16d4.", .desc_fields = null },
            .dice_rolls = &.{roll_16d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 18d4.", .desc_fields = null },
            .dice_rolls = &.{roll_18d4},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_4d4},
    null,
);

pub const continual_flame: Spell = Spell.compInit(
    "Continual Flame",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "ruby dust worth 50 gp, which the spell consumes" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Create a permanent, heatless flame-like light.",
    .{ .desc = "A flame-like light springs from an object you touch. It produces light like a torch but creates no heat and consumes no fuel.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Wizard
    null,
    null,
);

pub const cordon_of_arrows: Spell = Spell.compInit(
    "Cordon of Arrows",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 5 }, .shape = null, .brief = "place ammunition within 5 feet; it monitors creatures within 30 feet" },
    .{ .v = true, .s = true, .m = true, .m_brief = "four or more arrows or bolts" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Enchant buried ammunition to strike intruders.",
    .{ .desc = "Plant four nonmagical arrows or bolts in the ground. When an unexcluded creature comes within 30 feet, one piece flies at it; on a failed Dexterity save the creature takes 1d6 piercing damage. Each piece can trigger once.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "You can prepare 6 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "You can prepare 8 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "You can prepare 10 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "You can prepare 12 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "You can prepare 14 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "You can prepare 16 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "You can prepare 18 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Ranger
    &.{roll_1d6},
    null,
);

pub const crown_of_madness: Spell = Spell.compInit(
    "Crown of Madness",
    .phb14,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm a humanoid and compel melee attacks.",
    .{
        .desc = "A humanoid that fails a Wisdom save becomes charmed and bears an illusory crown.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Compelled Attack",
                .desc = "On each of your subsequent turns you must use your action to maintain control or the spell ends. Before moving on its next turn, the target must use its action to make a melee attack against a creature you choose within reach.",
            },
            .{
                .table = null,
                .heading = "Ending the Effect",
                .desc = "If no valid target is within reach, the creature acts normally. It repeats the Wisdom save at the end of each turn, ending the spell on a success.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const darkness: Spell = Spell.compInit(
    "Darkness",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "15-foot-radius sphere" },
    .{ .v = true, .s = false, .m = true, .m_brief = "bat fur and a drop of pitch or piece of coal" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a sphere of magical darkness.",
    .{
        .desc = "Magical darkness spreads from a point or object and around corners. Ordinary darkvision cannot see through it, and nonmagical light cannot illuminate it.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Object Target",
                .desc = "If cast on an object you hold or one not worn or carried by another creature, the darkness moves with it and can be blocked by fully covering the source.",
            },
            .{
                .table = null,
                .heading = "Magical Light",
                .desc = "If the area overlaps light from a spell of 2nd level or lower, that light spell is dispelled.",
            },
        },
    },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const darkvision: Spell = Spell.compInit(
    "Darkvision",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "either a pinch of dried carrot or an agate" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Grant a creature 60-foot darkvision.",
    .{ .desc = "Touch a willing creature and grant it the ability to see in darkness out to 60 feet for the duration.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const detect_thoughts: Spell = Spell.compInit(
    "Detect Thoughts",
    .phb14,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "thought sensing extends to 30 feet" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a copper piece" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Read surface thoughts, probe deeper, or detect nearby thinking creatures.",
    .{
        .desc = "For the duration you can focus on creatures to sense and read thoughts.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Surface Thoughts",
                .desc = "When focusing on a creature you can see within 30 feet, you initially learn its surface thoughts without a save.",
            },
            .{
                .table = null,
                .heading = "Deep Probe",
                .desc = "You can probe deeper; the target makes a Wisdom save. On a failure you gain insight into its reasoning, emotional state, and prominent concerns. The target then knows you are probing it, and either creature can use an action for a contested Intelligence check to end the spell.",
            },
            .{
                .table = null,
                .heading = "Hidden Creatures",
                .desc = "You can search for thoughts within 30 feet even without seeing the creature. The spell does not detect creatures with Intelligence 3 or lower or creatures that do not speak a language. Barriers can block the sensing depending on material and thickness.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const dragons_breath: Spell = Spell.compInit(
    "Dragon's Breath",
    .xge,
    .level_2,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = .cone, .brief = "target can exhale a 15-foot cone" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a hot pepper" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Grant a creature a repeatable elemental breath weapon.",
    .{ .desc = "Touch a willing creature and choose acid, cold, fire, lightning, or poison. Until the spell ends, the target can use an action to exhale a 15-foot cone; creatures in it make Dexterity saves against 3d6 damage, taking half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_3d6},
    null,
);

pub const dust_devil: Spell = Spell.compInit(
    "Dust Devil",
    .xge,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "5-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of dust" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create and move a small whirlwind.",
    .{
        .desc = "A 5-foot-cube whirlwind appears. A creature entering its space for the first time on a turn or starting there makes a Strength save, taking 1d8 bludgeoning damage and being pushed 10 feet on a failure, or half damage without the push on a success.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Movement",
                .desc = "As a bonus action, move the whirlwind up to 30 feet in any direction.",
            },
            .{
                .table = null,
                .heading = "Dust and Debris",
                .desc = "If it passes over loose dust, sand, dirt, or gravel, it pulls material into a 10-foot-radius cloud that heavily obscures its area until the start of your next turn.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_1d8},
    null,
);

pub const earthbind: Spell = Spell.compInit(
    "Earthbind",
    .xge,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Suppress a creature's flying speed and pull it safely toward the ground.",
    .{ .desc = "A creature you can see makes a Strength save. On a failure its flying speed becomes 0; an airborne creature descends up to 60 feet per round until reaching the ground, without taking falling damage from this descent.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const enhance_ability: Spell = Spell.compInit(
    "Enhance Ability",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "fur or a feather from a beast" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Grant one of six ability-related enhancements.",
    .{
        .desc = "Touch a creature and choose one enhancement.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Bear's Endurance",
                .desc = "Advantage on Constitution checks and 2d6 temporary hit points that disappear when the spell ends.",
            },
            .{
                .table = null,
                .heading = "Bull's Strength",
                .desc = "Advantage on Strength checks and doubled carrying capacity.",
            },
            .{
                .table = null,
                .heading = "Cat's Grace",
                .desc = "Advantage on Dexterity checks and immunity to damage from falls of 20 feet or less while not incapacitated.",
            },
            .{
                .table = null,
                .heading = "Eagle's Splendor",
                .desc = "Advantage on Charisma checks.",
            },
            .{
                .table = null,
                .heading = "Fox's Cunning",
                .desc = "Advantage on Intelligence checks.",
            },
            .{
                .table = null,
                .heading = "Owl's Wisdom",
                .desc = "Advantage on Wisdom checks.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 2 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 3 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 4 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 5 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 6 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 7 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 8 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Cleric, Druid, Sorcerer
    null,
    null,
);

pub const enlarge_reduce: Spell = Spell.compInit(
    "Enlarge/Reduce",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of powdered iron" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Temporarily enlarge or reduce a creature or object.",
    .{
        .desc = "Choose a creature or object. An unwilling creature can resist with a Constitution save.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Enlarge",
                .desc = "The target grows one size category, doubles its dimensions, multiplies its weight by eight, gains advantage on Strength checks and saves, and its weapons deal an extra 1d4 damage.",
            },
            .{
                .table = null,
                .heading = "Reduce",
                .desc = "The target shrinks one size category, halves its dimensions, reduces its weight to one-eighth, has disadvantage on Strength checks and saves, and its weapons deal 1d4 less damage, to a minimum of 1.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    null,
);

pub const enthrall: Spell = Spell.compInit(
    "Enthrall",
    .phb14,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Distract nearby creatures so they overlook others.",
    .{ .desc = "Creatures of your choice within range that can hear you make Wisdom saves. On a failure, a creature has disadvantage on Wisdom (Perception) checks made to perceive creatures other than you until the spell ends or it can no longer hear you. Charm-immune creatures succeed automatically.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Warlock
    null,
    null,
);

pub const find_steed: Spell = Spell.compInit(
    "Find Steed",
    .phb14,
    .level_2,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Summon a loyal intelligent spirit in the form of a mount.",
    .{
        .desc = "A spirit appears as a chosen mount and serves willingly. Its creature type becomes celestial, fey, or fiend, and its Intelligence is at least 6.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Form",
                .desc = "Choose a warhorse, pony, camel, elk, mastiff, or another mount allowed by the GM with similar statistics.",
            },
            .{
                .table = null,
                .heading = "Bond",
                .desc = "While within 1 mile you communicate telepathically. While mounted, spells you cast that target only yourself can also affect the steed.",
            },
            .{
                .table = null,
                .heading = "Disappearance and Resummoning",
                .desc = "The steed disappears at 0 hit points or when dismissed. Casting the spell again summons the same steed restored to full hit points, unless you release it permanently.",
            },
        },
    },
    null,
    &.{}, // Classes: Paladin
    null,
    null,
);

pub const find_traps: Spell = Spell.compInit(
    "Find Traps",
    .phb14,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = "detects visible-range traps within line of sight" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Sense the presence and general nature of nearby traps.",
    .{ .desc = "You sense whether any deliberately created trap is within range and line of sight. You learn the general nature of the danger but not the trap's location. Natural hazards are not detected unless deliberately arranged as traps.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Druid, Ranger
    null,
    null,
);

pub const flame_blade: Spell = Spell.compInit(
    "Flame Blade",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a leaf of sumac" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a fiery blade that deals fire damage with melee spell attacks.",
    .{ .desc = "A fiery blade appears in your free hand. As an action you can make a melee spell attack with it for 3d6 fire damage. The blade sheds bright and dim light; if dropped it disappears, and you can recreate it with a bonus action while the spell lasts.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage remains 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage remains 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage remains 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage remains 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid
    &.{roll_3d6},
    null,
);

pub const flaming_sphere: Spell = Spell.compInit(
    "Flaming Sphere",
    .phb14,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "5-foot-diameter sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of tallow, a pinch of brimstone, and a dusting of powdered iron" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a movable sphere of fire.",
    .{
        .desc = "A 5-foot-diameter sphere of flame appears in an unoccupied space.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Damage",
                .desc = "A creature ending its turn within 5 feet of the sphere makes a Dexterity save, taking 2d6 fire damage on a failure or half on a success.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "As a bonus action, move the sphere up to 30 feet. If you ram it into a creature, that creature immediately makes the saving throw against the sphere's damage and the sphere stops moving for that turn.",
            },
            .{
                .table = null,
                .heading = "Environment",
                .desc = "The sphere can cross low barriers and small gaps, ignites unattended flammable objects, and sheds bright and dim light.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Wizard
    &.{roll_2d6},
    null,
);

pub const flock_of_familiars: Spell = Spell.compInit(
    "Flock of Familiars",
    .llk,
    .level_2,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Temporarily summon a group of familiar spirits.",
    .{
        .desc = "Summon three familiars using the forms and general rules of find familiar. If you already have a familiar, summon two instead.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Familiars",
                .desc = "Each familiar acts independently but obeys your commands and disappears when the spell ends.",
            },
            .{
                .table = null,
                .heading = "Communication",
                .desc = "You can telepathically communicate with the summoned familiars and perceive through their senses while they are within 1 mile.",
            },
            .{
                .table = null,
                .heading = "Touch Spells",
                .desc = "Only one familiar can deliver a touch spell for you at a time.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Summon 4 familiars, or 3 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Summon 5 familiars, or 4 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Summon 6 familiars, or 5 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Summon 7 familiars, or 6 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Summon 8 familiars, or 7 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Summon 9 familiars, or 8 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Summon 10 familiars, or 9 if you already have a familiar.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const gentle_repose: Spell = Spell.compInit(
    "Gentle Repose",
    .phb14,
    .level_2,
    .necromancy,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of salt and one copper piece placed on each of the corpse's eyes, which must remain there for the duration" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Preserve a corpse and delay the time limit for restoring it to life.",
    .{ .desc = "Touch a corpse or remains. The target is protected from decay and cannot become undead for the duration. Days spent under this spell do not count against time limits of spells that restore the dead to life.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Wizard
    null,
    null,
);

pub const gift_of_gab: Spell = Spell.compInit(
    "Gift of Gab",
    .ai,
    .level_2,
    .enchantment,
    false,
    .{ .time = .reaction, .brief = "when you speak to another creature" },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "affects listeners within 5 feet" },
    .{ .v = true, .s = true, .m = true, .m_brief = "2 gold coins, which the spell consumes as a tax" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Replace listeners' memory of what you just said.",
    .{ .desc = "Immediately after speaking, choose different words of similar length. Creatures within 5 feet that heard you remember the replacement words instead of your actual statement; creatures outside the area remember what was truly said.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const gust_of_wind: Spell = Spell.compInit(
    "Gust of Wind",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .line, .brief = "60-foot-long, 10-foot-wide line" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a legume seed" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a persistent line of powerful wind.",
    .{
        .desc = "A strong wind blasts from you in a chosen direction.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Push",
                .desc = "A creature starting its turn in the line makes a Strength save or is pushed 15 feet away from you.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "Moving toward you through the line costs 2 feet of movement for every 1 foot traveled.",
            },
            .{
                .table = null,
                .heading = "Flames and Gases",
                .desc = "The wind disperses gas or vapor, extinguishes unprotected flames, and causes protected flames to flicker.",
            },
            .{
                .table = null,
                .heading = "Redirect",
                .desc = "As a bonus action on later turns, change the direction of the line.",
            },
        },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

pub const healing_spirit: Spell = Spell.compInit(
    "Healing Spirit",
    .xge,
    .level_2,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "5-foot cube occupied by the spirit" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a spirit that heals creatures moving through its space.",
    .{
        .desc = "A nature spirit appears in a 5-foot cube.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Healing",
                .desc = "When a creature you can see moves into the spirit's space for the first time on a turn or starts its turn there, you can cause it to regain 1d6 hit points without using an action. Constructs and undead cannot be healed this way.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "As a bonus action, move the spirit up to 30 feet to a space you can see.",
            },
            .{
                .table = null,
                .heading = "Limit",
                .desc = "The spirit can heal a number of times equal to 1 + your spellcasting ability modifier, with a minimum of two uses, then disappears.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Ranger
    &.{roll_1d6},
    null,
);

pub const heat_metal: Spell = Spell.compInit(
    "Heat Metal",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a piece of iron and a flame" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Heat a manufactured metal object until it burns creatures touching it.",
    .{
        .desc = "Choose a manufactured metal object you can see. It glows red-hot and deals 2d8 fire damage to a creature in physical contact with it.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Held or Worn Objects",
                .desc = "A creature holding the object must make a Constitution save or drop it if possible. If it cannot drop the object, it has disadvantage on attack rolls and ability checks until the start of your next turn.",
            },
            .{
                .table = null,
                .heading = "Repeated Damage",
                .desc = "On later turns, you can use a bonus action to deal the damage again while the spell lasts.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Druid
    &.{roll_2d8},
    null,
);

pub const hold_person: Spell = Spell.compInit(
    "Hold Person",
    .phb14,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small, straight piece of iron" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Paralyze a humanoid that fails a Wisdom save.",
    .{ .desc = "A humanoid you can see makes a Wisdom save. On a failure it is paralyzed, repeating the save at the end of each of its turns and ending the effect on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 2 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 3 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 4 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 5 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 6 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 7 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 8 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Druid, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const invisibility: Spell = Spell.compInit(
    "Invisibility",
    .phb14,
    .level_2,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an eyelash encased in gum arabic" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Make a creature and its carried gear invisible until it attacks or casts a spell.",
    .{ .desc = "A touched creature becomes invisible for the duration. Anything it wears or carries is invisible while on its person. The spell ends for a target when that target attacks or casts a spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 2 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 3 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 4 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 5 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 6 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 7 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 8 targets.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const jims_glowing_coin: Spell = Spell.compInit(
    "Jim's Glowing Coin",
    .ai,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .radius, .brief = "creatures of your choice within 30 feet of the thrown coin" },
    .{ .v = false, .s = true, .m = true, .m_brief = "a coin and 2 gold coins, the latter consumed as a tax" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create a glowing coin that distracts nearby creatures.",
    .{ .desc = "Throw the material coin to a point within range; it glows like a light spell. Chosen creatures you can see within 30 feet of it make Wisdom saves. On a failure, a creature has disadvantage on Wisdom (Perception) checks and initiative rolls for the duration.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const kinetic_jaunt: Spell = Spell.compInit(
    "Kinetic Jaunt",
    .scc,
    .level_2,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Move faster, avoid opportunity attacks, and pass through creature spaces.",
    .{ .desc = "Magical movement grants +10 feet walking speed, prevents your movement from provoking opportunity attacks, and lets you move through other creatures without treating their spaces as difficult terrain. If you end your turn in another creature's space, you are pushed back to your last unoccupied space and take 1d8 force damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    &.{roll_1d8},
    &.{kinetic_jaunt_speed},
);

pub const knock: Spell = Spell.compInit(
    "Knock",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Open or suppress one mundane or magical lock with a loud knock.",
    .{ .desc = "Choose a visible object held shut by a lock, bar, stuck mechanism, or arcane lock. One mundane means of closure opens; if arcane lock is present, it is suppressed for 10 minutes. The spell creates a loud knock audible from far away.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const lesser_restoration: Spell = Spell.compInit(
    "Lesser Restoration",
    .phb14,
    .level_2,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "End one disease or one of several conditions on a creature.",
    .{ .desc = "Touch a creature and end either one disease or one condition affecting it: blinded, deafened, paralyzed, or poisoned.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Cleric, Druid, Paladin, Ranger
    null,
    null,
);

pub const levitate: Spell = Spell.compInit(
    "Levitate",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "either a small leather loop or a piece of golden wire bent into a cup shape with a long shank" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Raise a creature or object vertically and control its altitude.",
    .{ .desc = "One creature or loose object rises vertically up to 20 feet and remains suspended. An unwilling creature can resist with a Constitution save. On later turns you can change the target's altitude by up to 20 feet; it can move horizontally only by pushing or pulling against fixed objects.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    null,
);

pub const locate_animals_or_plants: Spell = Spell.compInit(
    "Locate Animals or Plants",
    .phb14,
    .level_2,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "searches within 5 miles" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of fur from a bloodhound" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Learn the direction and distance to the nearest creature or plant of a named kind.",
    .{ .desc = "Describe or name a specific kind of beast or plant. You learn the direction and distance to the closest example within 5 miles, if any is present.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid, Ranger
    null,
    null,
);

pub const locate_object: Spell = Spell.compInit(
    "Locate Object",
    .phb14,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "searches within 1,000 feet" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a forked twig" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Sense the direction to a familiar object within 1,000 feet.",
    .{ .desc = "Describe or name an object familiar to you. While it is within 1,000 feet, you sense the direction to its location; if it moves, you know its movement direction. Any thickness of lead blocking a direct path prevents the spell from locating the object.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Druid, Paladin, Ranger, Wizard
    null,
    null,
);

pub const magic_mouth: Spell = Spell.compInit(
    "Magic Mouth",
    .phb14,
    .level_2,
    .illusion,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small bit of honeycomb and jade dust worth at least 10 gp, which the spell consumes" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Place a spoken message on an object that plays when a chosen trigger occurs.",
    .{
        .desc = "Imbue an object with a message of up to 25 words and define a trigger based on observable visual or audible conditions within 30 feet.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Message",
                .desc = "When the trigger occurs, an illusory mouth appears and speaks the recorded message in your voice over as long as 10 minutes.",
            },
            .{
                .table = null,
                .heading = "Trigger",
                .desc = "The trigger can be general or detailed, but must rely on perceivable conditions within range rather than hidden facts.",
            },
            .{
                .table = null,
                .heading = "Repetition",
                .desc = "You choose whether the spell ends after speaking once or remains to repeat whenever triggered.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Bard, Wizard
    null,
    null,
);

pub const magic_weapon: Spell = Spell.compInit(
    "Magic Weapon",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Turn a nonmagical weapon into a +1 magic weapon.",
    .{ .desc = "Touch a nonmagical weapon. It becomes magical and gains a +1 bonus to attack and damage rolls for the duration.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The bonus remains +1.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_1, magic_weapon_damage_1 },
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The bonus becomes +2.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_2, magic_weapon_damage_2 },
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The bonus remains +2.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_2, magic_weapon_damage_2 },
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The bonus becomes +3.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_3, magic_weapon_damage_3 },
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The bonus remains +3.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_3, magic_weapon_damage_3 },
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The bonus remains +3.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_3, magic_weapon_damage_3 },
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The bonus remains +3.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{ magic_weapon_attack_3, magic_weapon_damage_3 },
        },
    },
    &.{}, // Classes: Artificer, Paladin, Wizard
    null,
    &.{ magic_weapon_attack_1, magic_weapon_damage_1 },
);

pub const maximillians_earthen_grasp: Spell = Spell.compInit(
    "Maximillian's Earthen Grasp",
    .xge,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = "hand rises from an unoccupied 5-foot square" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a miniature hand sculpted from clay" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a hand of compacted earth that can restrain and crush creatures.",
    .{
        .desc = "A Medium hand rises from the ground in an unoccupied 5-foot space.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Grasp",
                .desc = "Choose a creature within 5 feet of the hand. It makes a Strength save; on a failure it takes 2d6 bludgeoning damage and is restrained.",
            },
            .{
                .table = null,
                .heading = "Crush",
                .desc = "As an action, cause the hand to deal 2d6 bludgeoning damage to a creature it is restraining.",
            },
            .{
                .table = null,
                .heading = "Escape",
                .desc = "A restrained creature can use its action to make a Strength check against your spell save DC, escaping on a success.",
            },
            .{
                .table = null,
                .heading = "Retarget",
                .desc = "As an action, move the hand to another unoccupied space within range and make it attempt a new grasp.",
            },
        },
    },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_2d6},
    null,
);

pub const melfs_acid_arrow: Spell = Spell.compInit(
    "Melf's Acid Arrow",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "powdered rhubarb leaf and an adder's stomach" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Fire an acid arrow that damages immediately and again at the end of the target's next turn.",
    .{
        .desc = "Make a ranged spell attack.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Hit",
                .desc = "The target takes 4d4 acid damage immediately and another 2d4 acid damage at the end of its next turn.",
            },
            .{
                .table = null,
                .heading = "Miss",
                .desc = "On a miss, the target takes half of the initial damage and none of the delayed damage.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Initial damage becomes 5d4 and delayed damage becomes 3d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d4, roll_3d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Initial damage becomes 6d4 and delayed damage becomes 4d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d4, roll_4d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Initial damage becomes 7d4 and delayed damage becomes 5d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d4, roll_5d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Initial damage becomes 8d4 and delayed damage becomes 6d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d4, roll_6d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Initial damage becomes 9d4 and delayed damage becomes 7d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_9d4, roll_7d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Initial damage becomes 10d4 and delayed damage becomes 8d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_10d4, roll_8d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Initial damage becomes 11d4 and delayed damage becomes 9d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_11d4, roll_9d4 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    &.{ roll_4d4, roll_2d4 },
    null,
);

pub const mind_spike: Spell = Spell.compInit(
    "Mind Spike",
    .xge,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Deal psychic damage and track a failed-save target.",
    .{ .desc = "A creature makes a Wisdom save, taking 3d8 psychic damage on a failure or half on a success. On a failed save, while the spell lasts you know its location while on the same plane and it cannot become hidden from you; invisibility gives it no benefit against you.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
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
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_3d8},
    null,
);

pub const mirror_image: Spell = Spell.compInit(
    "Mirror Image",
    .phb14,
    .level_2,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create three illusory duplicates that can draw attacks away from you.",
    .{
        .desc = "Three shifting duplicates occupy your space. When a creature targets you with an attack, roll a d20 to determine whether a duplicate becomes the target instead.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Duplicates", "Redirect d20" },
                    .table_entry = &.{
                        &.{ .{ .int = 3 }, .{ .str = "6 or higher" } },
                        &.{ .{ .int = 2 }, .{ .str = "8 or higher" } },
                        &.{ .{ .int = 1 }, .{ .str = "11 or higher" } },
                    },
                },
                .heading = "Redirecting Attacks",
                .desc = "The required d20 result changes as duplicates are destroyed.",
            },
            .{
                .table = null,
                .heading = "Duplicate AC",
                .desc = "A duplicate has AC 10 + your Dexterity modifier. A hit destroys one duplicate.",
            },
            .{
                .table = null,
                .heading = "Bypassing the Illusion",
                .desc = "The spell does not affect creatures that cannot see, rely on nonvisual senses such as blindsight, or can perceive illusions as false with truesight.",
            },
        },
    },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const misty_step: Spell = Spell.compInit(
    "Misty Step",
    .phb14,
    .level_2,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "teleport up to 30 feet to a visible unoccupied space" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Teleport up to 30 feet in a burst of mist.",
    .{ .desc = "Briefly surrounded by silvery mist, you teleport up to 30 feet to an unoccupied space you can see.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const moonbeam: Spell = Spell.compInit(
    "Moonbeam",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cylinder, .brief = "5-foot radius, 40-foot-high cylinder" },
    .{ .v = true, .s = true, .m = true, .m_brief = "several seeds of any moonseed plant and a piece of opalescent feldspar" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a movable column of radiant moonlight.",
    .{
        .desc = "A cylinder of pale light fills the chosen area.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Damage",
                .desc = "A creature entering the area for the first time on a turn or starting its turn there makes a Constitution save, taking 2d10 radiant damage on a failure or half on a success.",
            },
            .{
                .table = null,
                .heading = "Shapechangers",
                .desc = "A shapechanger has disadvantage on the save and, on a failure, reverts to its original form and cannot change form until it leaves the light.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "As an action on later turns, move the beam up to 60 feet in any direction.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
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
    &.{}, // Classes: Druid
    &.{roll_2d10},
    null,
);

pub const nathairs_mischief: Spell = Spell.compInit(
    "Nathair's Mischief",
    .ftd,
    .level_2,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "20-foot cube" },
    .{ .v = false, .s = true, .m = true, .m_brief = "a piece of crust from an apple pie" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Fill a movable cube with a randomly changing fey-draconic effect.",
    .{
        .desc = "A 20-foot cube fills with whimsical magic. Roll a d4 when the spell is cast and again at the start of each of your turns; before each later roll, you can move the cube up to 10 feet.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "d4", "Effect" },
                    .table_entry = &.{
                        &.{ .{ .int = 1 }, .{ .str = "Apple-pie aroma; Wisdom save or charmed until the start of your next turn." } },
                        &.{ .{ .int = 2 }, .{ .str = "Flowers spray water; Dexterity save or blinded until the start of your next turn." } },
                        &.{ .{ .int = 3 }, .{ .str = "Giggling; Wisdom save or incapacitated and movement is random until the start of your next turn." } },
                        &.{ .{ .int = 4 }, .{ .str = "Floating molasses makes the cube difficult terrain until the start of your next turn." } },
                    },
                },
                .heading = "Mischievous Surge",
                .desc = "The d4 result determines the current effect.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const nystuls_magic_aura: Spell = Spell.compInit(
    "Nystul's Magic Aura",
    .phb14,
    .level_2,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small square of silk" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Mask a creature or object's magical information from divination.",
    .{
        .desc = "Place an illusory aura on a willing creature or object.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "False Aura",
                .desc = "Change how the target appears to spells and magical effects that detect magical auras, including making a nonmagical object appear magical or changing an apparent school of magic.",
            },
            .{
                .table = null,
                .heading = "Mask",
                .desc = "Change how the target is detected by effects that sense creature types, including presenting it as another creature type or alignment for those detections.",
            },
            .{
                .table = null,
                .heading = "Permanence",
                .desc = "If you cast this spell on the same target every day for 30 days with the same effect, that effect lasts until dispelled.",
            },
        },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const pass_without_trace: Spell = Spell.compInit(
    "Pass Without Trace",
    .phb14,
    .level_2,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot aura around you" },
    .{ .v = true, .s = true, .m = true, .m_brief = "ashes from a burned leaf of mistletoe and a sprig of spruce" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Give nearby creatures +10 Stealth and prevent ordinary tracking.",
    .{ .desc = "A veil of shadow and silence extends from you. Chosen creatures within 30 feet, including you, gain +10 to Dexterity (Stealth) checks and cannot be tracked except by magical means; they leave no tracks or other traces.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    &.{pass_without_trace_stealth},
);

pub const phantasmal_force: Spell = Spell.compInit(
    "Phantasmal Force",
    .phb14,
    .level_2,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = "illusion fits within a 10-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of fleece" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a convincing personal illusion in one creature's mind.",
    .{
        .desc = "A creature makes an Intelligence save. On a failure, it perceives a phantasm of your design that fits within a 10-foot cube and rationalizes contradictions.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Illusion",
                .desc = "Only the target perceives the phantasm, which can include sounds, temperature, and other sensory details.",
            },
            .{
                .table = null,
                .heading = "Investigation",
                .desc = "The target can use its action to examine the phantasm with an Intelligence (Investigation) check against your spell save DC, ending the spell on a success.",
            },
            .{
                .table = null,
                .heading = "Belief",
                .desc = "Until it succeeds, the target treats the phantasm as real and explains away impossible interactions.",
            },
            .{
                .table = null,
                .heading = "Damage",
                .desc = "If the phantasm represents a damaging hazard or creature, it can deal 1d6 psychic damage to the target at the end of each of your turns while the target is within the perceived threat area.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    &.{roll_1d6},
    null,
);

pub const prayer_of_healing: Spell = Spell.compInit(
    "Prayer of Healing",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Heal up to six visible creatures after a 10-minute prayer.",
    .{ .desc = "Up to six creatures you can see within range each regain 2d8 + your spellcasting ability modifier hit points. Undead and constructs are unaffected.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Healing becomes 3d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Healing becomes 4d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Healing becomes 5d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Healing becomes 6d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Healing becomes 7d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Healing becomes 8d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Healing becomes 9d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8_plus_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric
    &.{roll_2d8_plus_spell_mod},
    null,
);

pub const protection_from_poison: Spell = Spell.compInit(
    "Protection from Poison",
    .phb14,
    .level_2,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Neutralize one poison and protect a creature against poison.",
    .{ .desc = "Touch a creature. If poisoned, one poison affecting it is neutralized. For the duration the target has advantage on saving throws against poison and resistance to poison damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Druid, Paladin, Ranger
    null,
    null,
);

pub const pyrotechnics: Spell = Spell.compInit(
    "Pyrotechnics",
    .xge,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = "choose a nonmagical flame that fits within a 5-foot cube" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Transform a nonmagical flame into fireworks or smoke.",
    .{
        .desc = "Choose a nonmagical flame you can see that fits within a 5-foot cube. The flame is extinguished and you choose one effect.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Fireworks",
                .desc = "Creatures within 10 feet of the flame make Constitution saves or become blinded until the end of your next turn.",
            },
            .{
                .table = null,
                .heading = "Smoke",
                .desc = "Thick smoke fills a 20-foot-radius sphere, spreads around corners, and heavily obscures the area for 1 minute or until dispersed by a strong wind.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    null,
    null,
);

pub const ray_of_enfeeblement: Spell = Spell.compInit(
    "Ray of Enfeeblement",
    .phb14,
    .level_2,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Weaken a creature's Strength-based weapon damage.",
    .{ .desc = "Make a ranged spell attack. On a hit, the target deals only half damage with weapon attacks that use Strength until the spell ends. At the end of each of its turns it can make a Constitution save, ending the spell on a success.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const rimes_binding_ice: Spell = Spell.compInit(
    "Rime's Binding Ice",
    .ftd,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "30-foot cone" },
    .{ .v = false, .s = true, .m = true, .m_brief = "a vial of meltwater" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast a cone with freezing energy that can immobilize creatures.",
    .{ .desc = "Creatures in a 30-foot cone make Constitution saves. On a failure a creature takes 3d8 cold damage and is hindered by ice, reducing its speed to 0 until it or another creature uses an action to break the ice. On a success it takes half damage and suffers no restraint from the ice.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
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
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_3d8},
    null,
);

pub const rope_trick: Spell = Spell.compInit(
    "Rope Trick",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "powdered corn extract and a twisted loop of parchment" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create an extradimensional hiding space at the top of a rope.",
    .{
        .desc = "Touch a rope up to 60 feet long. One end rises until the rope hangs vertically, opening an invisible extradimensional entrance at its upper end.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Space",
                .desc = "Up to eight Medium or smaller creatures can fit inside. Creatures in the space can see out through a 3-by-5-foot window.",
            },
            .{
                .table = null,
                .heading = "Barrier",
                .desc = "Attacks and spells cannot cross the entrance, though occupants can pull the rope into the space.",
            },
            .{
                .table = null,
                .heading = "Ending",
                .desc = "Anything still inside falls out when the spell ends.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const scorching_ray: Spell = Spell.compInit(
    "Scorching Ray",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Fire three independently targeted rays of flame.",
    .{ .desc = "Create three rays and make a ranged spell attack for each. Each ray deals 2d6 fire damage on a hit; the rays can target one creature or several.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Create 4 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Create 5 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Create 6 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Create 7 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create 8 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create 9 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create 10 rays, each dealing 2d6 fire damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6, roll_2d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_2d6, roll_2d6, roll_2d6 },
    null,
);

pub const see_invisibility: Spell = Spell.compInit(
    "See Invisibility",
    .phb14,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of talc and a small sprinkling of powdered silver" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "See invisible creatures and objects and perceive into the Ethereal Plane.",
    .{ .desc = "For the duration, you see invisible creatures and objects as though visible, and you can see into the Ethereal Plane. Ethereal creatures and objects appear ghostly and translucent.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    null,
    null,
);

pub const shadow_blade: Spell = Spell.compInit(
    "Shadow Blade",
    .xge,
    .level_2,
    .illusion,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "created weapon has thrown range 20/60" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a finesse, light, thrown shadow weapon dealing psychic damage.",
    .{ .desc = "Form a sword of solidified shadow. It is a simple melee weapon you are proficient with, has finesse, light, and thrown (20/60), and deals 2d8 psychic damage. Attacks with it have advantage against targets in dim light or darkness. If dropped or thrown it dissipates at turn's end; you can recreate it with a bonus action.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage remains 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage remains 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage remains 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage remains 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_2d8},
    null,
);

pub const shatter: Spell = Spell.compInit(
    "Shatter",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "10-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a chip of mica" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Detonate a loud burst of thunder in an area.",
    .{ .desc = "Creatures in a 10-foot-radius sphere make Constitution saves, taking 3d8 thunder damage on a failure or half on a success. Creatures made of inorganic material have disadvantage. Unattended nonmagical objects in the area also take the damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
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
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_3d8},
    null,
);

pub const silence: Spell = Spell.compInit(
    "Silence",
    .phb14,
    .level_2,
    .illusion,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create an area where no sound can exist.",
    .{ .desc = "A 20-foot-radius sphere becomes completely silent. Sound cannot be created within or pass through it; creatures inside are immune to thunder damage, are effectively deafened, and cannot cast spells requiring verbal components.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Ranger
    null,
    null,
);

pub const skywrite: Spell = Spell.compInit(
    "Skywrite",
    .xge,
    .level_2,
    .transmutation,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "range: sight" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Write up to ten words in clouds where they remain visible for hours.",
    .{ .desc = "Choose a part of the sky you can see. Up to ten words form from clouds and remain for the duration. A strong wind can disperse them early.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Druid, Wizard
    null,
    null,
);

pub const snillocs_snowball_swarm: Spell = Spell.compInit(
    "Snilloc's Snowball Swarm",
    .xge,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .sphere, .brief = "5-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a piece of ice or a small white rock chip" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Burst a small area with magical snowballs.",
    .{ .desc = "A flurry erupts in a 5-foot-radius sphere. Creatures there make Dexterity saves, taking 3d6 cold damage on a failure or half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_3d6},
    null,
);

pub const spider_climb: Spell = Spell.compInit(
    "Spider Climb",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of bitumen and a spider" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Let a willing creature climb walls and ceilings without using its hands.",
    .{ .desc = "A willing creature gains a climbing speed equal to its walking speed and can move along vertical surfaces and ceilings while keeping its hands free.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const spike_growth: Spell = Spell.compInit(
    "Spike Growth",
    .phb14,
    .level_2,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .radius, .brief = "20-foot-radius area" },
    .{ .v = true, .s = true, .m = true, .m_brief = "seven sharp thorns or seven small twigs, each sharpened to a point" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Camouflage a field of spikes that damages creatures moving through it.",
    .{ .desc = "The ground in a 20-foot radius twists into hidden spikes and becomes difficult terrain. A creature moving through the area takes 2d4 piercing damage for every 5 feet traveled. Creatures that did not see the spell cast may need a Wisdom (Perception) check against your spell save DC to recognize the hazard.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    &.{roll_2d4},
    null,
);

pub const spiritual_weapon: Spell = Spell.compInit(
    "Spiritual Weapon",
    .phb14,
    .level_2,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create a spectral weapon that attacks as a bonus action.",
    .{ .desc = "A floating spectral weapon appears within range. When cast, and as a bonus action on later turns, you can move it up to 20 feet and make a melee spell attack against a creature within 5 feet of it. A hit deals 1d8 + your spellcasting ability modifier force damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage remains 1d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_1d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 2d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage remains 2d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 3d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage remains 3d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 4d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage remains 4d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8_plus_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric
    &.{roll_1d8_plus_spell_mod},
    null,
);

pub const spray_of_cards: Spell = Spell.compInit(
    "Spray Of Cards",
    .bmt,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "15-foot cone" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a deck of cards" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Spray spectral cards that deal force damage and can blind creatures.",
    .{ .desc = "Spectral cards fill a 15-foot cone. Each creature makes a Dexterity save. On a failure it takes 2d10 force damage and is blinded until the end of its next turn; on a success it takes half damage and is not blinded.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
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
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_2d10},
    null,
);

pub const suggestion: Spell = Spell.compInit(
    "Suggestion",
    .phb14,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = true, .m_brief = "a snake's tongue and either a bit of honeycomb or a drop of sweet oil" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = true, .special = false, .brief = null },
    "Magically influence a creature with a reasonable-sounding course of action.",
    .{
        .desc = "Speak a brief course of activity to a creature that can hear and understand you. A target that fails a Wisdom save pursues the suggestion to the best of its ability.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Requirement",
                .desc = "The wording must sound reasonable; obviously harmful instructions cause the spell to fail.",
            },
            .{
                .table = null,
                .heading = "Duration",
                .desc = "The spell ends when the suggested activity is completed, when the duration expires, or earlier if the activity can be completed sooner.",
            },
            .{
                .table = null,
                .heading = "Ending",
                .desc = "The effect also ends if you or your companions damage the target.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const summon_beast: Spell = Spell.compInit(
    "Summon Beast",
    .tce,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a feather, tuft of fur, and fish tail inside a gilded acorn worth at least 200 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon an allied Bestial Spirit whose statistics scale with slot level.",
    .{
        .desc = "A Small bestial spirit appears in an unoccupied space and uses the Bestial Spirit statistics. Choose Air, Land, or Water; the environment determines movement and traits. It shares your initiative, acts immediately after you, obeys verbal commands, and otherwise Dodges.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Ability", "Score" },
                    .table_entry = &.{
                        &.{ .{ .str = "STR" }, .{ .str = "18 (+4)" } },
                        &.{ .{ .str = "DEX" }, .{ .str = "11 (+0)" } },
                        &.{ .{ .str = "CON" }, .{ .str = "16 (+3)" } },
                        &.{ .{ .str = "INT" }, .{ .str = "4 (-3)" } },
                        &.{ .{ .str = "WIS" }, .{ .str = "14 (+2)" } },
                        &.{ .{ .str = "CHA" }, .{ .str = "5 (-3)" } },
                    },
                },
                .heading = "Ability Scores",
                .desc = "The spirit uses fixed ability scores.",
            },
            .{
                .table = .{
                    .headings = &.{ "Environment", "Movement / Trait" },
                    .table_entry = &.{
                        &.{ .{ .str = "Air" }, .{ .str = "Fly 60 ft.; Flyby; 20 base hit points." } },
                        &.{ .{ .str = "Land" }, .{ .str = "Climb 30 ft.; Pack Tactics; 30 base hit points." } },
                        &.{ .{ .str = "Water" }, .{ .str = "Swim 30 ft.; Pack Tactics and Water Breathing; 30 base hit points." } },
                    },
                },
                .heading = "Environment",
                .desc = "All forms have 30-foot walking speed; the environment adds the listed movement and traits.",
            },
            .{
                .table = null,
                .heading = "Base Statistics",
                .desc = "At 2nd level: AC 13; Air has 20 hit points; Land and Water have 30. Darkvision 60 feet, passive Perception 12, proficiency bonus equal to yours, and it understands your languages.",
            },
            .{
                .table = null,
                .heading = "Actions",
                .desc = "Multiattack makes floor(spell level / 2) Maul attacks. Maul uses your spell attack modifier to hit, reaches 5 feet, and deals 1d8 + 4 + spell level piercing damage.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Bestial Spirit: AC 14; Air HP 25; Land/Water HP 35; Multiattack 1; Maul deals 1d8 + 7 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{roll_1d8_plus_7},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Bestial Spirit: AC 15; Air HP 30; Land/Water HP 40; Multiattack 2; Maul deals 1d8 + 8 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_8, roll_1d8_plus_8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Bestial Spirit: AC 16; Air HP 35; Land/Water HP 45; Multiattack 2; Maul deals 1d8 + 9 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_9, roll_1d8_plus_9 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Bestial Spirit: AC 17; Air HP 40; Land/Water HP 50; Multiattack 3; Maul deals 1d8 + 10 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_10, roll_1d8_plus_10, roll_1d8_plus_10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Bestial Spirit: AC 18; Air HP 45; Land/Water HP 55; Multiattack 3; Maul deals 1d8 + 11 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_11, roll_1d8_plus_11, roll_1d8_plus_11 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Bestial Spirit: AC 19; Air HP 50; Land/Water HP 60; Multiattack 4; Maul deals 1d8 + 12 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12, roll_1d8_plus_12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Bestial Spirit: AC 20; Air HP 55; Land/Water HP 65; Multiattack 4; Maul deals 1d8 + 13 piercing damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_13, roll_1d8_plus_13, roll_1d8_plus_13, roll_1d8_plus_13 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (Druid/Ranger optional only)
    &.{roll_1d8_plus_6},
    null,
);

pub const tashas_mind_whip: Spell = Spell.compInit(
    "Tasha's Mind Whip",
    .tce,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Deal psychic damage and restrict a creature's next turn.",
    .{ .desc = "A creature makes an Intelligence save. On a failure it takes 3d6 psychic damage, cannot take a reaction until the end of its next turn, and on its next turn can take only one of an action, bonus action, or movement. On a success it takes half damage and suffers no other effect.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 2 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 3 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 4 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 5 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 6 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 7 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 8 targets; each takes 3d6 psychic damage on a failed save.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (Sorcerer/Wizard optional only)
    &.{roll_3d6},
    null,
);

pub const vortex_warp: Spell = Spell.compInit(
    "Vortex Warp",
    .scc,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Teleport another creature between two spaces you can see.",
    .{ .desc = "Twist space around a creature you can see. The target makes a Constitution save, which it can choose to fail. On a failure, teleport it to an unoccupied space you can see within range that can support it without squeezing.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Range increases to 120 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Range increases to 150 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Range increases to 180 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Range increases to 210 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Range increases to 240 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Range increases to 270 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Range increases to 300 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    null,
);

pub const warding_bond: Spell = Spell.compInit(
    "Warding Bond",
    .phb14,
    .level_2,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pair of platinum rings worth at least 50 gp each, worn by you and the target for the duration" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Bond yourself to a willing creature, improving its defenses while sharing its damage.",
    .{ .desc = "While the target remains within 60 feet, it gains +1 AC, +1 to saving throws, and resistance to all damage. Whenever it takes damage, you take the same amount. The spell ends if distance, hit points, or another warding bond breaks the connection.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    null,
    &.{ warding_bond_ac, warding_bond_save },
);

pub const warding_wind: Spell = Spell.compInit(
    "Warding Wind",
    .xge,
    .level_2,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "10-foot-radius wind centered on you" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Surround yourself with a strong defensive wind.",
    .{
        .desc = "A strong wind surrounds you in a 10-foot radius and moves with you.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Hearing",
                .desc = "The roaring wind deafens you and other creatures in its area.",
            },
            .{
                .table = null,
                .heading = "Flames",
                .desc = "It extinguishes unprotected flames of torch size or smaller.",
            },
            .{
                .table = null,
                .heading = "Gases",
                .desc = "It hedges out vapor, gas, and fog that can be dispersed by strong wind.",
            },
            .{
                .table = null,
                .heading = "Ranged Attacks",
                .desc = "Ranged weapon attacks passing through the wind have disadvantage.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "The area is difficult terrain for creatures other than you.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Druid, Sorcerer, Wizard
    null,
    null,
);

pub const warp_sense: Spell = Spell.compInit(
    "Warp Sense",
    .paitm,
    .level_2,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "detects portals within 30 feet" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a razorvine leaf" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Sense nearby portals and study their destinations and keys.",
    .{
        .desc = "You sense active or inactive portals within 30 feet.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Detection",
                .desc = "You know when a portal is nearby even if it is inactive.",
            },
            .{
                .table = null,
                .heading = "Study",
                .desc = "As an action, study a detected portal and make a DC 15 check using your spellcasting ability. On a success you learn its destination plane and required key, then the spell ends. On a failure you learn nothing and cannot study that portal again with this casting.",
            },
            .{
                .table = null,
                .heading = "Barriers",
                .desc = "The sense penetrates most barriers but is blocked by 1 foot of stone, 1 inch of common metal, a thin sheet of lead, or 3 feet of wood or dirt.",
            },
        },
    },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const web: Spell = Spell.compInit(
    "Web",
    .phb14,
    .level_2,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "20-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of spiderweb" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Fill an area with sticky webs that restrain creatures and can burn.",
    .{
        .desc = "Conjure thick webs in a 20-foot cube. The area is lightly obscured and difficult terrain.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Anchoring",
                .desc = "If the webs are not anchored between solid masses or layered across a surface, they collapse at the start of your next turn and the spell ends.",
            },
            .{
                .table = null,
                .heading = "Restraint",
                .desc = "A creature entering the webs for the first time on a turn or starting there makes a Dexterity save or becomes restrained.",
            },
            .{
                .table = null,
                .heading = "Escape",
                .desc = "A restrained creature can use its action to make a Strength check against your spell save DC, escaping on a success.",
            },
            .{
                .table = null,
                .heading = "Fire",
                .desc = "Webs are flammable. A 5-foot cube exposed to fire burns away in 1 round and deals 2d4 fire damage to creatures starting their turn in that fire.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    &.{roll_2d4},
    null,
);

pub const wither_and_bloom: Spell = Spell.compInit(
    "Wither and Bloom",
    .scc,
    .level_2,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "10-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a withered vine twisted into a loop" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Damage chosen creatures with necrotic energy while letting one creature spend Hit Dice to heal.",
    .{
        .desc = "Death and life energy fill a 10-foot-radius sphere.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Damage",
                .desc = "Chosen creatures make Constitution saves, taking 2d6 necrotic damage on a failure or half on a success. Nonmagical vegetation in the area withers.",
            },
            .{
                .table = null,
                .heading = "Healing",
                .desc = "One creature in the area can spend one unspent Hit Die, roll it, and regain hit points equal to the roll plus your spellcasting ability modifier.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 3d6; the chosen creature can spend up to 2 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d6; the chosen creature can spend up to 3 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 5d6; the chosen creature can spend up to 4 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 6d6; the chosen creature can spend up to 5 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 7d6; the chosen creature can spend up to 6 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 8d6; the chosen creature can spend up to 7 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 9d6; the chosen creature can spend up to 8 Hit Dice for the healing roll.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_2d6},
    null,
);

pub const zone_of_truth: Spell = Spell.compInit(
    "Zone of Truth",
    .phb14,
    .level_2,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "15-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Create an area where failed-save creatures cannot knowingly lie.",
    .{
        .desc = "A 15-foot-radius sphere becomes a zone of truth.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Effect",
                .desc = "A creature entering the area for the first time on a turn or starting its turn there makes a Charisma save. On a failure, it cannot speak a deliberate lie while in the zone.",
            },
            .{
                .table = null,
                .heading = "Awareness",
                .desc = "You know whether each creature succeeds or fails, and affected creatures know they are under the spell. They can avoid answering, be evasive, or phrase truthful statements misleadingly.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Cleric, Paladin
    null,
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_2_spell_arr = [_]Spell{
    aganazzars_scorcher,
    aid,
    air_bubble,
    alter_self,
    animal_messenger,
    arcane_lock,
    augury,
    barkskin,
    beast_sense,
    blindness_deafness,
    blur,
    borrowed_knowledge,
    branding_smite,
    calm_emotions,
    cloud_of_daggers,
    continual_flame,
    cordon_of_arrows,
    crown_of_madness,
    darkness,
    darkvision,
    detect_thoughts,
    dragons_breath,
    dust_devil,
    earthbind,
    enhance_ability,
    enlarge_reduce,
    enthrall,
    find_steed,
    find_traps,
    flame_blade,
    flaming_sphere,
    flock_of_familiars,
    gentle_repose,
    gift_of_gab,
    gust_of_wind,
    healing_spirit,
    heat_metal,
    hold_person,
    invisibility,
    jims_glowing_coin,
    kinetic_jaunt,
    knock,
    lesser_restoration,
    levitate,
    locate_animals_or_plants,
    locate_object,
    magic_mouth,
    magic_weapon,
    maximillians_earthen_grasp,
    melfs_acid_arrow,
    mind_spike,
    mirror_image,
    misty_step,
    moonbeam,
    nathairs_mischief,
    nystuls_magic_aura,
    pass_without_trace,
    phantasmal_force,
    prayer_of_healing,
    protection_from_poison,
    pyrotechnics,
    ray_of_enfeeblement,
    rimes_binding_ice,
    rope_trick,
    scorching_ray,
    see_invisibility,
    shadow_blade,
    shatter,
    silence,
    skywrite,
    snillocs_snowball_swarm,
    spider_climb,
    spike_growth,
    spiritual_weapon,
    spray_of_cards,
    suggestion,
    summon_beast,
    tashas_mind_whip,
    vortex_warp,
    warding_bond,
    warding_wind,
    warp_sense,
    web,
    wither_and_bloom,
    zone_of_truth,
};

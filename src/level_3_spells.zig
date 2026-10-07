const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 3 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// the non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_10d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d10 } }, .negative = false },
    },
};

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

const roll_11d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_11d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_12d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_12d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_12d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_13d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 13, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_14d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_1d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_1d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_1d12_plus_10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 10 }, .negative = false },
    },
};

const roll_1d12_plus_11: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 11 }, .negative = false },
    },
};

const roll_1d12_plus_12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 12 }, .negative = false },
    },
};

const roll_1d12_plus_6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 6 }, .negative = false },
    },
};

const roll_1d12_plus_7: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 7 }, .negative = false },
    },
};

const roll_1d12_plus_8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 8 }, .negative = false },
    },
};

const roll_1d12_plus_9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
        .{ .roll = .{ .flat = 9 }, .negative = false },
    },
};

const roll_1d20: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d20 } }, .negative = false },
    },
};

const roll_1d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_1d4_plus_3: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 3 }, .negative = false },
    },
};

const roll_1d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_1d6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_1d6_plus_10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 10 }, .negative = false },
    },
};

const roll_1d6_plus_11: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 11 }, .negative = false },
    },
};

const roll_1d6_plus_12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 12 }, .negative = false },
    },
};

const roll_1d6_plus_6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 6 }, .negative = false },
    },
};

const roll_1d6_plus_7: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 7 }, .negative = false },
    },
};

const roll_1d6_plus_8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 8 }, .negative = false },
    },
};

const roll_1d6_plus_9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 9 }, .negative = false },
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

const roll_2d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_2d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_2d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_2d4_plus_10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 10 }, .negative = false },
    },
};

const roll_2d4_plus_11: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 11 }, .negative = false },
    },
};

const roll_2d4_plus_12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 12 }, .negative = false },
    },
};

const roll_2d4_plus_6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 6 }, .negative = false },
    },
};

const roll_2d4_plus_7: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 7 }, .negative = false },
    },
};

const roll_2d4_plus_8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 8 }, .negative = false },
    },
};

const roll_2d4_plus_9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 9 }, .negative = false },
    },
};

const roll_2d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_3d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_3d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_3d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_3d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_4d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_4d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_4d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_4d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_5d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_5d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_5d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_5d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_6d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_6d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_6d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_6d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_7d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_7d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_7d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_7d4_plus_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_8d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_8d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d12 } }, .negative = false },
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

const roll_9d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_9d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d12 } }, .negative = false },
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

const roll_fey_short_sword_level3: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 6 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_fey_short_sword_level4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 7 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_fey_short_sword_level5: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 8 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_fey_short_sword_level6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 9 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_fey_short_sword_level7: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 10 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_fey_short_sword_level8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 11 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_fey_short_sword_level9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
        .{ .roll = .{ .flat = 12 }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

// ============================================================================
// Shared modifiers
// ============================================================================

const ashardalon_speed_20: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 20 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 20 feet.",
    .amount = 20,
};

const ashardalon_speed_25: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 25 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 25 feet.",
    .amount = 25,
};

const ashardalon_speed_30: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 30 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 30 feet.",
    .amount = 30,
};

const ashardalon_speed_35: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 35 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 35 feet.",
    .amount = 35,
};

const ashardalon_speed_40: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 40 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 40 feet.",
    .amount = 40,
};

const ashardalon_speed_45: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 45 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 45 feet.",
    .amount = 45,
};

const ashardalon_speed_50: modifier.Modifier = .{
    .name = "Ashardalon's Stride speed increase of 50 feet",
    .modifier = .{ .bonus = .speed },
    .brief = "Ashardalon's Stride speed increase of 50 feet.",
    .amount = 50,
};

const elemental_weapon_attack_1: modifier.Modifier = .{
    .name = "Elemental Weapon attack bonus of +1",
    .modifier = .{ .bonus = .weapon_attack },
    .brief = "Elemental Weapon attack bonus of +1.",
    .amount = 1,
};

const elemental_weapon_attack_2: modifier.Modifier = .{
    .name = "Elemental Weapon attack bonus of +2",
    .modifier = .{ .bonus = .weapon_attack },
    .brief = "Elemental Weapon attack bonus of +2.",
    .amount = 2,
};

const elemental_weapon_attack_3: modifier.Modifier = .{
    .name = "Elemental Weapon attack bonus of +3",
    .modifier = .{ .bonus = .weapon_attack },
    .brief = "Elemental Weapon attack bonus of +3.",
    .amount = 3,
};

const haste_ac: modifier.Modifier = .{
    .name = "Haste armor class bonus of +2",
    .modifier = .{ .bonus = .armor_class },
    .brief = "Haste armor class bonus of +2.",
    .amount = 2,
};

// ============================================================================
// Level 3 spells
// ============================================================================

pub const animate_dead: Spell = Spell.compInit(
    "Animate Dead",
    .phb14,
    .level_3,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = "1 minute" },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of blood, a piece of flesh, and a pinch of bone dust" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Animate a humanoid corpse or pile of bones as an undead servant.",
    .{
        .desc = "Raise a Small or Medium humanoid corpse as a zombie, or bones as a skeleton.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Commands",
                .desc = "You can use a bonus action to command undead created by this spell while they are within 60 feet. A command can apply to several controlled undead at once.",
            },
            .{
                .table = null,
                .heading = "Control",
                .desc = "Control lasts 24 hours. Recasting before control expires can reassert control over up to four undead instead of creating a new one.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Animate or reassert control over 2 additional undead beyond the base spell.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Animate or reassert control over 4 additional undead beyond the base spell.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Animate or reassert control over 6 additional undead beyond the base spell.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Animate or reassert control over 8 additional undead beyond the base spell.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Animate or reassert control over 10 additional undead beyond the base spell.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Animate or reassert control over 12 additional undead beyond the base spell.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Wizard
    null,
    null,
);

pub const antagonize: Spell = Spell.compInit(
    "Antagonize",
    .bmt,
    .level_3,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a playing card depicting a rogue" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Deal psychic damage and provoke a reaction attack.",
    .{ .desc = "One creature makes a Wisdom save. On a failure it takes 4d4 psychic damage and must use its reaction to make a melee attack against another creature you choose that it can reach. If it cannot, it has disadvantage on its next attack before your next turn. A successful save halves the damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d4.", .desc_fields = null },
            .dice_rolls = &.{roll_5d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 6d4.", .desc_fields = null },
            .dice_rolls = &.{roll_6d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 7d4.", .desc_fields = null },
            .dice_rolls = &.{roll_7d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 8d4.", .desc_fields = null },
            .dice_rolls = &.{roll_8d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 9d4.", .desc_fields = null },
            .dice_rolls = &.{roll_9d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 10d4.", .desc_fields = null },
            .dice_rolls = &.{roll_10d4},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_4d4},
    null,
);

pub const ashardalons_stride: Spell = Spell.compInit(
    "Ashardalon's Stride",
    .ftd,
    .level_3,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Increase your speed, avoid opportunity attacks, and burn nearby creatures as you move.",
    .{ .desc = "Your speed increases by 20 feet, movement does not provoke opportunity attacks, and a creature or unattended object takes 1d6 fire damage the first time each turn you move within 5 feet of it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Your speed bonus becomes 25 feet and the trail deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = &.{ashardalon_speed_25},
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Your speed bonus becomes 30 feet and the trail deals 3d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = &.{ashardalon_speed_30},
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Your speed bonus becomes 35 feet and the trail deals 4d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = &.{ashardalon_speed_35},
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Your speed bonus becomes 40 feet and the trail deals 5d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = &.{ashardalon_speed_40},
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Your speed bonus becomes 45 feet and the trail deals 6d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = &.{ashardalon_speed_45},
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Your speed bonus becomes 50 feet and the trail deals 7d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = &.{ashardalon_speed_50},
        },
    },
    &.{}, // Classes: Artificer, Ranger, Sorcerer, Wizard
    &.{roll_1d6},
    &.{ashardalon_speed_20},
);

pub const aura_of_vitality: Spell = Spell.compInit(
    "Aura of Vitality",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot-radius aura" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a healing aura and restore hit points with bonus actions.",
    .{ .desc = "A 30-foot aura moves with you. As a bonus action, choose one creature in the aura, including yourself, to regain 2d6 hit points.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{roll_2d6},
    null,
);

pub const beacon_of_hope: Spell = Spell.compInit(
    "Beacon of Hope",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Grant hope, stronger healing, and improved Wisdom and death saves.",
    .{ .desc = "Choose any number of creatures within range. Targets have advantage on Wisdom saves and death saves and regain the maximum possible hit points from healing.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const bestow_curse: Spell = Spell.compInit(
    "Bestow Curse",
    .phb14,
    .level_3,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Curse a creature with one of several harmful effects.",
    .{
        .desc = "A touched creature makes a Wisdom save. On a failure choose one curse.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Curse option", "Effect" },
                    .table_entry = &.{
                        &.{ .{ .str = "Ability" }, .{ .str = "Disadvantage on checks and saves with one chosen ability." } },
                        &.{ .{ .str = "Attacks" }, .{ .str = "Disadvantage on attack rolls against you." } },
                        &.{ .{ .str = "Action denial" }, .{ .str = "Wisdom save at start of turn; failure wastes the action." } },
                        &.{ .{ .str = "Necrotic" }, .{ .str = "Your attacks and spells deal an extra 1d8 necrotic damage." } },
                    },
                },
                .heading = "Curse Options",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Alternative Curses",
                .desc = "The GM can allow a different curse of comparable power.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Duration becomes concentration, up to 10 minutes.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Duration becomes 8 hours and no longer requires concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration is 8 hours and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes 24 hours and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration is 24 hours and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes until dispelled and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Wizard
    &.{roll_1d8},
    null,
);

pub const blinding_smite: Spell = Spell.compInit(
    "Blinding Smite",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower your next melee weapon hit with radiant damage and blindness.",
    .{ .desc = "The next melee weapon attack that hits during the spell deals an extra 3d8 radiant damage. The target makes a Constitution save or is blinded, repeating the save at the end of each of its turns.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{roll_3d8},
    null,
);

pub const blink: Spell = Spell.compInit(
    "Blink",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Repeatedly shift between the Material and Ethereal Planes.",
    .{
        .desc = "At the end of each turn, roll a d20. On 11 or higher you vanish to the Ethereal Plane until the start of your next turn, then return near where you disappeared.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Ethereal State",
                .desc = "While shifted, you can see and hear the plane you left only to 60 feet and normally interact only with creatures on the Ethereal Plane.",
            },
            .{
                .table = null,
                .heading = "Return",
                .desc = "You return to a visible unoccupied space within 10 feet, or the nearest available space if none exists.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    &.{roll_1d20},
    null,
);

pub const call_lightning: Spell = Spell.compInit(
    "Call Lightning",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cylinder, .brief = "storm cloud: 60-foot radius, 10 feet high" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create or control a storm cloud and repeatedly call down lightning.",
    .{
        .desc = "Choose a point under the cloud. Creatures within 5 feet of it make Dexterity saves, taking 3d10 lightning damage on a failure or half on a success. On later turns you can use your action to call another bolt.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Existing Storm",
                .desc = "When cast outdoors during stormy conditions, each bolt deals an additional 1d10 lightning damage.",
            },
        },
    },
    &.{
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
    &.{roll_3d10},
    null,
);

pub const catnap: Spell = Spell.compInit(
    "Catnap",
    .xge,
    .level_3,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = true, .m_brief = "a pinch of sand" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Put willing creatures into a brief magical sleep that grants a short rest.",
    .{ .desc = "Up to three willing creatures fall unconscious. Damage or an action used to wake a target ends the effect early. A creature that sleeps for the full duration gains a short rest and cannot benefit from this spell again until after a long rest.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    null,
    null,
);

pub const clairvoyance: Spell = Spell.compInit(
    "Clairvoyance",
    .phb14,
    .level_3,
    .divination,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .mile, .count = 1 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a focus worth at least 100 gp: a jeweled horn for hearing or a glass eye for seeing" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a remote sensor for sight or hearing.",
    .{ .desc = "Create an invisible sensor in a familiar or obvious location within range. Choose sight or hearing when cast and use that sense from the sensor's position; you can switch senses as an action.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Sorcerer, Wizard
    null,
    null,
);

pub const conjure_animals: Spell = Spell.compInit(
    "Conjure Animals",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon fey spirits in beast forms.",
    .{
        .desc = "Choose a summoning option; the spirits appear as beasts, are friendly, have their own group initiative, and obey verbal commands.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Option", "Creatures" },
                    .table_entry = &.{
                        &.{ .{ .str = "CR 2 or lower" }, .{ .str = "1 beast" } },
                        &.{ .{ .str = "CR 1 or lower" }, .{ .str = "2 beasts" } },
                        &.{ .{ .str = "CR 1/2 or lower" }, .{ .str = "4 beasts" } },
                        &.{ .{ .str = "CR 1/4 or lower" }, .{ .str = "8 beasts" } },
                    },
                },
                .heading = "Summoning Options",
                .desc = null,
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Twice as many creatures appear for the chosen option.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Twice as many creatures appear for the chosen option.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Three times as many creatures appear for the chosen option.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Three times as many creatures appear for the chosen option.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Four times as many creatures appear for the chosen option.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const conjure_barrage: Spell = Spell.compInit(
    "Conjure Barrage",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "60-foot cone" },
    .{ .v = true, .s = true, .m = true, .m_brief = "one piece of ammunition or a thrown weapon" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a 60-foot cone of duplicated ammunition or thrown weapons.",
    .{ .desc = "Creatures in the cone make Dexterity saves, taking 3d8 damage on a failure or half on a success. The damage type matches the ammunition or thrown weapon used as the component.", .desc_fields = null },
    null,
    &.{}, // Classes: Ranger
    &.{roll_3d8},
    null,
);

pub const counterspell: Spell = Spell.compInit(
    "Counterspell",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .reaction, .brief = "when you see a creature within 60 feet casting a spell" },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Interrupt another creature's spellcasting.",
    .{ .desc = "A spell of 3rd level or lower fails automatically. Against a higher-level spell, make a spellcasting-ability check against DC 10 + that spell's level.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Spells of 4th level or lower are countered automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Spells of 5th level or lower are countered automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Spells of 6th level or lower are countered automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Spells of 7th level or lower are countered automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Spells of 8th level or lower are countered automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Spells of 9th level or lower are countered automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const create_food_and_water: Spell = Spell.compInit(
    "Create Food and Water",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create enough food and water to sustain a group for a day.",
    .{ .desc = "Create 45 pounds of nourishing food and 30 gallons of clean water, enough for up to fifteen humanoids or five steeds for 24 hours.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Paladin
    null,
    null,
);

pub const crusaders_mantle: Spell = Spell.compInit(
    "Crusader's Mantle",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot-radius aura" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower nearby allies' weapon hits with radiant damage.",
    .{ .desc = "A 30-foot aura moves with you. Non-hostile creatures in the aura deal an extra 1d4 radiant damage whenever they hit with a weapon attack.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{roll_1d4},
    null,
);

pub const daylight: Spell = Spell.compInit(
    "Daylight",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .sphere, .brief = "60-foot-radius bright light; another 60 feet of dim light" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create a large sphere of bright magical light.",
    .{ .desc = "A bright 60-foot-radius sphere appears and sheds dim light for another 60 feet. It can be anchored to an object and can dispel overlapping magical darkness created by a spell of 3rd level or lower.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Druid, Paladin, Ranger, Sorcerer
    null,
    null,
);

pub const dispel_magic: Spell = Spell.compInit(
    "Dispel Magic",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "End spells affecting a creature, object, or magical effect.",
    .{ .desc = "Spells of 3rd level or lower on the target end automatically. For each higher-level spell, make a spellcasting-ability check against DC 10 + that spell's level.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Spells of 4th level or lower on the target end automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Spells of 5th level or lower on the target end automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Spells of 6th level or lower on the target end automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Spells of 7th level or lower on the target end automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Spells of 8th level or lower on the target end automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Spells of 9th level or lower on the target end automatically.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Cleric, Druid, Paladin, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const elemental_weapon: Spell = Spell.compInit(
    "Elemental Weapon",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Turn a nonmagical weapon magical and add elemental damage.",
    .{ .desc = "Choose acid, cold, fire, lightning, or thunder. The weapon gains +1 to attack rolls and deals an extra 1d4 damage of the chosen type on a hit.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The attack bonus becomes +2 and the extra damage becomes 2d4.", .desc_fields = null },
            .dice_rolls = &.{roll_2d4},
            .modifiers = &.{elemental_weapon_attack_2},
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The attack bonus is +2 and the extra damage is 2d4.", .desc_fields = null },
            .dice_rolls = &.{roll_2d4},
            .modifiers = &.{elemental_weapon_attack_2},
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The attack bonus becomes +3 and the extra damage becomes 3d4.", .desc_fields = null },
            .dice_rolls = &.{roll_3d4},
            .modifiers = &.{elemental_weapon_attack_3},
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The attack bonus is +3 and the extra damage is 3d4.", .desc_fields = null },
            .dice_rolls = &.{roll_3d4},
            .modifiers = &.{elemental_weapon_attack_3},
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The attack bonus is +3 and the extra damage is 3d4.", .desc_fields = null },
            .dice_rolls = &.{roll_3d4},
            .modifiers = &.{elemental_weapon_attack_3},
        },
    },
    &.{}, // Classes: Artificer, Paladin
    &.{roll_1d4},
    &.{elemental_weapon_attack_1},
);

pub const enemies_abound: Spell = Spell.compInit(
    "Enemies Abound",
    .xge,
    .level_3,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Make a creature unable to distinguish friend from foe.",
    .{ .desc = "A creature makes an Intelligence save; immunity to frightened causes automatic success. On a failure it treats all visible creatures as enemies, chooses targets randomly when required, and repeats the save whenever it takes damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const erupting_earth: Spell = Spell.compInit(
    "Erupting Earth",
    .xge,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "20-foot cube centered on a ground point" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a piece of obsidian" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast an area with earth and stone and leave difficult terrain.",
    .{ .desc = "Creatures in a 20-foot cube make Dexterity saves, taking 3d12 bludgeoning damage on a failure or half on a success. The ground becomes difficult terrain until cleared.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 4d12.", .desc_fields = null },
            .dice_rolls = &.{roll_4d12},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 5d12.", .desc_fields = null },
            .dice_rolls = &.{roll_5d12},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 6d12.", .desc_fields = null },
            .dice_rolls = &.{roll_6d12},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 7d12.", .desc_fields = null },
            .dice_rolls = &.{roll_7d12},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 8d12.", .desc_fields = null },
            .dice_rolls = &.{roll_8d12},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 9d12.", .desc_fields = null },
            .dice_rolls = &.{roll_9d12},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_3d12},
    null,
);

pub const fast_friends: Spell = Spell.compInit(
    "Fast Friends",
    .ai,
    .level_3,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm a humanoid into performing friendly services.",
    .{ .desc = "A humanoid that can see, hear, and understand you makes a Wisdom save. On a failure it is charmed and attempts requested services in a friendly manner. Harmful or conflicting tasks can allow another save; certainly lethal tasks end the spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "You can target 2 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "You can target 3 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "You can target 4 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "You can target 5 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "You can target 6 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "You can target 7 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Wizard
    null,
    null,
);

pub const fear: Spell = Spell.compInit(
    "Fear",
    .phb14,
    .level_3,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "30-foot cone" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a white feather or the heart of a hen" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Frighten creatures in a cone and force them to flee.",
    .{ .desc = "Creatures in the cone make Wisdom saves. Failed targets drop held objects, become frightened, and must Dash away by the safest available route while they can see you. They can repeat the save after ending a turn without line of sight to you.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const feign_death: Spell = Spell.compInit(
    "Feign Death",
    .phb14,
    .level_3,
    .necromancy,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of graveyard dirt" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Make a willing creature appear dead.",
    .{ .desc = "The target is indistinguishable from a corpse to outward inspection and status-detecting magic, is blinded and incapacitated with speed 0, resists all damage except psychic, and temporarily suppresses disease and poison.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Druid, Wizard
    null,
    null,
);

pub const fireball: Spell = Spell.compInit(
    "Fireball",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny ball of bat guano and sulfur" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Explode a point in flame.",
    .{ .desc = "Creatures in a 20-foot-radius explosion make Dexterity saves, taking 8d6 fire damage on a failure or half on a success. The fire spreads around corners and ignites unattended flammable objects.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 11d6.", .desc_fields = null },
            .dice_rolls = &.{roll_11d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 12d6.", .desc_fields = null },
            .dice_rolls = &.{roll_12d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 13d6.", .desc_fields = null },
            .dice_rolls = &.{roll_13d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 14d6.", .desc_fields = null },
            .dice_rolls = &.{roll_14d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_8d6},
    null,
);

pub const flame_arrows: Spell = Spell.compInit(
    "Flame Arrows",
    .xge,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Enchant ammunition in a quiver to deal extra fire damage.",
    .{ .desc = "A piece of ammunition drawn from the touched quiver deals an extra 1d6 fire damage on a hit. The spell ends after twelve pieces of ammunition have been drawn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 14 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 16 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 18 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 20 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 22 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 24 pieces of ammunition.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    &.{roll_1d6},
    null,
);

pub const fly: Spell = Spell.compInit(
    "Fly",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a wing feather from any bird" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Grant a willing creature a 60-foot flying speed.",
    .{ .desc = "A willing creature gains a flying speed of 60 feet. If the spell ends while it is aloft and it cannot otherwise stop the fall, it falls.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "You can target 2 willing creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "You can target 3 willing creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "You can target 4 willing creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "You can target 5 willing creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "You can target 6 willing creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "You can target 7 willing creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const galders_tower: Spell = Spell.compInit(
    "Galder's Tower",
    .llk,
    .level_3,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a fragment of stone, wood, or other building material" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Conjure a furnished two-story tower for 24 hours.",
    .{
        .desc = "Create a sturdy two-story tower; each story is 10 feet tall and up to 100 square feet. Choose a room type for each story.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Room Options",
                .desc = "Bedroom, study, dining space, lounge, washroom, observatory, or an unfurnished room.",
            },
            .{
                .table = null,
                .heading = "Permanence",
                .desc = "Recasting maintains it another 24 hours. Casting daily for one year at the same location and configuration makes the tower permanent.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The tower can have 3 stories.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The tower can have 4 stories.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The tower can have 5 stories.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The tower can have 6 stories.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The tower can have 7 stories.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The tower can have 8 stories.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const gaseous_form: Spell = Spell.compInit(
    "Gaseous Form",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of gauze and a wisp of smoke" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Turn a willing creature and its gear into a misty cloud.",
    .{ .desc = "The target gains a 10-foot flying speed, can pass through narrow openings and other creatures' spaces, resists nonmagical damage, and has advantage on Strength, Dexterity, and Constitution saves. Its options for interacting are severely limited while gaseous.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const glyph_of_warding: Spell = Spell.compInit(
    "Glyph of Warding",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = "explosive runes create a 20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "incense and powdered diamond worth at least 200 gp, which the spell consumes" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled or triggered" },
    "Inscribe a nearly invisible magical trigger that releases explosive energy or a stored spell.",
    .{
        .desc = "Inscribe a glyph on a surface or closable object. Moving it more than 10 feet from the casting location breaks the glyph.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Explosive Runes",
                .desc = "When triggered, creatures in a 20-foot-radius sphere make Dexterity saves against 5d8 acid, cold, fire, lightning, or thunder damage.",
            },
            .{
                .table = null,
                .heading = "Spell Glyph",
                .desc = "Store a prepared spell of 3rd level or lower that targets one creature or an area; it is cast when the glyph triggers.",
            },
            .{
                .table = null,
                .heading = "Trigger",
                .desc = "Define a trigger and optional refinements such as creature type, physical traits, alignment, or a password.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Explosive runes damage becomes 6d8, and a spell glyph can store a spell of up to 4th level.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Explosive runes damage becomes 7d8, and a spell glyph can store a spell of up to 5th level.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Explosive runes damage becomes 8d8, and a spell glyph can store a spell of up to 6th level.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Explosive runes damage becomes 9d8, and a spell glyph can store a spell of up to 7th level.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Explosive runes damage becomes 10d8, and a spell glyph can store a spell of up to 8th level.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Explosive runes damage becomes 11d8, and a spell glyph can store a spell of up to 9th level.", .desc_fields = null },
            .dice_rolls = &.{roll_11d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Cleric, Wizard
    &.{roll_5d8},
    null,
);

pub const haste: Spell = Spell.compInit(
    "Haste",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a shaving of licorice root" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Greatly accelerate a willing creature.",
    .{ .desc = "The target's speed doubles, it gains +2 AC, advantage on Dexterity saves, and one restricted additional action each turn. When the spell ends, lethargy prevents movement and actions until after the target's next turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    null,
    &.{haste_ac},
);

pub const hunger_of_hadar: Spell = Spell.compInit(
    "Hunger Of Hadar",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pickled octopus tentacle" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a sphere of supernatural darkness, cold, and grasping tentacles.",
    .{ .desc = "The sphere is difficult terrain, cannot be illuminated, and blinds creatures fully inside it. A creature starting its turn there takes 2d6 cold damage; one ending its turn there makes a Dexterity save or takes 2d6 acid damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock
    &.{ roll_2d6, roll_2d6 },
    null,
);

pub const hypnotic_pattern: Spell = Spell.compInit(
    "Hypnotic Pattern",
    .phb14,
    .level_3,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "30-foot cube" },
    .{ .v = false, .s = true, .m = true, .m_brief = "a glowing stick of incense or a crystal vial filled with phosphorescent material" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm and incapacitate creatures with a brief pattern of colors.",
    .{ .desc = "Creatures in the cube that see the pattern make Wisdom saves. Failed creatures are charmed, incapacitated, and have speed 0 until they take damage or another creature uses an action to shake them out of the stupor.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const incite_greed: Spell = Spell.compInit(
    "Incite Greed",
    .ai,
    .level_3,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a gem worth at least 50 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm creatures with a valuable gem and draw them toward you.",
    .{ .desc = "Choose any number of creatures that can see you. Failed Wisdom saves charm them; they can only use movement to approach safely and stop within 5 feet to stare at the gem. They repeat the save at the end of each turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const intellect_fortress: Spell = Spell.compInit(
    "Intellect Fortress",
    .tce,
    .level_3,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Protect a willing creature's mind.",
    .{ .desc = "One willing target gains resistance to psychic damage and advantage on Intelligence, Wisdom, and Charisma saving throws.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "You can target 2 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "You can target 3 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "You can target 4 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "You can target 5 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "You can target 6 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "You can target 7 creatures, all within 30 feet of one another.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer (all other listed classes optional)
    null,
    null,
);

pub const leomunds_tiny_hut: Spell = Spell.compInit(
    "Leomund's Tiny Hut",
    .phb14,
    .level_3,
    .evocation,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "10-foot-radius hemisphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small crystal bead" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Create an immobile protective dome for up to nine creatures.",
    .{ .desc = "A 10-foot-radius hemisphere appears around you and remains stationary. Up to nine Medium or smaller creatures can fit inside. Creatures and objects present when cast can pass through; others cannot. Spells and magical effects cannot extend through the dome.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const life_transference: Spell = Spell.compInit(
    "Life Transference",
    .xge,
    .level_3,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Damage yourself to heal another creature for twice the damage taken.",
    .{ .desc = "You take 4d8 necrotic damage that cannot be reduced. One visible creature within range regains hit points equal to twice that damage.", .desc_fields = null },
    &.{
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
    &.{}, // Classes: Cleric, Wizard
    &.{roll_4d8},
    null,
);

pub const lightning_arrow: Spell = Spell.compInit(
    "Lightning Arrow",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "the next ranged weapon attack creates a 10-foot splash" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Transform your next ranged weapon attack into lightning.",
    .{ .desc = "On the next ranged weapon attack, the target takes 4d8 lightning damage on a hit or half on a miss instead of normal weapon damage. Creatures within 10 feet make Dexterity saves against 2d8 lightning damage, taking half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Primary damage becomes 5d8 and splash damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d8, roll_3d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Primary damage becomes 6d8 and splash damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d8, roll_4d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Primary damage becomes 7d8 and splash damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d8, roll_5d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Primary damage becomes 8d8 and splash damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d8, roll_6d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Primary damage becomes 9d8 and splash damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_9d8, roll_7d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Primary damage becomes 10d8 and splash damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_10d8, roll_8d8 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Ranger
    &.{ roll_4d8, roll_2d8 },
    null,
);

pub const lightning_bolt: Spell = Spell.compInit(
    "Lightning Bolt",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .line, .brief = "100-foot-long, 5-foot-wide line" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of fur and a rod of amber, crystal, or glass" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Fire a line of lightning through creatures in front of you.",
    .{ .desc = "Creatures in a 100-foot-long, 5-foot-wide line make Dexterity saves, taking 8d6 lightning damage on a failure or half on a success. Unattended flammable objects ignite.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 11d6.", .desc_fields = null },
            .dice_rolls = &.{roll_11d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 12d6.", .desc_fields = null },
            .dice_rolls = &.{roll_12d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 13d6.", .desc_fields = null },
            .dice_rolls = &.{roll_13d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 14d6.", .desc_fields = null },
            .dice_rolls = &.{roll_14d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_8d6},
    null,
);

pub const magic_circle: Spell = Spell.compInit(
    "Magic Circle",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = .cylinder, .brief = "10-foot-radius, 20-foot-tall cylinder" },
    .{ .v = true, .s = true, .m = true, .m_brief = "holy water or powdered silver and iron worth at least 100 gp, which the spell consumes" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create a cylinder that wards against selected supernatural creature types.",
    .{
        .desc = "Choose celestials, elementals, fey, fiends, or undead. The circle can keep those creatures out or reverse its effects to keep one inside.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Ward",
                .desc = "Affected creatures cannot willingly cross the boundary by nonmagical means, have disadvantage on attacks against protected targets, and cannot charm, frighten, or possess protected targets.",
            },
            .{
                .table = null,
                .heading = "Teleportation",
                .desc = "Affected creatures cannot bypass the boundary with teleportation or planar travel unless they first succeed on a Charisma save.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Duration becomes 2 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Duration becomes 3 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Duration becomes 4 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Duration becomes 5 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Duration becomes 6 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes 7 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Paladin, Warlock, Wizard
    null,
    null,
);

pub const major_image: Spell = Spell.compInit(
    "Major Image",
    .phb14,
    .level_3,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "image fits within a 20-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of fleece" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a multisensory illusion no larger than a 20-foot cube.",
    .{ .desc = "Create an image with appropriate sight, sound, smell, and temperature. You can move it with an action while within range. Physical interaction reveals the illusion; an Intelligence (Investigation) check can also discern it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The image lasts until dispelled and no longer requires concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The image lasts until dispelled and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The image lasts until dispelled and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The image lasts until dispelled and does not require concentration.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const mass_healing_word: Spell = Spell.compInit(
    "Mass Healing Word",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Heal up to six visible creatures at range.",
    .{ .desc = "Up to six creatures regain 1d4 + your spellcasting ability modifier hit points. Undead and constructs are unaffected.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Healing becomes 2d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_2d4_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Healing becomes 3d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_3d4_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Healing becomes 4d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d4_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Healing becomes 5d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_5d4_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Healing becomes 6d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_6d4_plus_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Healing becomes 7d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_7d4_plus_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric
    &.{roll_1d4_plus_spell_mod},
    null,
);

pub const meld_into_stone: Spell = Spell.compInit(
    "Meld into Stone",
    .phb14,
    .level_3,
    .transmutation,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = "a small piece of granite" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Merge yourself and carried gear into a stone object or surface.",
    .{ .desc = "You step into stone large enough to contain your body and remain aware of time but mostly cut off from outside senses. Minor stone damage harms you; major destruction ejects you and can deal severe damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Druid
    null,
    null,
);

pub const melfs_minute_meteors: Spell = Spell.compInit(
    "Melf's Minute Meteors",
    .xge,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "meteors can be launched to points within 120 feet" },
    .{ .v = true, .s = true, .m = true, .m_brief = "niter, sulfur, and pine tar formed into a bead" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create six orbiting meteors that can be launched one or two at a time.",
    .{ .desc = "When cast and as a bonus action on later turns, expend one or two meteors. Each explodes at a chosen point within 120 feet; creatures within 5 feet make Dexterity saves against 2d6 fire damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Create 8 meteors; each still deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Create 10 meteors; each still deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Create 12 meteors; each still deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create 14 meteors; each still deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create 16 meteors; each still deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create 18 meteors; each still deals 2d6 fire damage.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_2d6},
    null,
);

pub const motivational_speech: Spell = Spell.compInit(
    "Motivational Speech",
    .ai,
    .level_3,
    .enchantment,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Bolster up to five listeners with temporary hit points and confidence.",
    .{ .desc = "Up to five creatures that can hear you gain 5 temporary hit points and advantage on Wisdom saves. After an affected creature is hit, it has advantage on its next attack roll. Losing the granted temporary hit points ends the spell for that creature.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Each target gains 10 temporary hit points.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Each target gains 15 temporary hit points.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Each target gains 20 temporary hit points.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Each target gains 25 temporary hit points.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Each target gains 30 temporary hit points.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Each target gains 35 temporary hit points.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric
    null,
    null,
);

pub const nondetection: Spell = Spell.compInit(
    "Nondetection",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of diamond dust worth 25 gp sprinkled over the target, which the spell consumes" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Hide a target from divination magic.",
    .{ .desc = "The willing target cannot be targeted by divination magic or perceived through magical scrying sensors for the duration.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Ranger, Wizard
    null,
    null,
);

pub const phantom_steed: Spell = Spell.compInit(
    "Phantom Steed",
    .phb14,
    .level_3,
    .illusion,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Conjure a fast quasi-real riding creature.",
    .{ .desc = "A Large horse-like creature appears, with AC 10, 13 hit points, and speed 100 feet. It can carry a rider and disappears when the spell ends or after taking damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const plant_growth: Spell = Spell.compInit(
    "Plant Growth",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = "or 8 hours for the enrichment use" },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .radius, .brief = "100-foot radius for overgrowth; half-mile radius for enrichment" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Cause rapid overgrowth or enrich plants for a year.",
    .{
        .desc = "Choose one of two uses.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Overgrowth",
                .desc = "With a 1-action casting, normal plants in a 100-foot radius become overgrown; movement costs 4 feet for every 1 foot, with any areas you choose excluded.",
            },
            .{
                .table = null,
                .heading = "Enrichment",
                .desc = "With an 8-hour casting, plants in a half-mile radius produce twice the normal amount of food for one year.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Druid, Ranger
    null,
    null,
);

pub const protection_from_energy: Spell = Spell.compInit(
    "Protection from Energy",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Grant resistance to one elemental damage type.",
    .{ .desc = "A willing creature gains resistance to acid, cold, fire, lightning, or thunder damage, chosen when the spell is cast.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const remove_curse: Spell = Spell.compInit(
    "Remove Curse",
    .phb14,
    .level_3,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "End curses affecting a creature or object.",
    .{ .desc = "All curses affecting a creature end. On a cursed magic item, the curse remains but its attunement to the creature is broken so it can be removed or discarded.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Paladin, Warlock, Wizard
    null,
    null,
);

pub const revivify: Spell = Spell.compInit(
    "Revivify",
    .phb14,
    .level_3,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "diamonds worth 300 gp, which the spell consumes" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Return a creature that died within the last minute to life.",
    .{ .desc = "A creature dead no longer than 1 minute returns with 1 hit point. The spell cannot restore missing body parts and cannot revive a creature that died of old age.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Paladin
    null,
    null,
);

pub const sending: Spell = Spell.compInit(
    "Sending",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "Unlimited range" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a short piece of fine copper wire" },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Send a short telepathic message to a familiar creature and receive an immediate reply.",
    .{ .desc = "Send up to twenty-five words to a familiar creature. It recognizes you if it knows you and can immediately answer similarly. Across planes, there is a 5 percent chance the message fails.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Wizard
    null,
    null,
);

pub const sleet_storm: Spell = Spell.compInit(
    "Sleet Storm",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .cylinder, .brief = "40-foot radius, 20 feet high" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of dust and a few drops of water" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a large storm of freezing rain and sleet.",
    .{ .desc = "The cylinder is heavily obscured, extinguishes exposed flames, and turns the ground to difficult terrain. Creatures entering or starting there make Dexterity saves or fall prone. Concentrating creatures make Constitution saves against your spell save DC.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

pub const slow: Spell = Spell.compInit(
    "Slow",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "40-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of molasses" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Slow up to six creatures in an area.",
    .{ .desc = "Choose up to six creatures in a 40-foot cube. Failed Wisdom saves halve speed, impose -2 AC and Dexterity saves, prevent reactions, and restrict actions. Spells with a 1-action casting time can be delayed until the next turn. Targets repeat the save at the end of each turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    null,
    null,
);

pub const speak_with_dead: Spell = Spell.compInit(
    "Speak with Dead",
    .phb14,
    .level_3,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "burning incense" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Ask up to five questions of a corpse.",
    .{ .desc = "A corpse with a mouth gains enough animation to answer five questions from knowledge it had in life. It cannot learn new information, speculate about future events, or be compelled to be truthful.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Wizard
    null,
    null,
);

pub const speak_with_plants: Spell = Spell.compInit(
    "Speak with Plants",
    .phb14,
    .level_3,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot radius" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Communicate with plants and influence nearby vegetation.",
    .{ .desc = "Plants within 30 feet gain limited sentience and can communicate about recent events. You can temporarily alter plant-based terrain between ordinary and difficult terrain, issue simple requests, and communicate with plant creatures.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid, Ranger
    null,
    null,
);

pub const spirit_guardians: Spell = Spell.compInit(
    "Spirit Guardians",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "15-foot radius" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a holy symbol" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Surround yourself with spirits that hinder enemies and deal radiant or necrotic damage.",
    .{ .desc = "Designated creatures are unaffected. Other creatures have halved speed in the area and make Wisdom saves when entering for the first time on a turn or starting there, taking 3d8 radiant or necrotic damage on a failure or half on a success.", .desc_fields = null },
    &.{
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
    &.{}, // Classes: Cleric
    &.{roll_3d8},
    null,
);

pub const spirit_shroud: Spell = Spell.compInit(
    "Spirit Shroud",
    .tce,
    .level_3,
    .necromancy,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "affects your attacks against creatures within 10 feet" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Surround yourself with spirits that empower your attacks.",
    .{ .desc = "Your attacks against creatures within 10 feet deal an extra 1d8 radiant, necrotic, or cold damage. A damaged creature cannot regain hit points until the start of your next turn, and chosen creatures starting within 10 feet have speed reduced by 10 feet.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Extra damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Extra damage is 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Extra damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Extra damage is 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Extra damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{roll_1d8},
    null,
);

pub const stinking_cloud: Spell = Spell.compInit(
    "Stinking Cloud",
    .phb14,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a rotten egg or several skunk cabbage leaves" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a heavily obscuring cloud of nauseating gas.",
    .{ .desc = "Creatures completely inside at the start of their turn make Constitution saves; failure consumes their action retching. Creatures that do not breathe or are immune to poison automatically succeed. Wind can disperse the cloud.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const summon_fey: Spell = Spell.compInit(
    "Summon Fey",
    .tce,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a gilded flower worth at least 300 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a fey spirit whose statistics scale with slot level.",
    .{
        .desc = "A Small fey spirit appears and shares your initiative, acting immediately after you. Choose Fuming, Mirthful, or Tricksy to determine its Fey Step effect.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Form", "STR", "DEX", "CON", "INT", "WIS", "CHA" },
                    .table_entry = &.{
                        &.{ .{ .str = "Fey" }, .{ .str = "13" }, .{ .str = "16" }, .{ .str = "14" }, .{ .str = "14" }, .{ .str = "11" }, .{ .str = "16" } },
                    },
                },
                .heading = "Ability Scores",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Base Statistics",
                .desc = "At 3rd level: AC 15, 30 hit points, 40-foot speed, darkvision 60 feet, charm immunity, and proficiency bonus equal to yours.",
            },
            .{
                .table = null,
                .heading = "Attacks",
                .desc = "It makes floor(spell level / 2) Shortsword attacks. Each hit deals 1d6 + 3 + spell level piercing plus 1d6 force.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Fey Spirit: AC 16; HP 40; Multiattack 2; Shortsword deals 1d6 + 7 piercing plus 1d6 force damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_fey_short_sword_level4, roll_fey_short_sword_level4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Fey Spirit: AC 17; HP 50; Multiattack 2; Shortsword deals 1d6 + 8 piercing plus 1d6 force damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_fey_short_sword_level5, roll_fey_short_sword_level5 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Fey Spirit: AC 18; HP 60; Multiattack 3; Shortsword deals 1d6 + 9 piercing plus 1d6 force damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_fey_short_sword_level6, roll_fey_short_sword_level6, roll_fey_short_sword_level6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Fey Spirit: AC 19; HP 70; Multiattack 3; Shortsword deals 1d6 + 10 piercing plus 1d6 force damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_fey_short_sword_level7, roll_fey_short_sword_level7, roll_fey_short_sword_level7 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Fey Spirit: AC 20; HP 80; Multiattack 4; Shortsword deals 1d6 + 11 piercing plus 1d6 force damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_fey_short_sword_level8, roll_fey_short_sword_level8, roll_fey_short_sword_level8, roll_fey_short_sword_level8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Fey Spirit: AC 21; HP 90; Multiattack 4; Shortsword deals 1d6 + 12 piercing plus 1d6 force damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_fey_short_sword_level9, roll_fey_short_sword_level9, roll_fey_short_sword_level9, roll_fey_short_sword_level9 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{roll_fey_short_sword_level3},
    null,
);

pub const summon_lesser_demons: Spell = Spell.compInit(
    "Summon Lesser Demons",
    .xge,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a vial of blood from a humanoid killed within the past 24 hours" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a random group of hostile lesser demons.",
    .{
        .desc = "Roll a d6 to determine the group. The GM chooses the specific demons. They are hostile to all creatures and attack the nearest non-demons.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "d6", "Result" },
                    .table_entry = &.{
                        &.{ .{ .str = "1-2" }, .{ .str = "2 demons, CR 1 or lower" } },
                        &.{ .{ .str = "3-4" }, .{ .str = "4 demons, CR 1/2 or lower" } },
                        &.{ .{ .str = "5-6" }, .{ .str = "8 demons, CR 1/4 or lower" } },
                    },
                },
                .heading = "Summoning Table",
                .desc = null,
            },
            .{
                .table = null,
                .heading = "Blood Circle",
                .desc = "You can consume the blood component to create a protective circle in your space that the summoned demons cannot cross, harm, or target through.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Summon twice as many demons.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Summon twice as many demons.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Summon three times as many demons.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Summon three times as many demons.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const summon_shadowspawn: Spell = Spell.compInit(
    "Summon Shadowspawn",
    .tce,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "tears inside a crystal vial worth at least 300 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a shadow spirit whose form is Fury, Despair, or Fear.",
    .{
        .desc = "The spirit shares your initiative and obeys verbal commands. Its emotional form grants a distinct trait.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Forms",
                .desc = "Fury gains advantage against frightened creatures; Despair slows nearby creatures; Fear can Hide in dim light or darkness.",
            },
            .{
                .table = null,
                .heading = "Base Statistics",
                .desc = "At 3rd level: AC 14, 35 hit points, 40-foot speed, darkvision 120 feet, necrotic resistance, frightened immunity.",
            },
            .{
                .table = null,
                .heading = "Attack",
                .desc = "Multiattack makes floor(spell level / 2) Chilling Hand attacks; each deals 1d12 + 3 + spell level cold damage.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Shadow Spirit: AC 15; HP 50; Multiattack 2; Chilling Hand deals 1d12 + 7 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_7, roll_1d12_plus_7 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Shadow Spirit: AC 16; HP 65; Multiattack 2; Chilling Hand deals 1d12 + 8 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_8, roll_1d12_plus_8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Shadow Spirit: AC 17; HP 80; Multiattack 3; Chilling Hand deals 1d12 + 9 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_9, roll_1d12_plus_9, roll_1d12_plus_9 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Shadow Spirit: AC 18; HP 95; Multiattack 3; Chilling Hand deals 1d12 + 10 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_10, roll_1d12_plus_10, roll_1d12_plus_10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Shadow Spirit: AC 19; HP 110; Multiattack 4; Chilling Hand deals 1d12 + 11 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_11, roll_1d12_plus_11, roll_1d12_plus_11, roll_1d12_plus_11 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Shadow Spirit: AC 20; HP 125; Multiattack 4; Chilling Hand deals 1d12 + 12 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d12_plus_12, roll_1d12_plus_12, roll_1d12_plus_12, roll_1d12_plus_12 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{roll_1d12_plus_6},
    null,
);

pub const summon_undead: Spell = Spell.compInit(
    "Summon Undead",
    .tce,
    .level_3,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a gilded skull worth at least 300 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon an undead spirit in Ghostly, Putrid, or Skeletal form.",
    .{
        .desc = "The spirit shares your initiative and obeys verbal commands. Form determines special traits and attack type.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Forms",
                .desc = "Ghostly can pass through creatures and objects; Putrid has a poisoning aura and can paralyze poisoned targets; Skeletal uses a long-range grave bolt.",
            },
            .{
                .table = null,
                .heading = "Base Statistics",
                .desc = "At 3rd level: AC 14. Ghostly/Putrid have 30 hit points; Skeletal has 20. It is immune to necrotic and poison damage and several conditions.",
            },
            .{
                .table = null,
                .heading = "Attacks",
                .desc = "Multiattack makes floor(spell level / 2) attacks. Ghostly: 1d8 + 3 + spell level necrotic. Skeletal: 2d4 + 3 + spell level necrotic. Putrid: 1d6 + 3 + spell level slashing.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Undead Spirit: AC 15; Ghostly/Putrid HP 40; Skeletal HP 30; Multiattack 2; attack damage adds 7 after its dice.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_7, roll_2d4_plus_7, roll_1d6_plus_7 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Undead Spirit: AC 16; Ghostly/Putrid HP 50; Skeletal HP 40; Multiattack 2; attack damage adds 8 after its dice.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_8, roll_2d4_plus_8, roll_1d6_plus_8 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Undead Spirit: AC 17; Ghostly/Putrid HP 60; Skeletal HP 50; Multiattack 3; attack damage adds 9 after its dice.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_9, roll_2d4_plus_9, roll_1d6_plus_9 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Undead Spirit: AC 18; Ghostly/Putrid HP 70; Skeletal HP 60; Multiattack 3; attack damage adds 10 after its dice.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_10, roll_2d4_plus_10, roll_1d6_plus_10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Undead Spirit: AC 19; Ghostly/Putrid HP 80; Skeletal HP 70; Multiattack 4; attack damage adds 11 after its dice.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_11, roll_2d4_plus_11, roll_1d6_plus_11 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Undead Spirit: AC 20; Ghostly/Putrid HP 90; Skeletal HP 80; Multiattack 4; attack damage adds 12 after its dice.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8_plus_12, roll_2d4_plus_12, roll_1d6_plus_12 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: none (all listed classes are optional)
    &.{ roll_1d8_plus_6, roll_2d4_plus_6, roll_1d6_plus_6 },
    null,
);

pub const thunder_step: Spell = Spell.compInit(
    "Thunder Step",
    .xge,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = "teleport to a visible unoccupied space; explosion occurs at departure point" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Teleport and create a thunderous blast where you departed.",
    .{ .desc = "Teleport to a visible unoccupied space within range. Creatures within 10 feet of the space you left make Constitution saves, taking 3d10 thunder damage on a failure or half on a success. You can bring one willing nearby creature of your size or smaller.", .desc_fields = null },
    &.{
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
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_3d10},
    null,
);

pub const tidal_wave: Spell = Spell.compInit(
    "Tidal Wave",
    .xge,
    .level_3,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .line, .brief = "area up to 30 feet long, 10 feet wide, and 10 feet tall" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of water" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Crash a conjured wave over an area.",
    .{ .desc = "Creatures in the wave make Dexterity saves. On a failure they take 4d8 bludgeoning damage and fall prone; on a success they take half and remain standing. The water extinguishes nearby unprotected flames.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_4d8},
    null,
);

pub const tiny_servant: Spell = Spell.compInit(
    "Tiny Servant",
    .xge,
    .level_3,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Animate a Tiny nonmagical object as a construct servant.",
    .{
        .desc = "The object becomes a Tiny construct under your control. As a bonus action you can command servants within 120 feet; otherwise they only defend themselves.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Statistics",
                .desc = "AC 15; 10 hit points; speed 30 feet, climb 30 feet; blindsight 60 feet; immune to poison and psychic damage.",
            },
            .{
                .table = null,
                .heading = "Slam",
                .desc = "Melee attack +5 to hit; 1d4 + 3 bludgeoning damage.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Animate 3 Tiny objects.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_3},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Animate 5 Tiny objects.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_3},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Animate 7 Tiny objects.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_3},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Animate 9 Tiny objects.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_3},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Animate 11 Tiny objects.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_3},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Animate 13 Tiny objects.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_3},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Wizard
    &.{roll_1d4_plus_3},
    null,
);

pub const tongues: Spell = Spell.compInit(
    "Tongues",
    .phb14,
    .level_3,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = true, .m_brief = "a small clay model of a ziggurat" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Let a creature understand and be understood in spoken languages.",
    .{ .desc = "The target understands any spoken language it hears, and any creature that knows at least one language can understand the target's speech.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const vampiric_touch: Spell = Spell.compInit(
    "Vampiric Touch",
    .phb14,
    .level_3,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Make repeated melee spell attacks that drain life.",
    .{ .desc = "Make a melee spell attack. On a hit the target takes 3d6 necrotic damage and you regain hit points equal to half the necrotic damage dealt. You can repeat the attack as an action on later turns.", .desc_fields = null },
    &.{
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
    &.{}, // Classes: Warlock, Wizard
    &.{roll_3d6},
    null,
);

pub const wall_of_sand: Spell = Spell.compInit(
    "Wall of Sand",
    .xge,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .line, .brief = "up to 30 feet long, 10 feet high, and 10 feet thick" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a handful of sand" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a thick wall of swirling sand.",
    .{ .desc = "The wall blocks line of sight but not movement. Creatures inside are blinded and must spend 3 feet of movement for every 1 foot traveled through it.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const wall_of_water: Spell = Spell.compInit(
    "Wall of Water",
    .xge,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .line, .brief = "30-by-10-by-1-foot wall, or ring up to 20 feet in diameter and 20 feet high" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of water" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a wall of water that hinders movement and attacks.",
    .{ .desc = "The wall is difficult terrain. Ranged weapon attacks entering it have disadvantage, and fire damage passing through is halved. Cold spells can freeze sections with AC 5 and 15 hit points.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

pub const water_breathing: Spell = Spell.compInit(
    "Water Breathing",
    .phb14,
    .level_3,
    .transmutation,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a short reed or piece of straw" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Allow up to ten willing creatures to breathe underwater.",
    .{ .desc = "Up to ten willing creatures you can see within range gain the ability to breathe underwater until the spell ends. Their normal respiration is unaffected.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const water_walk: Spell = Spell.compInit(
    "Water Walk",
    .phb14,
    .level_3,
    .transmutation,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a piece of cork" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Allow willing creatures to move across liquid surfaces as if solid.",
    .{ .desc = "Up to ten willing creatures can walk across liquids, snow, quicksand, lava, and similar surfaces. Creatures submerged when targeted rise toward the surface.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Druid, Ranger, Sorcerer
    null,
    null,
);

pub const wind_wall: Spell = Spell.compInit(
    "Wind Wall",
    .phb14,
    .level_3,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .line, .brief = "up to 50 feet long, 15 feet high, and 1 foot thick" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny fan and a feather of exotic origin" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Raise a wall of strong wind that damages creatures and blocks many projectiles.",
    .{ .desc = "Creatures in the wall when it appears make Strength saves, taking 3d8 bludgeoning damage on a failure or half on a success. The wall disperses gases, blocks Small or smaller flying creatures and loose materials, and deflects ordinary arrows and bolts.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    &.{roll_3d8},
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_3_spell_arr = [_]Spell{
    animate_dead,
    antagonize,
    ashardalons_stride,
    aura_of_vitality,
    beacon_of_hope,
    bestow_curse,
    blinding_smite,
    blink,
    call_lightning,
    catnap,
    clairvoyance,
    conjure_animals,
    conjure_barrage,
    counterspell,
    create_food_and_water,
    crusaders_mantle,
    daylight,
    dispel_magic,
    elemental_weapon,
    enemies_abound,
    erupting_earth,
    fast_friends,
    fear,
    feign_death,
    fireball,
    flame_arrows,
    fly,
    galders_tower,
    gaseous_form,
    glyph_of_warding,
    haste,
    hunger_of_hadar,
    hypnotic_pattern,
    incite_greed,
    intellect_fortress,
    leomunds_tiny_hut,
    life_transference,
    lightning_arrow,
    lightning_bolt,
    magic_circle,
    major_image,
    mass_healing_word,
    meld_into_stone,
    melfs_minute_meteors,
    motivational_speech,
    nondetection,
    phantom_steed,
    plant_growth,
    protection_from_energy,
    remove_curse,
    revivify,
    sending,
    sleet_storm,
    slow,
    speak_with_dead,
    speak_with_plants,
    spirit_guardians,
    spirit_shroud,
    stinking_cloud,
    summon_fey,
    summon_lesser_demons,
    summon_shadowspawn,
    summon_undead,
    thunder_step,
    tidal_wave,
    tiny_servant,
    tongues,
    vampiric_touch,
    wall_of_sand,
    wall_of_water,
    water_breathing,
    water_walk,
    wind_wall,
};

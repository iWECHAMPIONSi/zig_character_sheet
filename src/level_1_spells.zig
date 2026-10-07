const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 1 spells from dnd5e.wikidot.com/spells.
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

const roll_11d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 11, .dice = &dice.d10 } }, .negative = false },
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

const roll_12d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d10 } }, .negative = false },
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

const roll_13d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 13, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_14d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_14d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_15d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 15, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_16d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 16, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_16d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 16, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_17d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 17, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_18d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 18, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_18d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 18, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_19d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 19, .dice = &dice.d8 } }, .negative = false },
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

const roll_1d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
    },
};

const roll_1d4_plus_1: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 1 }, .negative = false },
    },
};

const roll_1d4_plus_14: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 14 }, .negative = false },
    },
};

const roll_1d4_plus_19: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 19 }, .negative = false },
    },
};

const roll_1d4_plus_24: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 24 }, .negative = false },
    },
};

const roll_1d4_plus_29: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 29 }, .negative = false },
    },
};

const roll_1d4_plus_34: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 34 }, .negative = false },
    },
};

const roll_1d4_plus_39: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 39 }, .negative = false },
    },
};

const roll_1d4_plus_4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 4 }, .negative = false },
    },
};

const roll_1d4_plus_44: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 44 }, .negative = false },
    },
};

const roll_1d4_plus_9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .flat = 9 }, .negative = false },
    },
};

const roll_1d4_spell_mod: modifier.DiceRoll = .{
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

const roll_1d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_1d8_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_20d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 20, .dice = &dice.d10 } }, .negative = false },
    },
};

const roll_21d8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 21, .dice = &dice.d8 } }, .negative = false },
    },
};

const roll_22d10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 22, .dice = &dice.d10 } }, .negative = false },
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

const roll_2d4_spell_mod: modifier.DiceRoll = .{
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

const roll_2d8_spell_mod: modifier.DiceRoll = .{
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

const roll_3d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_3d4_spell_mod: modifier.DiceRoll = .{
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

const roll_3d8_spell_mod: modifier.DiceRoll = .{
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

const roll_4d4_spell_mod: modifier.DiceRoll = .{
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

const roll_4d8_spell_mod: modifier.DiceRoll = .{
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

const roll_5d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_5d4_spell_mod: modifier.DiceRoll = .{
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

const roll_5d8_spell_mod: modifier.DiceRoll = .{
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

const roll_6d4_spell_mod: modifier.DiceRoll = .{
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

const roll_6d8_spell_mod: modifier.DiceRoll = .{
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

const roll_7d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_7d4_spell_mod: modifier.DiceRoll = .{
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

const roll_7d8_spell_mod: modifier.DiceRoll = .{
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

const roll_8d4_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_8d8_spell_mod: modifier.DiceRoll = .{
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

const roll_9d12: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d12 } }, .negative = false },
    },
};

const roll_9d4_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d4 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
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

const roll_9d8_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

const roll_chaos_1: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_2: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_3: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_5: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 5, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_6: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_7: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_8: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_chaos_9: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
        .{ .roll = .{ .roll = .{ .count = 9, .dice = &dice.d6 } }, .negative = false },
    },
};

const roll_flat_1: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 1 }, .negative = false },
    },
};

const roll_flat_10: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 10 }, .negative = false },
    },
};

const roll_flat_15: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 15 }, .negative = false },
    },
};

const roll_flat_20: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 20 }, .negative = false },
    },
};

const roll_flat_25: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 25 }, .negative = false },
    },
};

const roll_flat_30: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 30 }, .negative = false },
    },
};

const roll_flat_35: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 35 }, .negative = false },
    },
};

const roll_flat_40: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 40 }, .negative = false },
    },
};

const roll_flat_45: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 45 }, .negative = false },
    },
};

const roll_flat_5: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .flat = 5 }, .negative = false },
    },
};

const roll_negative_1d4: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = true },
    },
};

const roll_spell_mod: modifier.DiceRoll = .{
    .roll = &.{
        .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
    },
};

// ============================================================================
// Shared modifiers
// ============================================================================

const longstrider_speed: modifier.Modifier = .{
    .name = "Longstrider Speed",
    .modifier = .{ .bonus = .speed },
    .brief = "Speed increase from Longstrider.",
    .amount = 10,
};

const shield_ac: modifier.Modifier = .{
    .name = "Shield AC",
    .modifier = .{ .bonus = .armor_class },
    .brief = "Temporary AC bonus from Shield.",
    .amount = 5,
};

const shield_of_faith_ac: modifier.Modifier = .{
    .name = "Shield of Faith AC",
    .modifier = .{ .bonus = .armor_class },
    .brief = "AC bonus from Shield of Faith.",
    .amount = 2,
};

// ============================================================================
// Level 1 spell definitions
// ============================================================================

pub const absorb_elements: Spell = Spell.compInit(
    "Absorb Elements",
    .xge,
    .level_1,
    .abjuration,
    false,
    .{ .time = .reaction, .brief = "when you take acid, cold, fire, lightning, or thunder damage" },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Gain resistance to the triggering energy and empower your next melee hit.",
    .{
        .desc = "Capture some of the incoming elemental energy.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Resistance",
                .desc = "You have resistance to the triggering damage type until the start of your next turn.",
            },
            .{
                .table = null,
                .heading = "Stored Energy",
                .desc = "The first melee attack you hit with on your next turn deals extra damage of the triggering type, then the spell ends.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
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
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    &.{roll_1d6},
    null,
);

pub const alarm: Spell = Spell.compInit(
    "Alarm",
    .phb14,
    .level_1,
    .abjuration,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = .cube, .brief = "up to a 20-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny bell and fine silver wire" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Ward a door, window, or area against intrusion.",
    .{
        .desc = "Set an alarm over a door, window, or area no larger than a 20-foot cube.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Exceptions",
                .desc = "You may designate creatures that do not trigger the alarm.",
            },
            .{
                .table = null,
                .heading = "Mental Alarm",
                .desc = "Alerts you mentally while you are within 1 mile and can wake you from sleep.",
            },
            .{
                .table = null,
                .heading = "Audible Alarm",
                .desc = "Produces a hand-bell sound for 10 seconds within 60 feet.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Ranger, Wizard
    null,
    null,
);

pub const animal_friendship: Spell = Spell.compInit(
    "Animal Friendship",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a morsel of food" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Charm a low-Intelligence beast that can see and hear you.",
    .{ .desc = "A visible beast that can see and hear you makes a Wisdom save unless its Intelligence is 4 or higher, in which case the spell fails. On a failed save it is charmed until the spell ends or until you or an ally harms it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 2 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 3 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 4 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 5 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 6 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 7 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 8 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 9 beasts.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Druid, Ranger
    null,
    null,
);

pub const armor_of_agathys: Spell = Spell.compInit(
    "Armor of Agathys",
    .phb14,
    .level_1,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a cup of water" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Gain temporary hit points that punish melee attackers.",
    .{ .desc = "Spectral frost grants 5 temporary hit points. While any remain, a creature that hits you with a melee attack takes 5 cold damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Gain 10 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 10 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_10, roll_flat_10 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Gain 15 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 15 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_15, roll_flat_15 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Gain 20 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 20 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_20, roll_flat_20 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Gain 25 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 25 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_25, roll_flat_25 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Gain 30 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 30 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_30, roll_flat_30 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Gain 35 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 35 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_35, roll_flat_35 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Gain 40 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 40 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_40, roll_flat_40 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Gain 45 temporary hit points; a creature hitting you with a melee attack while those hit points remain takes 45 cold damage.", .desc_fields = null },
            .dice_rolls = &.{ roll_flat_45, roll_flat_45 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock
    &.{ roll_flat_5, roll_flat_5 },
    null,
);

pub const arms_of_hadar: Spell = Spell.compInit(
    "Arms of Hadar",
    .phb14,
    .level_1,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "10-foot radius" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Dark tendrils damage nearby creatures and suppress reactions.",
    .{ .desc = "Each other creature within 10 feet makes a Strength save. A failed save takes necrotic damage and cannot take reactions until its next turn; a successful save takes half damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
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
    &.{}, // Classes: Warlock
    &.{roll_2d6},
    null,
);

pub const bane: Spell = Spell.compInit(
    "Bane",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of blood" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Up to three creatures subtract a d4 from attacks and saves after failing a Charisma save.",
    .{ .desc = "Up to three visible creatures make Charisma saves. A failed target subtracts 1d4 from attack rolls and saving throws while the spell lasts.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 4 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 5 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 6 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 7 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 8 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 9 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 10 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 11 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_negative_1d4},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric
    &.{roll_negative_1d4},
    null,
);

pub const beast_bond: Spell = Spell.compInit(
    "Beast Bond",
    .xge,
    .level_1,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "fur wrapped in cloth" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create a telepathic bond with a friendly or charmed beast.",
    .{
        .desc = "Touch a friendly or charmed beast with Intelligence below 4.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Telepathy",
                .desc = "While you remain in line of sight, it understands your telepathic messages and can send simple emotions and concepts back.",
            },
            .{
                .table = null,
                .heading = "Combat",
                .desc = "The beast has advantage on attacks against creatures within 5 feet of you that you can see.",
            },
        },
    },
    null,
    &.{}, // Classes: Druid, Ranger
    null,
    null,
);

pub const bless: Spell = Spell.compInit(
    "Bless",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a sprinkling of holy water" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Up to three creatures add a d4 to attack rolls and saving throws.",
    .{ .desc = "Choose up to three creatures in range. While the spell lasts, each may add 1d4 to an attack roll or saving throw it makes.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 4 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 5 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 6 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 7 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 8 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 9 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 10 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 11 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Paladin
    &.{roll_1d4},
    null,
);

pub const burning_hands: Spell = Spell.compInit(
    "Burning Hands",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "15-foot cone" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "A cone of flame deals fire damage and ignites unattended flammables.",
    .{ .desc = "Creatures in a 15-foot cone make Dexterity saves, taking full fire damage on a failure and half on a success. Unattended flammable objects in the area ignite.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 11d6.", .desc_fields = null },
            .dice_rolls = &.{roll_11d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_3d6},
    null,
);

pub const catapult: Spell = Spell.compInit(
    "Catapult",
    .xge,
    .level_1,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Launch a loose object in a straight line to strike a target.",
    .{ .desc = "Choose an unattended object weighing 1 to 5 pounds. It flies up to 90 feet in a straight line; a creature in its path can make a Dexterity save. On impact, both the object and what it hits take bludgeoning damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The maximum object weight becomes 10 pounds and impact damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The maximum object weight becomes 15 pounds and impact damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The maximum object weight becomes 20 pounds and impact damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The maximum object weight becomes 25 pounds and impact damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The maximum object weight becomes 30 pounds and impact damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The maximum object weight becomes 35 pounds and impact damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The maximum object weight becomes 40 pounds and impact damage becomes 10d8.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The maximum object weight becomes 45 pounds and impact damage becomes 11d8.", .desc_fields = null },
            .dice_rolls = &.{roll_11d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Sorcerer, Wizard
    &.{roll_3d8},
    null,
);

pub const cause_fear: Spell = Spell.compInit(
    "Cause Fear",
    .xge,
    .level_1,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Frighten a creature that fails a Wisdom save.",
    .{ .desc = "One visible creature makes a Wisdom save or becomes frightened of you. Constructs and undead are immune; the target repeats the save at the end of each turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 2 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 3 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 4 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 5 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 6 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 7 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 8 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 9 creatures. Targets must be within 30 feet of each other when selected.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const ceremony: Spell = Spell.compInit(
    "Ceremony",
    .xge,
    .level_1,
    .abjuration,
    true,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "25 gp of powdered silver, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = true, .brief = "Individual rites can have lasting effects." },
    "Perform one of several religious rites.",
    .{
        .desc = "Perform one religious rite; the target must remain within 10 feet throughout the casting.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Atonement",
                .desc = "Make a DC 20 Wisdom (Insight) check for a willing creature whose alignment changed; on success, restore its original alignment.",
            },
            .{
                .table = null,
                .heading = "Bless Water",
                .desc = "Transform a vial of water into holy water.",
            },
            .{
                .table = null,
                .heading = "Coming of Age",
                .desc = "A young adult humanoid adds 1d4 to ability checks for 24 hours; it can benefit only once.",
            },
            .{
                .table = null,
                .heading = "Dedication",
                .desc = "A humanoid dedicated to your deity adds 1d4 to saving throws for 24 hours; it can benefit only once.",
            },
            .{
                .table = null,
                .heading = "Funeral Rite",
                .desc = "A corpse cannot become undead for 7 days except through exceptionally powerful magic.",
            },
            .{
                .table = null,
                .heading = "Wedding",
                .desc = "Willing adult humanoids gain +2 AC while within 30 feet of each other for 7 days; a creature can benefit again only if widowed.",
            },
        },
    },
    null,
    &.{}, // Classes: Cleric, Paladin
    null,
    null,
);

pub const chaos_bolt: Spell = Spell.compInit(
    "Chaos Bolt",
    .xge,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "A chaotic ranged spell attack whose damage type is determined by a d8.",
    .{
        .desc = "Make a ranged spell attack. On a hit, deal 2d8 + 1d6 damage.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "d8", "Damage Type" },
                    .table_entry = &.{
                        &.{
                            .{ .int = 1 },
                            .{ .str = "Acid" },
                        },
                        &.{
                            .{ .int = 2 },
                            .{ .str = "Cold" },
                        },
                        &.{
                            .{ .int = 3 },
                            .{ .str = "Fire" },
                        },
                        &.{
                            .{ .int = 4 },
                            .{ .str = "Force" },
                        },
                        &.{
                            .{ .int = 5 },
                            .{ .str = "Lightning" },
                        },
                        &.{
                            .{ .int = 6 },
                            .{ .str = "Poison" },
                        },
                        &.{
                            .{ .int = 7 },
                            .{ .str = "Psychic" },
                        },
                        &.{
                            .{ .int = 8 },
                            .{ .str = "Thunder" },
                        },
                    },
                },
                .heading = "Damage Type",
                .desc = "Choose one of the d8 results; that number determines the damage type.",
            },
            .{
                .table = null,
                .heading = "Leap",
                .desc = "If both d8s show the same number, the energy can jump to a different creature within 30 feet. Make a new attack and damage roll; a creature can be targeted only once per casting.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 2d8 + 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_2},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 2d8 + 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_3},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 2d8 + 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 2d8 + 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_5},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 2d8 + 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 2d8 + 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_7},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 2d8 + 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 2d8 + 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_chaos_9},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer
    &.{roll_chaos_1},
    null,
);

pub const charm_person: Spell = Spell.compInit(
    "Charm Person",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Charm a humanoid that fails a Wisdom save.",
    .{ .desc = "A visible humanoid makes a Wisdom save, with advantage if you or your allies are fighting it. On a failure it is charmed until the spell ends or you or an ally harms it, and it knows afterward that you charmed it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 2 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 3 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 4 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 5 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 6 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 7 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 8 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 9 humanoids.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Druid, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const chromatic_orb: Spell = Spell.compInit(
    "Chromatic Orb",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a diamond worth at least 50 gp" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Ranged spell attack dealing a chosen elemental damage type.",
    .{ .desc = "Choose acid, cold, fire, lightning, poison, or thunder, then make a ranged spell attack. On a hit, the target takes damage of the chosen type.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 5d8.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 6d8.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 8d8.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 10d8.", .desc_fields = null },
            .dice_rolls = &.{roll_10d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 11d8.", .desc_fields = null },
            .dice_rolls = &.{roll_11d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_3d8},
    null,
);

pub const color_spray: Spell = Spell.compInit(
    "Color Spray",
    .phb14,
    .level_1,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "15-foot cone" },
    .{ .v = true, .s = true, .m = true, .m_brief = "red, yellow, and blue powder or sand" },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Blind creatures in a cone according to a rolled hit-point pool.",
    .{ .desc = "Roll a hit-point pool. Creatures in the cone are considered from lowest current hit points upward; each creature whose hit points fit in the remaining pool is blinded until the end of your next turn. Unconscious creatures and creatures that cannot see are ignored.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The hit-point pool becomes 8d10.", .desc_fields = null },
            .dice_rolls = &.{roll_8d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The hit-point pool becomes 10d10.", .desc_fields = null },
            .dice_rolls = &.{roll_10d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The hit-point pool becomes 12d10.", .desc_fields = null },
            .dice_rolls = &.{roll_12d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The hit-point pool becomes 14d10.", .desc_fields = null },
            .dice_rolls = &.{roll_14d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The hit-point pool becomes 16d10.", .desc_fields = null },
            .dice_rolls = &.{roll_16d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The hit-point pool becomes 18d10.", .desc_fields = null },
            .dice_rolls = &.{roll_18d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The hit-point pool becomes 20d10.", .desc_fields = null },
            .dice_rolls = &.{roll_20d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The hit-point pool becomes 22d10.", .desc_fields = null },
            .dice_rolls = &.{roll_22d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_6d10},
    null,
);

pub const command: Spell = Spell.compInit(
    "Command",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Issue a one-word command to a creature that fails a Wisdom save.",
    .{
        .desc = "Speak a one-word command to a visible creature. It fails against undead, creatures that cannot understand you, or directly harmful commands.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Approach",
                .desc = "The target moves toward you by the shortest direct route and ends its turn if it comes within 5 feet.",
            },
            .{
                .table = null,
                .heading = "Drop",
                .desc = "The target drops what it is holding and ends its turn.",
            },
            .{
                .table = null,
                .heading = "Flee",
                .desc = "The target spends its turn moving away from you as quickly as possible.",
            },
            .{
                .table = null,
                .heading = "Grovel",
                .desc = "The target falls prone and ends its turn.",
            },
            .{
                .table = null,
                .heading = "Halt",
                .desc = "The target does not move and takes no actions; a flying target moves only as required to stay aloft.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 2 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 3 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 4 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 5 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 6 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 7 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 8 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 9 creatures. All selected creatures must be within 30 feet of each other.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Paladin
    null,
    null,
);

pub const compelled_duel: Spell = Spell.compInit(
    "Compelled Duel",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Compel one creature to focus its attacks and movement around you.",
    .{
        .desc = "One visible creature makes a Wisdom save or is compelled into a duel.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Attacks",
                .desc = "It has disadvantage on attack rolls against creatures other than you.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "It must make a Wisdom save to move to a space more than 30 feet from you.",
            },
            .{
                .table = null,
                .heading = "Ending Early",
                .desc = "The spell ends if you attack another creature, cast a harmful spell on another hostile creature, an ally harms the target, or you end your turn more than 30 feet away.",
            },
        },
    },
    null,
    &.{}, // Classes: Paladin
    null,
    null,
);

pub const comprehend_languages: Spell = Spell.compInit(
    "Comprehend Languages",
    .phb14,
    .level_1,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of soot and salt" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Understand the literal meaning of spoken and written languages.",
    .{ .desc = "You understand spoken language you hear and written language you touch. Reading a page takes about 1 minute. The spell does not decipher codes, secret messages, or non-language glyphs.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const create_or_destroy_water: Spell = Spell.compInit(
    "Create or Destroy Water",
    .phb14,
    .level_1,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of water or a few grains of sand" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create or destroy water, or affect rain/fog in an area.",
    .{
        .desc = "Choose creation or destruction.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Create Water",
                .desc = "Create up to 10 gallons in an open container, or cause rain in a 30-foot cube that extinguishes exposed flames.",
            },
            .{
                .table = null,
                .heading = "Destroy Water",
                .desc = "Destroy up to 10 gallons in an open container, or remove fog in a 30-foot cube.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Create or destroy up to 20 gallons, or use a cube 35 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Create or destroy up to 30 gallons, or use a cube 40 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Create or destroy up to 40 gallons, or use a cube 45 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Create or destroy up to 50 gallons, or use a cube 50 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Create or destroy up to 60 gallons, or use a cube 55 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create or destroy up to 70 gallons, or use a cube 60 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create or destroy up to 80 gallons, or use a cube 65 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create or destroy up to 90 gallons, or use a cube 70 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric, Druid
    null,
    null,
);

pub const cure_wounds: Spell = Spell.compInit(
    "Cure Wounds",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Restore hit points to a touched creature.",
    .{ .desc = "A creature you touch regains hit points equal to the healing roll. The spell does not affect undead or constructs.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Healing becomes 2d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Healing becomes 3d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Healing becomes 4d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Healing becomes 5d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_5d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Healing becomes 6d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_6d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Healing becomes 7d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Healing becomes 8d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_8d8_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Healing becomes 9d8 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer, Bard, Cleric, Druid, Paladin, Ranger
    &.{roll_1d8_spell_mod},
    null,
);

pub const detect_evil_and_good: Spell = Spell.compInit(
    "Detect Evil and Good",
    .phb14,
    .level_1,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Sense certain creature types and consecrated or desecrated places nearby.",
    .{ .desc = "You sense aberrations, celestials, elementals, fey, fiends, and undead within 30 feet, along with consecrated or desecrated places or objects. Thick barriers can block the sense.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Paladin
    null,
    null,
);

pub const detect_magic: Spell = Spell.compInit(
    "Detect Magic",
    .phb14,
    .level_1,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Sense nearby magic and identify its school.",
    .{ .desc = "You sense magic within 30 feet. You can use an action to see an aura around visible magical creatures or objects and learn the school of magic, if any. Thick barriers can block the sense.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Cleric, Druid, Paladin, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const detect_poison_and_disease: Spell = Spell.compInit(
    "Detect Poison and Disease",
    .phb14,
    .level_1,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a yew leaf" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Sense nearby poisons, poisonous creatures, and diseases.",
    .{ .desc = "You sense the presence and location of poisons, poisonous creatures, and diseases within 30 feet and identify their kind. Thick barriers can block the sense.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Druid, Paladin, Ranger
    null,
    null,
);

pub const disguise_self: Spell = Spell.compInit(
    "Disguise Self",
    .phb14,
    .level_1,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Alter your apparent appearance and worn gear.",
    .{
        .desc = "You make yourself and your worn or carried belongings look different.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Limits",
                .desc = "You can appear about 1 foot shorter or taller and change apparent build, but not your basic arrangement of limbs.",
            },
            .{
                .table = null,
                .heading = "Physical Inspection",
                .desc = "The illusion does not change physical form. A creature examining it can use Intelligence (Investigation) against your spell save DC to recognize the disguise.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const dissonant_whispers: Spell = Spell.compInit(
    "Dissonant Whispers",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Psychic damage can force a target to flee using its reaction.",
    .{ .desc = "One creature makes a Wisdom save. On a failure it takes psychic damage and, if able, immediately uses its reaction to move away from you without entering obvious hazards. On a success it takes half damage and does not move.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 8d6.", .desc_fields = null },
            .dice_rolls = &.{roll_8d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 9d6.", .desc_fields = null },
            .dice_rolls = &.{roll_9d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 10d6.", .desc_fields = null },
            .dice_rolls = &.{roll_10d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 11d6.", .desc_fields = null },
            .dice_rolls = &.{roll_11d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard
    &.{roll_3d6},
    null,
);

pub const distort_value: Spell = Spell.compInit(
    "Distort Value",
    .ai,
    .level_1,
    .illusion,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Make an object appear worth twice or half its actual value.",
    .{ .desc = "An object no larger than 1 foot on a side appears either more valuable or less valuable. A creature examining it can make Investigation against your spell save DC to see through the illusion.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The maximum affected object size becomes 2 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The maximum affected object size becomes 3 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The maximum affected object size becomes 4 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The maximum affected object size becomes 5 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The maximum affected object size becomes 6 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The maximum affected object size becomes 7 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The maximum affected object size becomes 8 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The maximum affected object size becomes 9 feet on a side.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const divine_favor: Spell = Spell.compInit(
    "Divine Favor",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Your weapon attacks deal extra radiant damage.",
    .{ .desc = "For the duration, each weapon attack you hit with deals an extra 1d4 radiant damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Paladin
    &.{roll_1d4},
    null,
);

pub const earth_tremor: Spell = Spell.compInit(
    "Earth Tremor",
    .xge,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "10-foot radius" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Shake nearby ground, damaging and knocking creatures prone.",
    .{ .desc = "Each other creature within 10 feet makes a Dexterity save. On a failure it takes bludgeoning damage and falls prone. Loose earth or stone in the area becomes difficult terrain until cleared.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
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
    &.{}, // Classes: Bard, Druid, Sorcerer, Wizard
    &.{roll_1d6},
    null,
);

pub const ensnaring_strike: Spell = Spell.compInit(
    "Ensnaring Strike",
    .phb14,
    .level_1,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Your next weapon hit can restrain the target in thorny vines.",
    .{
        .desc = "The next weapon attack you hit with can conjure restraining vines.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Save",
                .desc = "The target makes a Strength save; Large or larger creatures have advantage.",
            },
            .{
                .table = null,
                .heading = "Restrained Damage",
                .desc = "While restrained, the target takes piercing damage at the start of each of its turns.",
            },
            .{
                .table = null,
                .heading = "Escape",
                .desc = "The target or a creature that can reach it can use an action to make a Strength check against your spell save DC to free it.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
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
    &.{}, // Classes: Ranger
    &.{roll_1d6},
    null,
);

pub const entangle: Spell = Spell.compInit(
    "Entangle",
    .phb14,
    .level_1,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = "20-foot square" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create difficult terrain that can restrain creatures.",
    .{ .desc = "Plants fill a 20-foot square, creating difficult terrain. Creatures there when cast make Strength saves or become restrained; a restrained creature can use an action to make a Strength check against your spell save DC to escape.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const expeditious_retreat: Spell = Spell.compInit(
    "Expeditious Retreat",
    .phb14,
    .level_1,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Dash immediately and again as a bonus action while the spell lasts.",
    .{ .desc = "When you cast the spell, and as a bonus action on later turns while it lasts, you can take the Dash action.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const faerie_fire: Spell = Spell.compInit(
    "Faerie Fire",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = .cube, .brief = "20-foot cube" },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Outline objects and creatures, negating invisibility and granting advantage to attackers.",
    .{ .desc = "Objects in a 20-foot cube are outlined in colored light. Creatures in the area make Dexterity saves or are also outlined. Affected targets shed dim light, cannot benefit from invisibility, and attacks against them have advantage if the attacker can see them.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Druid
    null,
    null,
);

pub const false_life: Spell = Spell.compInit(
    "False Life",
    .phb14,
    .level_1,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small amount of alcohol or distilled spirits" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Gain temporary hit points.",
    .{ .desc = "You gain 1d4 + 4 temporary hit points for the duration.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 9.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_9},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 14.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_14},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 19.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_19},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 24.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_24},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 29.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_29},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 34.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_34},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 39.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_39},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Temporary hit points become 1d4 + 44.", .desc_fields = null },
            .dice_rolls = &.{roll_1d4_plus_44},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_1d4_plus_4},
    null,
);

pub const feather_fall: Spell = Spell.compInit(
    "Feather Fall",
    .phb14,
    .level_1,
    .transmutation,
    false,
    .{ .time = .reaction, .brief = "when you or a creature within 60 feet falls" },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = true, .m_brief = "a small feather or piece of down" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Slow the fall of up to five creatures.",
    .{ .desc = "Choose up to five falling creatures. Their descent slows to 60 feet per round; a creature that lands before the spell ends takes no falling damage and lands on its feet.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Bard, Sorcerer, Wizard
    null,
    null,
);

pub const find_familiar: Spell = Spell.compInit(
    "Find Familiar",
    .phb14,
    .level_1,
    .conjuration,
    true,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "10 gp of charcoal, incense, and herbs burned in a brass brazier" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Summon a spirit familiar that takes an animal form.",
    .{
        .desc = "Summon a spirit familiar in a chosen animal form.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Nature",
                .desc = "The familiar uses the chosen form's statistics but is a celestial, fey, or fiend instead of a beast.",
            },
            .{
                .table = null,
                .heading = "Combat",
                .desc = "It acts independently, obeys your commands, cannot attack, and rolls its own initiative.",
            },
            .{
                .table = null,
                .heading = "Communication",
                .desc = "Within 100 feet, you can communicate telepathically and can use an action to perceive through its senses until your next turn.",
            },
            .{
                .table = null,
                .heading = "Dismissal and Resummoning",
                .desc = "You can temporarily dismiss it or permanently dismiss it; while temporarily dismissed, you can cause it to reappear in an unoccupied space within 30 feet.",
            },
            .{
                .table = null,
                .heading = "Spell Delivery",
                .desc = "When you cast a touch-range spell, the familiar can deliver it if it is within 100 feet, using its reaction.",
            },
        },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const fog_cloud: Spell = Spell.compInit(
    "Fog Cloud",
    .phb14,
    .level_1,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a heavily obscured sphere of fog.",
    .{ .desc = "Create a 20-foot-radius sphere of fog that spreads around corners and heavily obscures its area. Moderate or stronger wind disperses it.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The fog radius becomes 40 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The fog radius becomes 60 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The fog radius becomes 80 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The fog radius becomes 100 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The fog radius becomes 120 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The fog radius becomes 140 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The fog radius becomes 160 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The fog radius becomes 180 feet.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const frost_fingers: Spell = Spell.compInit(
    "Frost Fingers",
    .idrotf,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "15-foot cone" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "A cone of cold damages creatures and freezes unattended nonmagical liquids.",
    .{ .desc = "Creatures in a 15-foot cone make Constitution saves, taking full cold damage on a failure and half on a success. Unattended nonmagical liquids in the area freeze.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
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
    &.{}, // Classes: Wizard
    &.{roll_2d8},
    null,
);

pub const goodberry: Spell = Spell.compInit(
    "Goodberry",
    .phb14,
    .level_1,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a sprig of mistletoe" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create ten berries that heal and provide a day's nourishment.",
    .{ .desc = "Up to ten magical berries appear. Eating one as an action restores 1 hit point and provides enough nourishment for one day. The berries lose potency after 24 hours.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Ranger
    &.{roll_flat_1},
    null,
);

pub const grease: Spell = Spell.compInit(
    "Grease",
    .phb14,
    .level_1,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = "10-foot square" },
    .{ .v = true, .s = true, .m = true, .m_brief = "pork rind or butter" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Cover a 10-foot square with slippery grease.",
    .{ .desc = "The area becomes difficult terrain. Creatures standing there when the grease appears, entering the area, or ending a turn there make Dexterity saves or fall prone.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Wizard
    null,
    null,
);

pub const guiding_bolt: Spell = Spell.compInit(
    "Guiding Bolt",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Radiant ranged spell attack that grants advantage to the next attacker.",
    .{ .desc = "Make a ranged spell attack. On a hit, the target takes radiant damage and the next attack made against it before the end of your next turn has advantage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 5d6.", .desc_fields = null },
            .dice_rolls = &.{roll_5d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 6d6.", .desc_fields = null },
            .dice_rolls = &.{roll_6d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 7d6.", .desc_fields = null },
            .dice_rolls = &.{roll_7d6},
            .modifiers = null,
        },
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
    &.{}, // Classes: Cleric
    &.{roll_4d6},
    null,
);

pub const hail_of_thorns: Spell = Spell.compInit(
    "Hail of Thorns",
    .phb14,
    .level_1,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Your next ranged weapon hit erupts into a damaging burst of thorns.",
    .{ .desc = "The next ranged weapon attack you hit with causes the target and creatures within 5 feet of it to make Dexterity saves, taking piercing damage on a failure and half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The thorn burst damage becomes 2d10.", .desc_fields = null },
            .dice_rolls = &.{roll_2d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The thorn burst damage becomes 3d10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The thorn burst damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The thorn burst damage becomes 5d10.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The thorn burst damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The thorn burst damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The thorn burst damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The thorn burst damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Ranger
    &.{roll_1d10},
    null,
);

pub const healing_word: Spell = Spell.compInit(
    "Healing Word",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Restore hit points to a visible creature at range.",
    .{ .desc = "A visible creature in range regains hit points equal to the healing roll. The spell does not affect undead or constructs.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Healing becomes 2d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_2d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Healing becomes 3d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_3d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Healing becomes 4d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_4d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Healing becomes 5d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_5d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Healing becomes 6d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_6d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Healing becomes 7d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_7d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Healing becomes 8d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_8d4_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Healing becomes 9d4 + your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{roll_9d4_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Druid
    &.{roll_1d4_spell_mod},
    null,
);

pub const hellish_rebuke: Spell = Spell.compInit(
    "Hellish Rebuke",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .reaction, .brief = "when a visible creature within 60 feet damages you" },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Retaliate against a creature that damages you with hellish fire.",
    .{ .desc = "The triggering creature makes a Dexterity save, taking full fire damage on a failure and half on a success.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 3d10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 5d10.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 7d10.", .desc_fields = null },
            .dice_rolls = &.{roll_7d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 8d10.", .desc_fields = null },
            .dice_rolls = &.{roll_8d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 9d10.", .desc_fields = null },
            .dice_rolls = &.{roll_9d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 10d10.", .desc_fields = null },
            .dice_rolls = &.{roll_10d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock
    &.{roll_2d10},
    null,
);

pub const heroism: Spell = Spell.compInit(
    "Heroism",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Make a willing creature fearless and repeatedly grant temporary hit points.",
    .{ .desc = "A willing creature becomes immune to frightened and gains temporary hit points equal to your spellcasting ability modifier at the start of each of its turns. Remaining temporary hit points from this spell vanish when it ends.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 2 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 3 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 4 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 5 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 6 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 7 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 8 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 9 creatures.", .desc_fields = null },
            .dice_rolls = &.{roll_spell_mod},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Paladin
    &.{roll_spell_mod},
    null,
);

pub const hex: Spell = Spell.compInit(
    "Hex",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "the petrified eye of a newt" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Curse a target to take extra damage from your attacks and suffer disadvantage on chosen ability checks.",
    .{
        .desc = "Curse one visible creature.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Damage",
                .desc = "Whenever you hit the target with an attack, it takes an extra 1d6 necrotic damage.",
            },
            .{
                .table = null,
                .heading = "Ability Checks",
                .desc = "Choose one ability; the target has disadvantage on checks using that ability.",
            },
            .{
                .table = null,
                .heading = "Transfer",
                .desc = "If the target drops to 0 hit points before the spell ends, you can use a later bonus action to move the curse to a new creature.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Maximum concentration duration is 1 hour.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Maximum concentration duration is 8 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Maximum concentration duration is 8 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Warlock
    &.{roll_1d6},
    null,
);

pub const hunters_mark: Spell = Spell.compInit(
    "Hunter's Mark",
    .phb14,
    .level_1,
    .divination,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Mark a quarry for extra weapon damage and improved tracking.",
    .{
        .desc = "Mark one visible creature as your quarry.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Damage",
                .desc = "Weapon attacks that hit the marked target deal an extra 1d6 damage.",
            },
            .{
                .table = null,
                .heading = "Tracking",
                .desc = "You have advantage on Wisdom (Perception) and Wisdom (Survival) checks made to find the target.",
            },
            .{
                .table = null,
                .heading = "Transfer",
                .desc = "If the target drops to 0 hit points before the spell ends, you can use a later bonus action to mark another creature.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Maximum concentration duration is 1 hour.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Maximum concentration duration is 8 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Maximum concentration duration is 8 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum concentration duration is 24 hours.", .desc_fields = null },
            .dice_rolls = &.{roll_1d6},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Ranger
    &.{roll_1d6},
    null,
);

pub const ice_knife: Spell = Spell.compInit(
    "Ice Knife",
    .xge,
    .level_1,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = true, .m_brief = "a drop of water or a piece of ice" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Throw an ice shard that pierces one target and then explodes.",
    .{
        .desc = "Make a ranged spell attack with a shard of ice.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Impact",
                .desc = "On a hit, the target takes 1d10 piercing damage.",
            },
            .{
                .table = null,
                .heading = "Explosion",
                .desc = "Hit or miss, the shard explodes. The target and creatures within 5 feet make Dexterity saves or take cold damage.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The explosion damage becomes 3d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_3d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The explosion damage becomes 4d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_4d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The explosion damage becomes 5d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_5d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The explosion damage becomes 6d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_6d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The explosion damage becomes 7d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_7d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The explosion damage becomes 8d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_8d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The explosion damage becomes 9d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_9d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The explosion damage becomes 10d6 cold damage; the initial hit remains 1d10 piercing.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_10d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{ roll_1d10, roll_2d6 },
    null,
);

pub const identify: Spell = Spell.compInit(
    "Identify",
    .phb14,
    .level_1,
    .divination,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pearl worth at least 100 gp and an owl feather" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Learn the magical properties or active spell effects of a touched object or creature.",
    .{
        .desc = "Touch one object throughout the casting.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Magic Object",
                .desc = "Learn its magical properties, how to use them, whether it requires attunement, its charges, active spells, and the creating spell if applicable.",
            },
            .{
                .table = null,
                .heading = "Creature",
                .desc = "If you instead touch a creature, learn which spells are currently affecting it.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Bard, Wizard
    null,
    null,
);

pub const illusory_script: Spell = Spell.compInit(
    "Illusory Script",
    .phb14,
    .level_1,
    .illusion,
    true,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = true, .m_brief = "lead-based ink worth at least 10 gp, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Write text that appears normal only to designated readers.",
    .{
        .desc = "Imbue writing with an illusion.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Designated Readers",
                .desc = "To you and creatures chosen when casting, the writing appears normal and carries your intended meaning.",
            },
            .{
                .table = null,
                .heading = "Others",
                .desc = "To others it can appear unintelligible or appear as a different message in another hand and a language you know.",
            },
            .{
                .table = null,
                .heading = "True Seeing",
                .desc = "A creature with truesight can read the hidden message.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Warlock, Wizard
    null,
    null,
);

pub const inflict_wounds: Spell = Spell.compInit(
    "Inflict Wounds",
    .phb14,
    .level_1,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Melee spell attack dealing heavy necrotic damage.",
    .{ .desc = "Make a melee spell attack against a creature you can reach. On a hit, it takes necrotic damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Damage becomes 5d10.", .desc_fields = null },
            .dice_rolls = &.{roll_5d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Damage becomes 6d10.", .desc_fields = null },
            .dice_rolls = &.{roll_6d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Damage becomes 7d10.", .desc_fields = null },
            .dice_rolls = &.{roll_7d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Damage becomes 8d10.", .desc_fields = null },
            .dice_rolls = &.{roll_8d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Damage becomes 9d10.", .desc_fields = null },
            .dice_rolls = &.{roll_9d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Damage becomes 10d10.", .desc_fields = null },
            .dice_rolls = &.{roll_10d10},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Damage becomes 11d10.", .desc_fields = null },
            .dice_rolls = &.{roll_11d10},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric
    &.{roll_3d10},
    null,
);

pub const jims_magic_missile: Spell = Spell.compInit(
    "Jim's Magic Missile",
    .ai,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "1 gp, consumed as the spell's tax" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Launch three attack-roll-based force missiles.",
    .{
        .desc = "Create three magical darts; make a separate ranged spell attack for each.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Hit",
                .desc = "A missile that hits deals 2d4 force damage.",
            },
            .{
                .table = null,
                .heading = "Critical Hit",
                .desc = "A critical hit deals 5d4 force damage for that missile.",
            },
            .{
                .table = null,
                .heading = "Natural 1",
                .desc = "If an attack roll for a missile is a natural 1, all missiles immediately turn back toward you and each hits you automatically.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Create 4 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Create 5 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Create 6 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Create 7 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Create 8 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create 9 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create 10 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create 11 missiles.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4, roll_2d4 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Wizard
    &.{ roll_2d4, roll_2d4, roll_2d4 },
    null,
);

pub const jump: Spell = Spell.compInit(
    "Jump",
    .phb14,
    .level_1,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a grasshopper's hind leg" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Triple a touched creature's jump distance.",
    .{ .desc = "The touched creature's jump distance is tripled until the spell ends.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Druid, Ranger, Sorcerer, Wizard
    null,
    null,
);

pub const longstrider: Spell = Spell.compInit(
    "Longstrider",
    .phb14,
    .level_1,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of dirt" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Increase a touched creature's speed by 10 feet.",
    .{ .desc = "A touched creature's speed increases by 10 feet for the duration.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The spell can affect 2 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The spell can affect 3 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The spell can affect 4 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The spell can affect 5 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The spell can affect 6 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The spell can affect 7 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The spell can affect 8 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The spell can affect 9 creatures.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = &.{longstrider_speed},
        },
    },
    &.{}, // Classes: Artificer, Bard, Druid, Ranger, Wizard
    null,
    &.{longstrider_speed},
);

pub const mage_armor: Spell = Spell.compInit(
    "Mage Armor",
    .phb14,
    .level_1,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a piece of cured leather" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Set an unarmored target's base AC to 13 + Dexterity modifier.",
    .{ .desc = "Touch a willing creature not wearing armor. Its base AC becomes 13 + its Dexterity modifier until the spell ends, it dons armor, or you dismiss the spell as an action.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    null,
    null,
);

pub const magic_missile: Spell = Spell.compInit(
    "Magic Missile",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create three force darts that hit automatically.",
    .{ .desc = "Create three darts that each strike a visible target of your choice. Each dart deals 1d4 + 1 force damage; darts strike simultaneously and may be divided among targets.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Create 4 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "Create 5 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "Create 6 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "Create 7 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "Create 8 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "Create 9 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create 10 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create 11 darts.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_1d4_plus_1, roll_1d4_plus_1, roll_1d4_plus_1 },
    null,
);

pub const protection_from_evil_and_good: Spell = Spell.compInit(
    "Protection from Evil and Good",
    .phb14,
    .level_1,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "holy water or powdered silver and iron, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Protect a willing creature from aberrations, celestials, elementals, fey, fiends, and undead.",
    .{ .desc = "Protected creature types have disadvantage on attacks against the target. The target also cannot be charmed, frightened, or possessed by them, and has advantage on new saves against an existing such effect.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Paladin, Warlock, Wizard
    null,
    null,
);

pub const purify_food_and_drink: Spell = Spell.compInit(
    "Purify Food and Drink",
    .phb14,
    .level_1,
    .transmutation,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = .sphere, .brief = "5-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Purify nonmagical food and drink in a small area.",
    .{ .desc = "Nonmagical food and drink in a 5-foot-radius sphere centered within range becomes free of poison and disease.", .desc_fields = null },
    null,
    &.{}, // Classes: Artificer, Cleric, Druid, Paladin
    null,
    null,
);

pub const ray_of_sickness: Spell = Spell.compInit(
    "Ray of Sickness",
    .phb14,
    .level_1,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Poisoning ranged spell attack.",
    .{ .desc = "Make a ranged spell attack. On a hit, the target takes poison damage and makes a Constitution save; on a failure it is poisoned until the end of your next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
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
    &.{roll_2d8},
    null,
);

pub const sanctuary: Spell = Spell.compInit(
    "Sanctuary",
    .phb14,
    .level_1,
    .abjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small silver mirror" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Ward a creature so attackers must first pass a Wisdom save.",
    .{
        .desc = "Ward one creature in range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Targeting",
                .desc = "A creature that tries to target the warded creature with an attack or harmful spell must make a Wisdom save; on a failure it chooses a different target or loses the attack or spell.",
            },
            .{
                .table = null,
                .heading = "Area Effects",
                .desc = "The ward does not protect against area effects.",
            },
            .{
                .table = null,
                .heading = "Ending Early",
                .desc = "The spell ends if the warded creature attacks, casts a spell affecting an enemy, or deals damage to another creature.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Cleric
    null,
    null,
);

pub const searing_smite: Spell = Spell.compInit(
    "Searing Smite",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Your next melee weapon hit deals extra fire damage and can ignite the target.",
    .{
        .desc = "The next melee weapon attack you hit with deals extra fire damage and ignites the target.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Burning",
                .desc = "At the start of each of its turns, the target makes a Constitution save; on a failure it takes 1d6 fire damage, and on a success the spell ends.",
            },
            .{
                .table = null,
                .heading = "Extinguishing",
                .desc = "The target or a nearby creature can use an action to extinguish the flames; dousing effects also end them.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The initial extra damage becomes 2d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The initial extra damage becomes 3d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The initial extra damage becomes 4d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The initial extra damage becomes 5d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The initial extra damage becomes 6d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The initial extra damage becomes 7d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The initial extra damage becomes 8d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The initial extra damage becomes 9d6 fire; the ongoing burning damage remains 1d6.", .desc_fields = null },
            .dice_rolls = &.{ roll_9d6, roll_1d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Paladin
    &.{ roll_1d6, roll_1d6 },
    null,
);

pub const shield: Spell = Spell.compInit(
    "Shield",
    .phb14,
    .level_1,
    .abjuration,
    false,
    .{ .time = .reaction, .brief = "when you are hit by an attack or targeted by magic missile" },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .round, .concentration = false, .special = false, .brief = null },
    "Gain +5 AC until your next turn and negate magic missile.",
    .{ .desc = "An invisible barrier grants +5 AC until the start of your next turn, including against the triggering attack, and you take no damage from magic missile.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    null,
    &.{shield_ac},
);

pub const shield_of_faith: Spell = Spell.compInit(
    "Shield of Faith",
    .phb14,
    .level_1,
    .abjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small parchment bearing holy text" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Grant a creature +2 AC.",
    .{ .desc = "A shimmering field surrounds a creature in range and grants it +2 AC for the duration.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Paladin
    null,
    &.{shield_of_faith_ac},
);

pub const silent_image: Spell = Spell.compInit(
    "Silent Image",
    .phb14,
    .level_1,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of fleece" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create and move a purely visual illusion.",
    .{
        .desc = "Create a visible image no larger than a 15-foot cube at a point within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Sensory Limits",
                .desc = "The illusion is visual only and produces no sound, smell, or other sensory effect.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "You can use your action to move the image anywhere within range and alter its appearance so that the movement appears natural.",
            },
            .{
                .table = null,
                .heading = "Discerning the Illusion",
                .desc = "Physical interaction reveals the image as an illusion. A creature can use its action to examine it and make an Intelligence (Investigation) check against your spell save DC; on a success, the creature sees through the image.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const silvery_barbs: Spell = Spell.compInit(
    "Silvery Barbs",
    .scc,
    .level_1,
    .enchantment,
    false,
    .{ .time = .reaction, .brief = "when a creature you can see within 60 feet succeeds on an attack roll, ability check, or saving throw" },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Force a successful d20 roll to be rerolled and grant another creature advantage.",
    .{
        .desc = "Distract the triggering creature and redirect that moment into encouragement for another creature.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Triggering Creature",
                .desc = "The triggering creature rerolls the d20 and must use the lower result.",
            },
            .{
                .table = null,
                .heading = "Empowered Creature",
                .desc = "Choose a different creature you can see within range, including yourself. It gains advantage on its next attack roll, ability check, or saving throw made within 1 minute. A creature can benefit from only one use of this spell at a time.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const sleep: Spell = Spell.compInit(
    "Sleep",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = .radius, .brief = "20-foot radius around a point in range" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of fine sand, rose petals, or a cricket" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Put creatures to sleep using a shared hit-point pool.",
    .{
        .desc = "Roll 5d8 to determine the total hit points of creatures the spell can affect in a 20-foot radius.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Order",
                .desc = "Starting with the conscious creature with the lowest current hit points, subtract each affected creature's hit points from the remaining total. A creature is affected only if its current hit points are no greater than the remaining total.",
            },
            .{
                .table = null,
                .heading = "Sleep",
                .desc = "An affected creature falls unconscious until the spell ends, it takes damage, or another creature uses an action to wake it.",
            },
            .{
                .table = null,
                .heading = "Immunity",
                .desc = "Undead and creatures immune to being charmed are unaffected.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The hit-point pool becomes 7d8.", .desc_fields = null },
            .dice_rolls = &.{roll_7d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The hit-point pool becomes 9d8.", .desc_fields = null },
            .dice_rolls = &.{roll_9d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The hit-point pool becomes 11d8.", .desc_fields = null },
            .dice_rolls = &.{roll_11d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The hit-point pool becomes 13d8.", .desc_fields = null },
            .dice_rolls = &.{roll_13d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The hit-point pool becomes 15d8.", .desc_fields = null },
            .dice_rolls = &.{roll_15d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The hit-point pool becomes 17d8.", .desc_fields = null },
            .dice_rolls = &.{roll_17d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The hit-point pool becomes 19d8.", .desc_fields = null },
            .dice_rolls = &.{roll_19d8},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The hit-point pool becomes 21d8.", .desc_fields = null },
            .dice_rolls = &.{roll_21d8},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Wizard
    &.{roll_5d8},
    null,
);

pub const snare: Spell = Spell.compInit(
    "Snare",
    .xge,
    .level_1,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = .radius, .brief = "5-foot-radius circle on the ground" },
    .{ .v = false, .s = true, .m = true, .m_brief = "25 feet of rope, which the spell consumes" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Create a nearly invisible magical snare.",
    .{
        .desc = "Use the rope to form a 5-foot-radius circle on the ground. When casting finishes, the rope disappears and the circle becomes a magical trap.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Detection",
                .desc = "The trap is nearly invisible. A creature can discern it with a successful Intelligence (Investigation) check against your spell save DC.",
            },
            .{
                .table = null,
                .heading = "Trigger",
                .desc = "When a Small, Medium, or Large creature enters the circle, it must succeed on a Dexterity saving throw or be hoisted upside down 3 feet above the ground and restrained.",
            },
            .{
                .table = null,
                .heading = "Escape",
                .desc = "A restrained creature can repeat the Dexterity save at the end of each of its turns. Alternatively, it or another creature within reach can use an action to make an Intelligence (Arcana) check against your spell save DC to end the restraint.",
            },
            .{
                .table = null,
                .heading = "Ending",
                .desc = "After the trap triggers, the spell ends once no creature remains restrained by it.",
            },
        },
    },
    null,
    &.{}, // Classes: Artificer, Druid, Ranger, Wizard
    null,
    null,
);

pub const speak_with_animals: Spell = Spell.compInit(
    "Speak with Animals",
    .phb14,
    .level_1,
    .divination,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Understand and verbally communicate with beasts.",
    .{ .desc = "For the duration, you can understand and verbally communicate with beasts. Their knowledge is limited by their intelligence, but they can convey information they can perceive or remember from the recent past; persuading one to perform a favor remains subject to the DM.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid, Ranger
    null,
    null,
);

pub const tashas_caustic_brew: Spell = Spell.compInit(
    "Tasha's Caustic Brew",
    .tce,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .line, .brief = "30-foot-long, 5-foot-wide line" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of rotten food" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Cover creatures in a line with persistent acid.",
    .{
        .desc = "Project acid in a 30-foot-long, 5-foot-wide line. Each creature in the line makes a Dexterity saving throw.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Failure",
                .desc = "On a failed save, a creature is coated in acid and takes 2d4 acid damage at the start of each of its turns.",
            },
            .{
                .table = null,
                .heading = "Removing the Acid",
                .desc = "The effect on a creature ends when the spell ends or when a creature uses an action to scrape or wash the acid off itself or another creature.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The acid damage becomes 4d4.", .desc_fields = null },
            .dice_rolls = &.{roll_4d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The acid damage becomes 6d4.", .desc_fields = null },
            .dice_rolls = &.{roll_6d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The acid damage becomes 8d4.", .desc_fields = null },
            .dice_rolls = &.{roll_8d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The acid damage becomes 10d4.", .desc_fields = null },
            .dice_rolls = &.{roll_10d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The acid damage becomes 12d4.", .desc_fields = null },
            .dice_rolls = &.{roll_12d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The acid damage becomes 14d4.", .desc_fields = null },
            .dice_rolls = &.{roll_14d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The acid damage becomes 16d4.", .desc_fields = null },
            .dice_rolls = &.{roll_16d4},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The acid damage becomes 18d4.", .desc_fields = null },
            .dice_rolls = &.{roll_18d4},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Artificer
    &.{roll_2d4},
    null,
);

pub const tashas_hideous_laughter: Spell = Spell.compInit(
    "Tasha's Hideous Laughter",
    .phb14,
    .level_1,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "tiny tarts and a feather waved in the air" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Overcome a creature with incapacitating laughter.",
    .{
        .desc = "A creature you can see within range makes a Wisdom saving throw.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Failed Save",
                .desc = "The target falls prone, becomes incapacitated, and cannot stand for the duration.",
            },
            .{
                .table = null,
                .heading = "Repeat Saves",
                .desc = "At the end of each of its turns and whenever it takes damage, the target can repeat the Wisdom save. A save triggered by damage is made with advantage; success ends the spell.",
            },
            .{
                .table = null,
                .heading = "Intelligence",
                .desc = "A creature with an Intelligence score of 4 or lower is unaffected.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const tensers_floating_disk: Spell = Spell.compInit(
    "Tenser's Floating Disk",
    .phb14,
    .level_1,
    .conjuration,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of mercury" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create a floating force disk that carries up to 500 pounds.",
    .{
        .desc = "Create a horizontal disk of force in an unoccupied space within range. It is 3 feet across, 1 inch thick, and floats 3 feet above the ground.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Capacity",
                .desc = "The disk can carry up to 500 pounds. Exceeding that capacity ends the spell and drops everything on it.",
            },
            .{
                .table = null,
                .heading = "Following",
                .desc = "While you are within 20 feet, the disk remains still. If you move farther away, it follows to remain within 20 feet.",
            },
            .{
                .table = null,
                .heading = "Terrain",
                .desc = "The disk can cross uneven ground, stairs, and slopes, but cannot cross an elevation change of 10 feet or more.",
            },
            .{
                .table = null,
                .heading = "Maximum Separation",
                .desc = "The spell ends if you become more than 100 feet from the disk.",
            },
        },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const thunderous_smite: Spell = Spell.compInit(
    "Thunderous Smite",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower your next melee weapon hit with thunder.",
    .{
        .desc = "The first melee weapon attack you hit with during the spell deals an extra 2d6 thunder damage.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Thunderclap",
                .desc = "The hit produces a thunderous sound audible up to 300 feet away.",
            },
            .{
                .table = null,
                .heading = "Push and Prone",
                .desc = "If the target is a creature, it makes a Strength saving throw. On a failure, it is pushed 10 feet away from you and knocked prone.",
            },
        },
    },
    null,
    &.{}, // Classes: Paladin
    &.{roll_2d6},
    null,
);

pub const thunderwave: Spell = Spell.compInit(
    "Thunderwave",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cube, .brief = "15-foot cube originating from you" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast creatures and unsecured objects away with thunderous force.",
    .{
        .desc = "Each creature in a 15-foot cube originating from you makes a Constitution saving throw.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Failed Save",
                .desc = "A creature takes 2d8 thunder damage and is pushed 10 feet away from you.",
            },
            .{
                .table = null,
                .heading = "Successful Save",
                .desc = "A creature takes half as much damage and is not pushed.",
            },
            .{
                .table = null,
                .heading = "Objects and Sound",
                .desc = "Unsecured objects completely within the area are pushed 10 feet away. The spell creates a thunderous boom audible up to 300 feet away.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
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
    &.{}, // Classes: Bard, Druid, Sorcerer, Wizard
    &.{roll_2d8},
    null,
);

pub const unseen_servant: Spell = Spell.compInit(
    "Unseen Servant",
    .phb14,
    .level_1,
    .conjuration,
    true,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a piece of string and a bit of wood" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create an invisible force that performs simple tasks.",
    .{
        .desc = "Create an invisible, mindless, shapeless Medium force in an unoccupied space on the ground within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Statistics",
                .desc = "The servant has AC 10, 1 hit point, and Strength 2. It cannot attack, and the spell ends if it reaches 0 hit points.",
            },
            .{
                .table = null,
                .heading = "Commands",
                .desc = "Once on each of your turns, you can use a bonus action to command it to move up to 15 feet and interact with an object or perform a simple task.",
            },
            .{
                .table = null,
                .heading = "Range",
                .desc = "The spell ends if a commanded task would move the servant more than 60 feet away from you.",
            },
        },
    },
    null,
    &.{}, // Classes: Bard, Warlock, Wizard
    null,
    null,
);

pub const witch_bolt: Spell = Spell.compInit(
    "Witch Bolt",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a twig from a tree struck by lightning" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a sustained arc of lightning to one creature.",
    .{
        .desc = "Make a ranged spell attack against a creature within range. On a hit, it takes 1d12 lightning damage and a sustained arc forms between you and it.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Sustained Damage",
                .desc = "On each of your turns while the spell continues, you can use your action to deal 1d12 lightning damage to the target automatically.",
            },
            .{
                .table = null,
                .heading = "Ending",
                .desc = "The spell ends if you use your action for anything else, if the target leaves the spell's range, or if it gains total cover from you.",
            },
        },
    },
    &.{
        .{
            .level = .{ .slot = .level_2 },
            .desc = .{ .desc = "The initial hit deals 2d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_3 },
            .desc = .{ .desc = "The initial hit deals 3d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_4 },
            .desc = .{ .desc = "The initial hit deals 4d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_5 },
            .desc = .{ .desc = "The initial hit deals 5d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_5d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_6 },
            .desc = .{ .desc = "The initial hit deals 6d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_6d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_7 },
            .desc = .{ .desc = "The initial hit deals 7d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_7d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "The initial hit deals 8d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_8d12, roll_1d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "The initial hit deals 9d12 lightning damage; the automatic damage on later turns remains 1d12.", .desc_fields = null },
            .dice_rolls = &.{ roll_9d12, roll_1d12 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{ roll_1d12, roll_1d12 },
    null,
);

pub const wrathful_smite: Spell = Spell.compInit(
    "Wrathful Smite",
    .phb14,
    .level_1,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Empower your next melee weapon hit with psychic damage and fear.",
    .{
        .desc = "The next melee weapon attack you hit with during the spell deals an extra 1d6 psychic damage.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Fear",
                .desc = "If the target is a creature, it makes a Wisdom saving throw. On a failure, it is frightened of you until the spell ends.",
            },
            .{
                .table = null,
                .heading = "Ending the Fear",
                .desc = "A frightened target can use its action to make a Wisdom check against your spell save DC; success ends the spell.",
            },
        },
    },
    null,
    &.{}, // Classes: Paladin
    &.{roll_1d6},
    null,
);

pub const zephyr_strike: Spell = Spell.compInit(
    "Zephyr Strike",
    .xge,
    .level_1,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Move without provoking opportunity attacks and empower one weapon attack.",
    .{
        .desc = "For the duration, your movement does not provoke opportunity attacks.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Empowered Attack",
                .desc = "Once before the spell ends, you can give yourself advantage on one weapon attack roll on your turn. On a hit, that attack deals an extra 1d8 force damage.",
            },
            .{
                .table = null,
                .heading = "Burst of Speed",
                .desc = "After that attack, whether it hits or misses, your walking speed increases by 30 feet until the end of the turn.",
            },
        },
    },
    null,
    &.{}, // Classes: Ranger
    &.{roll_1d8},
    null,
);

// ============================================================================
// Registry array
// ============================================================================

pub const level_1_spell_arr = [_]Spell{
    absorb_elements,
    alarm,
    animal_friendship,
    armor_of_agathys,
    arms_of_hadar,
    bane,
    beast_bond,
    bless,
    burning_hands,
    catapult,
    cause_fear,
    ceremony,
    chaos_bolt,
    charm_person,
    chromatic_orb,
    color_spray,
    command,
    compelled_duel,
    comprehend_languages,
    create_or_destroy_water,
    cure_wounds,
    detect_evil_and_good,
    detect_magic,
    detect_poison_and_disease,
    disguise_self,
    dissonant_whispers,
    distort_value,
    divine_favor,
    earth_tremor,
    ensnaring_strike,
    entangle,
    expeditious_retreat,
    faerie_fire,
    false_life,
    feather_fall,
    find_familiar,
    fog_cloud,
    frost_fingers,
    goodberry,
    grease,
    guiding_bolt,
    hail_of_thorns,
    healing_word,
    hellish_rebuke,
    heroism,
    hex,
    hunters_mark,
    ice_knife,
    identify,
    illusory_script,
    inflict_wounds,
    jims_magic_missile,
    jump,
    longstrider,
    mage_armor,
    magic_missile,
    protection_from_evil_and_good,
    purify_food_and_drink,
    ray_of_sickness,
    sanctuary,
    searing_smite,
    shield,
    shield_of_faith,
    silent_image,
    silvery_barbs,
    sleep,
    snare,
    speak_with_animals,
    tashas_caustic_brew,
    tashas_hideous_laughter,
    tensers_floating_disk,
    thunderous_smite,
    thunderwave,
    unseen_servant,
    witch_bolt,
    wrathful_smite,
    zephyr_strike,
};

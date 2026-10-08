const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Class definitions have not been implemented yet, so class hashes are left
// empty. The comments on each spell preserve the non-optional Wikidot spell
// lists for later population.
//
// Optional class-list entries are intentionally omitted.
//
// DiceRoll.roll is []const DiceModRoll, so the shared backing arrays are
// immutable compile-time data.

// ============================================================================
// Shared Dice Rolls
// ============================================================================

const roll_1d4_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false },
};
const roll_1d4: modifier.DiceRoll = .{ .roll = roll_1d4_parts[0..] };

const roll_2d4_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false },
};
const roll_2d4: modifier.DiceRoll = .{ .roll = roll_2d4_parts[0..] };

const roll_3d4_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d4 } }, .negative = false },
};
const roll_3d4: modifier.DiceRoll = .{ .roll = roll_3d4_parts[0..] };

const roll_4d4_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d4 } }, .negative = false },
};
const roll_4d4: modifier.DiceRoll = .{ .roll = roll_4d4_parts[0..] };

const roll_1d6_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
};
const roll_1d6: modifier.DiceRoll = .{ .roll = roll_1d6_parts[0..] };

const roll_2d6_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false },
};
const roll_2d6: modifier.DiceRoll = .{ .roll = roll_2d6_parts[0..] };

const roll_3d6_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d6 } }, .negative = false },
};
const roll_3d6: modifier.DiceRoll = .{ .roll = roll_3d6_parts[0..] };

const roll_4d6_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false },
};
const roll_4d6: modifier.DiceRoll = .{ .roll = roll_4d6_parts[0..] };

const roll_1d8_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
};
const roll_1d8: modifier.DiceRoll = .{ .roll = roll_1d8_parts[0..] };

const roll_2d8_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
};
const roll_2d8: modifier.DiceRoll = .{ .roll = roll_2d8_parts[0..] };

const roll_3d8_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false },
};
const roll_3d8: modifier.DiceRoll = .{ .roll = roll_3d8_parts[0..] };

const roll_4d8_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false },
};
const roll_4d8: modifier.DiceRoll = .{ .roll = roll_4d8_parts[0..] };

const roll_1d10_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false },
};
const roll_1d10: modifier.DiceRoll = .{ .roll = roll_1d10_parts[0..] };

const roll_2d10_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false },
};
const roll_2d10: modifier.DiceRoll = .{ .roll = roll_2d10_parts[0..] };

const roll_3d10_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d10 } }, .negative = false },
};
const roll_3d10: modifier.DiceRoll = .{ .roll = roll_3d10_parts[0..] };

const roll_4d10_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false },
};
const roll_4d10: modifier.DiceRoll = .{ .roll = roll_4d10_parts[0..] };

const roll_1d12_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d12 } }, .negative = false },
};
const roll_1d12: modifier.DiceRoll = .{ .roll = roll_1d12_parts[0..] };

const roll_2d12_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d12 } }, .negative = false },
};
const roll_2d12: modifier.DiceRoll = .{ .roll = roll_2d12_parts[0..] };

const roll_3d12_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d12 } }, .negative = false },
};
const roll_3d12: modifier.DiceRoll = .{ .roll = roll_3d12_parts[0..] };

const roll_4d12_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d12 } }, .negative = false },
};
const roll_4d12: modifier.DiceRoll = .{ .roll = roll_4d12_parts[0..] };

const roll_negative_1d4_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = true },
};
const roll_negative_1d4: modifier.DiceRoll = .{ .roll = roll_negative_1d4_parts[0..] };

const roll_spell_mod_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
};
const roll_spell_mod: modifier.DiceRoll = .{ .roll = roll_spell_mod_parts[0..] };

const roll_1d6_spell_mod_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false },
    .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
};
const roll_1d6_spell_mod: modifier.DiceRoll = .{ .roll = roll_1d6_spell_mod_parts[0..] };

const roll_1d8_spell_mod_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false },
    .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
};
const roll_1d8_spell_mod: modifier.DiceRoll = .{ .roll = roll_1d8_spell_mod_parts[0..] };

const roll_2d8_spell_mod_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d8 } }, .negative = false },
    .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
};
const roll_2d8_spell_mod: modifier.DiceRoll = .{ .roll = roll_2d8_spell_mod_parts[0..] };

const roll_3d8_spell_mod_parts = [_]modifier.DiceModRoll{
    .{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d8 } }, .negative = false },
    .{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false },
};
const roll_3d8_spell_mod: modifier.DiceRoll = .{ .roll = roll_3d8_spell_mod_parts[0..] };

// ============================================================================
// Cantrips
// ============================================================================

pub const acid_splash: Spell = Spell.compInit(
    "Acid Splash",
    .phb14,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "One or two nearby creatures make Dexterity saves or take acid damage.",
    .{ .desc = "Hurl acid at one visible creature, or at two visible creatures within 5 feet of each other. Each target that fails a Dexterity save takes acid damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
    },
    // Artificer, Sorcerer, Wizard
    &.{},
    &.{roll_1d6},
    null,
);

pub const blade_ward: Spell = Spell.compInit(
    "Blade Ward",
    .phb14,
    .cantrip,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Gain brief resistance to weapon bludgeoning, piercing, and slashing damage.",
    .{ .desc = "Until the end of your next turn, weapon attacks deal half bludgeoning, piercing, and slashing damage to you.", .desc_fields = null },
    null,
    // Bard, Sorcerer, Warlock, Wizard
    &.{},
    null,
    null,
);

pub const booming_blade: Spell = Spell.compInit(
    "Booming Blade",
    .tce,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = .radius,
        .brief = "5-foot radius",
    },
    .{ .v = false, .s = true, .m = true, .m_brief = "a melee weapon worth at least 1 sp" },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Make a weapon attack that punishes the target for willingly moving.",
    .{
        .desc = "Brandish the material weapon and make one melee attack with it against a creature within 5 feet.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "On Hit",
                .desc = "The weapon attack has its normal effects and wraps the target in booming energy until the start of your next turn.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "If the target willingly moves at least 5 feet before then, it takes thunder damage and the spell ends.",
            },
        },
    },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "The weapon hit deals an extra 1d8 thunder damage, and the movement damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8, roll_2d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "The weapon hit deals an extra 2d8 thunder damage, and the movement damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d8, roll_3d8 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "The weapon hit deals an extra 3d8 thunder damage, and the movement damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d8, roll_4d8 },
            .modifiers = null,
        },
    },
    // Artificer
    &.{},
    &.{roll_1d8},
    null,
);

pub const chill_touch: Spell = Spell.compInit(
    "Chill Touch",
    .phb14,
    .cantrip,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 120 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Ranged spell attack dealing necrotic damage and suppressing healing.",
    .{ .desc = "Create a spectral skeletal hand and make a ranged spell attack. On a hit, the target takes necrotic damage and cannot regain hit points until the start of your next turn; an undead target also has disadvantage on attacks against you until the end of your next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Sorcerer, Warlock, Wizard
    &.{},
    &.{roll_1d8},
    null,
);

pub const control_flames: Spell = Spell.compInit(
    "Control Flames",
    .xge,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = .cube,
        .brief = "5-foot cube",
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .brief = "Instantaneous or 1 hour",
    },
    "Manipulate a visible nonmagical flame in several minor ways.",
    .{
        .desc = "Manipulate one visible nonmagical flame that fits within a 5-foot cube.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Expand",
                .desc = "Instantly extend the flame up to 5 feet in one direction if fuel is available.",
            },
            .{
                .table = null,
                .heading = "Extinguish",
                .desc = "Instantly extinguish the flame within the affected cube.",
            },
            .{
                .table = null,
                .heading = "Light and Color",
                .desc = "For 1 hour, double or halve the flame's bright and dim light, change its color, or do both.",
            },
            .{
                .table = null,
                .heading = "Shapes",
                .desc = "For 1 hour, form simple animated shapes within the flame.",
            },
            .{
                .table = null,
                .heading = "Multiple Effects",
                .desc = "No more than three non-instantaneous effects from this spell can be active at once.",
            },
        },
    },
    null,
    // Druid, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const create_bonfire: Spell = Spell.compInit(
    "Create Bonfire",
    .xge,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = .cube,
        .brief = "5-foot cube",
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = true,
        .special = false,
        .brief = null,
    },
    "Create a damaging bonfire that occupies a 5-foot cube.",
    .{ .desc = "Create a bonfire on visible ground. A creature in its space when cast, entering it for the first time on a turn, or ending its turn there makes a Dexterity save or takes fire damage. The fire also ignites unattended flammable objects.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Artificer, Druid, Sorcerer, Warlock, Wizard
    &.{},
    &.{roll_1d8},
    null,
);

pub const dancing_lights: Spell = Spell.compInit(
    "Dancing Lights",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 120 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of phosphorus or wychwood, or a glowworm" },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = true,
        .special = false,
        .brief = null,
    },
    "Create and move up to four small magical lights.",
    .{
        .desc = "Create up to four hovering lights, or combine them into one glowing Medium humanoid form.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Light",
                .desc = "Each light sheds dim light in a 10-foot radius.",
            },
            .{
                .table = null,
                .heading = "Movement",
                .desc = "As a bonus action, move the lights up to 60 feet while keeping each within spell range and within 20 feet of another light.",
            },
        },
    },
    null,
    // Artificer, Bard, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const druidcraft: Spell = Spell.compInit(
    "Druidcraft",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Create a minor natural sign or effect.",
    .{
        .desc = "Create one minor nature effect within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Weather Sign",
                .desc = "Create a tiny sensory sign that predicts the local weather for the next 24 hours; the sign lasts 1 round.",
            },
            .{
                .table = null,
                .heading = "Bloom",
                .desc = "Instantly cause a flower, seed pod, or leaf bud to open.",
            },
            .{
                .table = null,
                .heading = "Sensory Effect",
                .desc = "Create a harmless instantaneous natural sensory effect that fits within a 5-foot cube.",
            },
            .{
                .table = null,
                .heading = "Flame",
                .desc = "Instantly light or extinguish a candle, torch, or small campfire.",
            },
        },
    },
    null,
    // Druid
    &.{},
    null,
    null,
);

pub const eldritch_blast: Spell = Spell.compInit(
    "Eldritch Blast",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 120 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Fire one or more beams of force at creatures within range.",
    .{ .desc = "Fire a beam of crackling energy and make a ranged spell attack. A hit deals force damage. At higher character levels, the spell creates additional beams; each beam uses its own attack roll and can target the same or different creatures.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Create two beams, each dealing 1d10 force damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_1d10 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Create three beams, each dealing 1d10 force damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_1d10, roll_1d10 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Create four beams, each dealing 1d10 force damage on a hit.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d10, roll_1d10, roll_1d10, roll_1d10 },
            .modifiers = null,
        },
    },
    // Warlock
    &.{},
    &.{roll_1d10},
    null,
);

pub const encode_thoughts: Spell = Spell.compInit(
    "Encode Thoughts",
    .ggr,
    .cantrip,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .{ .duration = .{ .unit = .hour, .count = 8 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Turn a memory, idea, or message into a tangible thought strand.",
    .{
        .desc = "Turn a memory, idea, or message into a tangible glowing thought strand that lasts for 8 hours or until you cast the spell again.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Your Thoughts",
                .desc = "The strand appears nearby as a Tiny, weightless, semisolid ribbon-like object that can be carried.",
            },
            .{
                .table = null,
                .heading = "Read Thoughts",
                .desc = "While using magic that reads or manipulates another creature's thoughts, you can encode those thoughts instead of your own.",
            },
            .{
                .table = null,
                .heading = "Read a Strand",
                .desc = "Casting this spell while holding a thought strand immediately reveals its stored memory, idea, or message.",
            },
        },
    },
    null,
    // none (or only optional class-list entries on Wikidot)
    &.{},
    null,
    null,
);

pub const fire_bolt: Spell = Spell.compInit(
    "Fire Bolt",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 120 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Ranged spell attack dealing fire damage; unattended flammables can ignite.",
    .{ .desc = "Hurl a mote of fire at a creature or object. Make a ranged spell attack; on a hit, the target takes fire damage. A flammable object that is not worn or carried ignites.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d10.", .desc_fields = null },
            .dice_rolls = &.{roll_2d10},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d10},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
    },
    // Artificer, Sorcerer, Wizard
    &.{},
    &.{roll_1d10},
    null,
);

pub const friends: Spell = Spell.compInit(
    "Friends",
    .phb14,
    .cantrip,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = false, .s = true, .m = true, .m_brief = "a small amount of makeup applied to the face as this spell is cast" },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = true,
        .special = false,
        .brief = null,
    },
    "Gain advantage on Charisma checks against one nonhostile creature, which realizes the manipulation afterward.",
    .{ .desc = "Choose one creature that is not hostile toward you. For the duration, you have advantage on Charisma checks directed at it. When the spell ends, the creature realizes magic influenced its mood and may become hostile or seek retribution.", .desc_fields = null },
    null,
    // Bard, Sorcerer, Warlock, Wizard
    &.{},
    null,
    null,
);

pub const frostbite: Spell = Spell.compInit(
    "Frostbite",
    .xge,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Constitution save for cold damage and disadvantage on the target's next weapon attack.",
    .{ .desc = "Numbing frost forms on one visible creature. On a failed Constitution save, it takes cold damage and has disadvantage on the next weapon attack roll it makes before the end of its next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
    },
    // Druid, Sorcerer, Warlock, Wizard, Artificer
    &.{},
    &.{roll_1d6},
    null,
);

pub const green_flame_blade: Spell = Spell.compInit(
    "Green-Flame Blade",
    .tce,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = .radius,
        .brief = "5-foot radius",
    },
    .{ .v = false, .s = true, .m = true, .m_brief = "a melee weapon worth at least 1 sp" },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Make a weapon attack and leap fire to a second nearby creature.",
    .{
        .desc = "Brandish the material weapon and make one melee attack with it against a creature within 5 feet.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Primary Target",
                .desc = "On a hit, the target suffers the weapon attack's normal effects.",
            },
            .{
                .table = null,
                .heading = "Secondary Target",
                .desc = "Green fire can leap to a different visible creature within 5 feet of the first target, dealing fire damage equal to your spellcasting ability modifier.",
            },
        },
    },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "The weapon hit deals an extra 1d8 fire damage; the secondary target takes 1d8 plus your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{ roll_1d8, roll_1d8_spell_mod },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "The weapon hit deals an extra 2d8 fire damage; the secondary target takes 2d8 plus your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d8, roll_2d8_spell_mod },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "The weapon hit deals an extra 3d8 fire damage; the secondary target takes 3d8 plus your spellcasting ability modifier.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d8, roll_3d8_spell_mod },
            .modifiers = null,
        },
    },
    // Artificer
    &.{},
    &.{roll_spell_mod},
    null,
);

pub const guidance: Spell = Spell.compInit(
    "Guidance",
    .phb14,
    .cantrip,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = true,
        .special = false,
        .brief = null,
    },
    "A willing creature can add 1d4 to one ability check before the spell ends.",
    .{ .desc = "Touch one willing creature. Once before the spell ends, it can roll a d4 and add the result to one ability check, choosing to roll before or after the check. The spell then ends.", .desc_fields = null },
    null,
    // Artificer, Cleric, Druid
    &.{},
    &.{roll_1d4},
    null,
);

pub const gust: Spell = Spell.compInit(
    "Gust",
    .xge,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Create a small gust that can push a creature, move an object, or make a harmless effect.",
    .{
        .desc = "Compel the air at a point you can see within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Push Creature",
                .desc = "A Medium or smaller creature makes a Strength save or is pushed up to 5 feet away from you.",
            },
            .{
                .table = null,
                .heading = "Move Object",
                .desc = "Push an unattended object weighing no more than 5 pounds up to 10 feet away; this does not deal damage.",
            },
            .{
                .table = null,
                .heading = "Sensory Effect",
                .desc = "Create a harmless air-based sensory effect.",
            },
        },
    },
    null,
    // Druid, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const infestation: Spell = Spell.compInit(
    "Infestation",
    .xge,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "a living flea" },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Constitution save for poison damage and possible random 5-foot movement.",
    .{
        .desc = "Momentarily cover one visible creature in parasites. On a failed Constitution save it takes poison damage and may move 5 feet in a random direction.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "d4", "Direction" },
                    .table_entry = &.{
                        &.{ .{ .int = 1 }, .{ .str = "North" } },
                        &.{ .{ .int = 2 }, .{ .str = "South" } },
                        &.{ .{ .int = 3 }, .{ .str = "East" } },
                        &.{ .{ .int = 4 }, .{ .str = "West" } },
                    },
                },
                .heading = "Forced Movement",
                .desc = "If the target can move and has at least 5 feet of speed, roll a d4 for direction. This movement does not provoke opportunity attacks; blocked movement is ignored.",
            },
        },
    },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6; the random movement roll remains 1d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_1d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6; the random movement roll remains 1d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d6, roll_1d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6; the random movement roll remains 1d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d6, roll_1d4 },
            .modifiers = null,
        },
    },
    // Druid, Sorcerer, Warlock, Wizard
    &.{},
    &.{ roll_1d6, roll_1d4 },
    null,
);

pub const light: Spell = Spell.compInit(
    "Light",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = false, .m = true, .m_brief = "a firefly or phosphorescent moss" },
    .{
        .duration = .{ .duration = .{ .unit = .hour, .count = 1 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Make a touched object shed bright and dim light for 1 hour.",
    .{
        .desc = "Touch an object no larger than 10 feet in any dimension and make it glow for 1 hour.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Light",
                .desc = "The object sheds bright light for 20 feet and dim light for another 20 feet. Opaque cover blocks the light.",
            },
            .{
                .table = null,
                .heading = "Hostile Holder",
                .desc = "If the object is worn or held by a hostile creature, that creature can avoid the effect with a Dexterity saving throw.",
            },
        },
    },
    null,
    // Artificer, Bard, Cleric, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const lightning_lure: Spell = Spell.compInit(
    "Lightning Lure",
    .tce,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = .radius,
        .brief = "15-foot radius",
    },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Pull a creature toward you; if it ends within 5 feet, deal lightning damage.",
    .{ .desc = "Choose one visible creature within 15 feet. On a failed Strength save, it is pulled up to 10 feet straight toward you and then takes lightning damage if it is within 5 feet of you.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Artificer
    &.{},
    &.{roll_1d8},
    null,
);

pub const mage_hand: Spell = Spell.compInit(
    "Mage Hand",
    .phb14,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Create a spectral hand that can manipulate light objects at a distance.",
    .{
        .desc = "Create a spectral floating hand at a point within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Control",
                .desc = "Use your action to move the hand up to 30 feet and manipulate objects, open unlocked doors or containers, stow or retrieve items, or pour out a vial.",
            },
            .{
                .table = null,
                .heading = "Limits",
                .desc = "The hand cannot attack, activate magic items, or carry more than 10 pounds. It vanishes if it moves more than 30 feet from you or if you cast the spell again.",
            },
        },
    },
    null,
    // Artificer, Bard, Sorcerer, Warlock, Wizard
    &.{},
    null,
    null,
);

pub const magic_stone: Spell = Spell.compInit(
    "Magic Stone",
    .xge,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Imbue up to three pebbles that can make ranged spell attacks.",
    .{
        .desc = "Imbue one to three pebbles with magic for 1 minute.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Attack",
                .desc = "A creature can throw an imbued pebble or fire it from a sling as a ranged spell attack. A thrown pebble has a 60-foot range.",
            },
            .{
                .table = null,
                .heading = "Borrowed Magic",
                .desc = "If another creature attacks with a pebble, it uses your spellcasting ability modifier for the attack and damage.",
            },
            .{
                .table = null,
                .heading = "Damage",
                .desc = "On a hit, a pebble deals 1d6 bludgeoning damage plus your spellcasting ability modifier. The spell ends on that pebble after the attack.",
            },
        },
    },
    null,
    // Druid, Warlock, Artificer
    &.{},
    &.{roll_1d6_spell_mod},
    null,
);

pub const mending: Spell = Spell.compInit(
    "Mending",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "two lodestones" },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Repair a small break or tear in a touched object.",
    .{
        .desc = "Repair one break or tear in an object you touch.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Size Limit",
                .desc = "The damaged area can be no larger than 1 foot in any dimension, and the repair leaves no trace of the former break.",
            },
            .{
                .table = null,
                .heading = "Magic Objects",
                .desc = "The spell can physically repair a magic item or construct, but it cannot restore lost magic.",
            },
        },
    },
    null,
    // Artificer, Bard, Cleric, Druid, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const message: Spell = Spell.compInit(
    "Message",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 120 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "a short piece of copper wire" },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Whisper privately to a creature within range and allow a private whispered reply.",
    .{
        .desc = "Whisper a message to one creature within range; only the target hears it and can whisper a reply that only you hear.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Barriers",
                .desc = "The spell can pass through ordinary barriers when you know the target is beyond them, but magical silence, thick stone or wood, common metal, or lead can block it.",
            },
            .{
                .table = null,
                .heading = "Path",
                .desc = "The message does not need to travel in a straight line and can pass around corners or through openings.",
            },
        },
    },
    null,
    // Artificer, Bard, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const mind_sliver: Spell = Spell.compInit(
    "Mind Sliver",
    .tce,
    .cantrip,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Intelligence save for psychic damage and a 1d4 penalty to the target's next saving throw.",
    .{ .desc = "Drive a disorienting spike into one visible creature's mind. On a failed Intelligence save, it takes psychic damage and subtracts 1d4 from its next saving throw made before the end of your next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Psychic damage becomes 2d6; the saving-throw penalty remains 1d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d6, roll_negative_1d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Psychic damage becomes 3d6; the saving-throw penalty remains 1d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d6, roll_negative_1d4 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Psychic damage becomes 4d6; the saving-throw penalty remains 1d4.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d6, roll_negative_1d4 },
            .modifiers = null,
        },
    },
    // none (or only optional class-list entries on Wikidot)
    &.{},
    &.{ roll_1d6, roll_negative_1d4 },
    null,
);

pub const minor_illusion: Spell = Spell.compInit(
    "Minor Illusion",
    .phb14,
    .cantrip,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = false, .s = true, .m = true, .m_brief = "a bit of fleece" },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Create a sound or a small image illusion.",
    .{
        .desc = "Create either a sound or an image of an object within range for the duration.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Sound",
                .desc = "Create a sound from a whisper to a scream. It can continue or occur as separate sounds during the duration.",
            },
            .{
                .table = null,
                .heading = "Image",
                .desc = "Create an image of an object no larger than a 5-foot cube. It cannot produce sound, light, smell, or another sensory effect, and physical interaction reveals the illusion.",
            },
            .{
                .table = null,
                .heading = "Investigation",
                .desc = "A creature that examines the illusion can identify it with a successful Intelligence (Investigation) check against your spell save DC.",
            },
        },
    },
    null,
    // Bard, Sorcerer, Warlock, Wizard
    &.{},
    null,
    null,
);

pub const mold_earth: Spell = Spell.compInit(
    "Mold Earth",
    .xge,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = .cube,
        .brief = "5-foot cube",
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .brief = "Instantaneous or 1 hour",
    },
    "Manipulate a visible 5-foot cube of dirt or stone.",
    .{
        .desc = "Manipulate a visible 5-foot cube of dirt or stone.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Excavate",
                .desc = "Instantly move loose earth along the ground and deposit it up to 5 feet away without dealing damage.",
            },
            .{
                .table = null,
                .heading = "Shapes and Colors",
                .desc = "Create words, images, patterns, shapes, or colors in the material for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Terrain",
                .desc = "Make ground difficult terrain, or restore difficult ground to normal terrain, for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Multiple Effects",
                .desc = "No more than two non-instantaneous effects from this spell can be active at once.",
            },
        },
    },
    null,
    // Druid, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const poison_spray: Spell = Spell.compInit(
    "Poison Spray",
    .phb14,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 10 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Constitution save or take poison damage.",
    .{ .desc = "Project a puff of noxious gas at one visible creature. On a failed Constitution save, it takes poison damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d12.", .desc_fields = null },
            .dice_rolls = &.{roll_2d12},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d12.", .desc_fields = null },
            .dice_rolls = &.{roll_3d12},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d12.", .desc_fields = null },
            .dice_rolls = &.{roll_4d12},
            .modifiers = null,
        },
    },
    // Artificer, Druid, Sorcerer, Warlock, Wizard
    &.{},
    &.{roll_1d12},
    null,
);

pub const prestidigitation: Spell = Spell.compInit(
    "Prestidigitation",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 10 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .brief = "Instantaneous, until end of next turn, or up to 1 hour",
    },
    "Perform one of several minor magical tricks.",
    .{
        .desc = "Perform one minor magical trick within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Sensory Effect",
                .desc = "Create an instantaneous harmless sensory effect.",
            },
            .{
                .table = null,
                .heading = "Flame",
                .desc = "Instantly light or extinguish a candle, torch, or small campfire.",
            },
            .{
                .table = null,
                .heading = "Clean or Soil",
                .desc = "Instantly clean or soil an object no larger than 1 cubic foot.",
            },
            .{
                .table = null,
                .heading = "Temperature or Flavor",
                .desc = "Warm, chill, or flavor up to 1 cubic foot of nonliving material for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Mark",
                .desc = "Place a color, small mark, or symbol on an object or surface for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Trinket or Image",
                .desc = "Create a hand-sized nonmagical trinket or illusory image until the end of your next turn.",
            },
            .{
                .table = null,
                .heading = "Multiple Effects",
                .desc = "Up to three non-instantaneous effects can be active at the same time.",
            },
        },
    },
    null,
    // Artificer, Bard, Sorcerer, Warlock, Wizard
    &.{},
    null,
    null,
);

pub const primal_savagery: Spell = Spell.compInit(
    "Primal Savagery",
    .xge,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Melee spell attack dealing acid damage.",
    .{ .desc = "Temporarily sharpen your teeth or fingernails and make a melee spell attack against a creature within 5 feet. On a hit, deal acid damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d10.", .desc_fields = null },
            .dice_rolls = &.{roll_2d10},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d10.", .desc_fields = null },
            .dice_rolls = &.{roll_3d10},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d10.", .desc_fields = null },
            .dice_rolls = &.{roll_4d10},
            .modifiers = null,
        },
    },
    // Druid
    &.{},
    &.{roll_1d10},
    null,
);

pub const produce_flame: Spell = Spell.compInit(
    "Produce Flame",
    .phb14,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 10 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Create a small flame for light or throw it as a ranged spell attack.",
    .{
        .desc = "Create a harmless flame in your hand for up to 10 minutes.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Light",
                .desc = "The flame sheds bright light for 10 feet and dim light for another 10 feet.",
            },
            .{
                .table = null,
                .heading = "Attack",
                .desc = "When cast or as an action later, you can hurl the flame at a creature within 30 feet. A hit deals fire damage and ends the spell.",
            },
        },
    },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Druid
    &.{},
    &.{roll_1d8},
    null,
);

pub const ray_of_frost: Spell = Spell.compInit(
    "Ray of Frost",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Ranged spell attack dealing cold damage and reducing speed by 10 feet.",
    .{ .desc = "Fire a frigid ray and make a ranged spell attack. On a hit, the target takes cold damage and its speed is reduced by 10 feet until the start of your next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Artificer, Sorcerer, Wizard
    &.{},
    &.{roll_1d8},
    null,
);

pub const resistance: Spell = Spell.compInit(
    "Resistance",
    .phb14,
    .cantrip,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "a miniature cloak" },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = true,
        .special = false,
        .brief = null,
    },
    "A willing creature can add 1d4 to one saving throw before the spell ends.",
    .{ .desc = "Touch one willing creature. Once before the spell ends, it can roll a d4 and add the result to one saving throw, choosing to roll before or after the save. The spell then ends.", .desc_fields = null },
    null,
    // Artificer, Cleric, Druid
    &.{},
    &.{roll_1d4},
    null,
);

pub const sacred_flame: Spell = Spell.compInit(
    "Sacred Flame",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Dexterity save or take radiant damage; cover does not help the save.",
    .{ .desc = "Radiance descends on one visible creature. On a failed Dexterity save, it takes radiant damage. The target receives no benefit from cover for this saving throw.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Cleric
    &.{},
    &.{roll_1d8},
    null,
);

pub const shape_water: Spell = Spell.compInit(
    "Shape Water",
    .xge,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = .cube,
        .brief = "5-foot cube",
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .brief = "Instantaneous or 1 hour",
    },
    "Manipulate a visible 5-foot cube of water.",
    .{
        .desc = "Manipulate a visible area of water that fits within a 5-foot cube.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Flow",
                .desc = "Instantly move or redirect the water up to 5 feet without enough force to deal damage.",
            },
            .{
                .table = null,
                .heading = "Shape",
                .desc = "Form and animate simple water shapes for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Color or Opacity",
                .desc = "Change the water's color or opacity uniformly for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Freeze",
                .desc = "Freeze water containing no creatures for 1 hour.",
            },
            .{
                .table = null,
                .heading = "Multiple Effects",
                .desc = "No more than two non-instantaneous effects can be active at once.",
            },
        },
    },
    null,
    // Druid, Sorcerer, Wizard
    &.{},
    null,
    null,
);

pub const shillelagh: Spell = Spell.compInit(
    "Shillelagh",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "mistletoe, a shamrock leaf, and a club or quarterstaff" },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .count = 1 } },
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Empower a held club or quarterstaff with a d8 damage die and your spellcasting ability.",
    .{ .desc = "Imbue a club or quarterstaff you are holding. You can use your spellcasting ability instead of Strength for its melee attack and damage rolls, its damage die becomes a d8, and it counts as magical. The spell ends if you cast it again or release the weapon.", .desc_fields = null },
    null,
    // Druid
    &.{},
    &.{roll_1d8_spell_mod},
    null,
);

pub const shocking_grasp: Spell = Spell.compInit(
    "Shocking Grasp",
    .phb14,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Melee spell attack dealing lightning damage and suppressing reactions.",
    .{ .desc = "Make a melee spell attack with a jolt of lightning, with advantage against a target wearing metal armor. On a hit, deal lightning damage and prevent the target from taking reactions until the start of its next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8.", .desc_fields = null },
            .dice_rolls = &.{roll_2d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8.", .desc_fields = null },
            .dice_rolls = &.{roll_3d8},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8.", .desc_fields = null },
            .dice_rolls = &.{roll_4d8},
            .modifiers = null,
        },
    },
    // Artificer, Sorcerer, Wizard
    &.{},
    &.{roll_1d8},
    null,
);

pub const spare_the_dying: Spell = Spell.compInit(
    "Spare the Dying",
    .phb14,
    .cantrip,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .touch, .count = 0 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Stabilize a living creature at 0 hit points.",
    .{ .desc = "Touch a living creature at 0 hit points and stabilize it. The spell does not affect undead or constructs.", .desc_fields = null },
    null,
    // Artificer, Cleric
    &.{},
    null,
    null,
);

pub const sword_burst: Spell = Spell.compInit(
    "Sword Burst",
    .tce,
    .cantrip,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = .radius,
        .brief = "5-foot radius",
    },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Creatures around you make Dexterity saves or take force damage.",
    .{ .desc = "Create a momentary circle of spectral blades. Every other creature within 5 feet of you makes a Dexterity save or takes force damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
    },
    // Artificer
    &.{},
    &.{roll_1d6},
    null,
);

pub const thaumaturgy: Spell = Spell.compInit(
    "Thaumaturgy",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .brief = "Instantaneous or up to 1 minute",
    },
    "Create one of several minor supernatural signs.",
    .{
        .desc = "Manifest one minor supernatural sign within range.",
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Voice",
                .desc = "Make your voice up to three times louder for 1 minute.",
            },
            .{
                .table = null,
                .heading = "Flames",
                .desc = "Cause flames to flicker, brighten, dim, or change color for 1 minute.",
            },
            .{
                .table = null,
                .heading = "Tremors",
                .desc = "Create harmless ground tremors for 1 minute.",
            },
            .{
                .table = null,
                .heading = "Sound",
                .desc = "Create an instantaneous sound at a point within range.",
            },
            .{
                .table = null,
                .heading = "Door or Window",
                .desc = "Instantly open or slam shut an unlocked door or window.",
            },
            .{
                .table = null,
                .heading = "Eyes",
                .desc = "Alter the appearance of your eyes for 1 minute.",
            },
            .{
                .table = null,
                .heading = "Multiple Effects",
                .desc = "Up to three 1-minute effects can be active at the same time.",
            },
        },
    },
    null,
    // Cleric
    &.{},
    null,
    null,
);

pub const thorn_whip: Spell = Spell.compInit(
    "Thorn Whip",
    .phb14,
    .cantrip,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = true, .m_brief = "the stem of a plant with thorns" },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Melee spell attack at range that can pull a Large or smaller creature closer.",
    .{ .desc = "Create a thorn-covered vine and make a melee spell attack against a creature within range. On a hit, deal piercing damage and pull a Large or smaller target up to 10 feet closer to you.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
    },
    // Artificer, Druid
    &.{},
    &.{roll_1d6},
    null,
);

pub const thunderclap: Spell = Spell.compInit(
    "Thunderclap",
    .xge,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .self, .count = 0 },
        .shape = .radius,
        .brief = "5-foot radius",
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Nearby creatures make Constitution saves or take thunder damage; the sound carries 100 feet.",
    .{ .desc = "Create a burst of thunder audible from 100 feet away. Each creature other than you within 5 feet makes a Constitution save or takes thunder damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
    },
    // Bard, Druid, Sorcerer, Warlock, Wizard, Artificer
    &.{},
    &.{roll_1d6},
    null,
);

pub const toll_the_dead: Spell = Spell.compInit(
    "Toll the Dead",
    .xge,
    .cantrip,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Wisdom save for necrotic damage, using a larger die against an injured target.",
    .{
        .desc = "A visible creature hears a dolorous bell and makes a Wisdom save. On a failure it takes necrotic damage.",
        .desc_fields = &.{
            .{
                .table = .{
                    .headings = &.{ "Target", "Base Damage" },
                    .table_entry = &.{
                        &.{ .{ .str = "Not missing hit points" }, .{ .str = "1d8 necrotic" } },
                        &.{ .{ .str = "Missing any hit points" }, .{ .str = "1d12 necrotic" } },
                    },
                },
                .heading = "Damage Die",
                .desc = "The damage die depends on whether the target is already injured.",
            },
        },
    },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d8, or 2d12 if the target is missing hit points.", .desc_fields = null },
            .dice_rolls = &.{ roll_2d8, roll_2d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d8, or 3d12 if the target is missing hit points.", .desc_fields = null },
            .dice_rolls = &.{ roll_3d8, roll_3d12 },
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d8, or 4d12 if the target is missing hit points.", .desc_fields = null },
            .dice_rolls = &.{ roll_4d8, roll_4d12 },
            .modifiers = null,
        },
    },
    // Cleric, Warlock, Wizard
    &.{},
    &.{ roll_1d8, roll_1d12 },
    null,
);

pub const true_strike: Spell = Spell.compInit(
    "True Strike",
    .phb14,
    .cantrip,
    .divination,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 30 },
        .shape = null,
        .brief = null,
    },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{
        .duration = .round,
        .concentration = true,
        .special = false,
        .brief = null,
    },
    "Gain advantage on your first attack against the chosen target on your next turn.",
    .{ .desc = "Choose a target within range and briefly study its defenses. On your next turn, you have advantage on your first attack roll against that target if the spell is still active.", .desc_fields = null },
    null,
    // Bard, Sorcerer, Warlock, Wizard
    &.{},
    null,
    null,
);

pub const vicious_mockery: Spell = Spell.compInit(
    "Vicious Mockery",
    .phb14,
    .cantrip,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 60 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Wisdom save for psychic damage and disadvantage on the target's next attack roll.",
    .{ .desc = "Lace an insult with enchantment against a creature that can hear you. On a failed Wisdom save, it takes psychic damage and has disadvantage on its next attack roll before the end of its next turn.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d4.", .desc_fields = null },
            .dice_rolls = &.{roll_2d4},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d4.", .desc_fields = null },
            .dice_rolls = &.{roll_3d4},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d4.", .desc_fields = null },
            .dice_rolls = &.{roll_4d4},
            .modifiers = null,
        },
    },
    // Bard
    &.{},
    &.{roll_1d4},
    null,
);

pub const word_of_radiance: Spell = Spell.compInit(
    "Word of Radiance",
    .xge,
    .cantrip,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{
        .distance = .{ .unit = .foot, .count = 5 },
        .shape = null,
        .brief = null,
    },
    .{ .v = true, .s = false, .m = true, .m_brief = "a holy symbol" },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .brief = null,
    },
    "Chosen visible creatures within 5 feet make Constitution saves or take radiant damage.",
    .{ .desc = "Utter a divine word and erupt with radiance. Each creature of your choice that you can see within 5 feet makes a Constitution save or takes radiant damage.", .desc_fields = null },
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = .{ .desc = "Damage becomes 2d6.", .desc_fields = null },
            .dice_rolls = &.{roll_2d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 11 },
            .desc = .{ .desc = "Damage becomes 3d6.", .desc_fields = null },
            .dice_rolls = &.{roll_3d6},
            .modifiers = null,
        },
        .{
            .level = .{ .character = 17 },
            .desc = .{ .desc = "Damage becomes 4d6.", .desc_fields = null },
            .dice_rolls = &.{roll_4d6},
            .modifiers = null,
        },
    },
    // Cleric
    &.{},
    &.{roll_1d6},
    null,
);

// ============================================================================
// Definition Array
// ============================================================================

pub const cantrip_arr = [_]Spell{
    acid_splash,
    blade_ward,
    booming_blade,
    chill_touch,
    control_flames,
    create_bonfire,
    dancing_lights,
    druidcraft,
    eldritch_blast,
    encode_thoughts,
    fire_bolt,
    friends,
    frostbite,
    green_flame_blade,
    guidance,
    gust,
    infestation,
    light,
    lightning_lure,
    mage_hand,
    magic_stone,
    mending,
    message,
    mind_sliver,
    minor_illusion,
    mold_earth,
    poison_spray,
    prestidigitation,
    primal_savagery,
    produce_flame,
    ray_of_frost,
    resistance,
    sacred_flame,
    shape_water,
    shillelagh,
    shocking_grasp,
    spare_the_dying,
    sword_burst,
    thaumaturgy,
    thorn_whip,
    thunderclap,
    toll_the_dead,
    true_strike,
    vicious_mockery,
    word_of_radiance,
};

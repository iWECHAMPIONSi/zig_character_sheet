const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 7 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// only non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_1: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 1 }, .negative = false }},
};

const roll_10d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d10 } }, .negative = false }},
};

const roll_10d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false }},
};

const roll_12d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d6 } }, .negative = false }},
};

const roll_13d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 13, .dice = &dice.d6 } }, .negative = false }},
};

const roll_14d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d6 } }, .negative = false }},
};

const roll_1d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }},
};

const roll_1d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }},
};

const roll_1d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d8 } }, .negative = false }},
};

const roll_3d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d10 } }, .negative = false }},
};

const roll_3d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d6 } }, .negative = false }},
};

const roll_4d12: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d12 } }, .negative = false }},
};

const roll_4d8_plus_15: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 15 }, .negative = false } },
};

const roll_6d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 6, .dice = &dice.d8 } }, .negative = false }},
};

const roll_7d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d10 } }, .negative = false }},
};

const roll_7d8_plus_30: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d8 } }, .negative = false }, .{ .roll = .{ .flat = 30 }, .negative = false } },
};

const roll_negative_1d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = true }},
};

const roll_spell_mod: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .mod = .{ .dice_mod = .spell_mod, .count = 1 } }, .negative = false }},
};

// ============================================================================
// Level 7 spells
// ============================================================================

pub const conjure_celestial: Spell = Spell.compInit(
    "Conjure Celestial",
    .phb14,
    .level_7,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Summon a friendly celestial of limited challenge rating.",
    .{ .desc = "A celestial of challenge rating 4 or lower appears in an unoccupied space you can see. It has its own initiative, follows verbal commands that do not violate its alignment, and disappears when reduced to 0 hit points or when the spell ends.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Maximum celestial challenge rating becomes 5.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const create_magen: Spell = Spell.compInit(
    "Create Magen",
    .idrotf,
    .level_7,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a vial of quicksilver worth 500 gp and a life-sized human doll, both consumed, plus an intricate crystal rod worth at least 1,500 gp that is not consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a permanently obedient magen from a prepared life-sized doll.",
    .{ .desc = "At the end of the casting, the prepared doll transforms into a magen of a type you choose. Creating it permanently reduces your hit point maximum by the magen's challenge rating, with a minimum reduction of 1; only wish can undo that reduction. The magen obeys your commands.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const crown_of_stars: Spell = Spell.compInit(
    "Crown of Stars",
    .xge,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Create seven radiant motes that can be fired one at a time.",
    .{ .desc = "Seven star-like motes orbit you. As a bonus action, expend one mote to make a ranged spell attack against a creature or object within 120 feet; a hit deals 4d12 radiant damage. The motes also shed light, with brightness depending on how many remain.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Create 9 motes. Each mote still deals 4d12 radiant damage.", .desc_fields = null },
            .dice_rolls = &.{roll_4d12},
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Create 11 motes. Each mote still deals 4d12 radiant damage.", .desc_fields = null },
            .dice_rolls = &.{roll_4d12},
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_4d12},
    null,
);

pub const delayed_blast_fireball: Spell = Spell.compInit(
    "Delayed Blast Fireball",
    .phb14,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "20-foot-radius explosion" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny ball of bat guano and sulfur" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a delayed fireball whose damage grows while concentration continues.",
    .{
        .desc = "A glowing bead remains at a point in range until the spell detonates. Creatures in the resulting sphere make Dexterity saves, taking full accumulated fire damage on a failure and half on a success.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Accumulation",
            .desc = "The bead begins at the spell's base damage and gains another 1d6 damage at the end of each of your turns before it detonates.",
        }, .{
            .table = null,
            .heading = "Early Detonation",
            .desc = "Touching the bead can detonate it immediately on a failed Dexterity save; on a success, the creature can throw it up to 40 feet before it explodes.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Base damage becomes 13d6; it still accumulates 1d6 per turn before detonation.", .desc_fields = null },
            .dice_rolls = &.{ roll_13d6, roll_1d6 },
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Base damage becomes 14d6; it still accumulates 1d6 per turn before detonation.", .desc_fields = null },
            .dice_rolls = &.{ roll_14d6, roll_1d6 },
            .modifiers = null,
        },
    },
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_12d6, roll_1d6 },
    null,
);

pub const divine_word: Spell = Spell.compInit(
    "Divine Word",
    .phb14,
    .level_7,
    .evocation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Utter a divine word whose effect depends on each target's current hit points.",
    .{
        .desc = "Choose any number of creatures you can see in range that can hear you. Each makes a Charisma save. Celestials, elementals, fey, and fiends that fail are also returned to their home plane and barred from returning for 24 hours except by wish.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "Current HP", "Failed-Save Effect" },
                .table_entry = &.{ &.{ .{ .str = "50 or fewer" }, .{ .str = "Deafened for 1 minute" } }, &.{ .{ .str = "40 or fewer" }, .{ .str = "Deafened and blinded for 10 minutes" } }, &.{ .{ .str = "30 or fewer" }, .{ .str = "Blinded, deafened, and stunned for 1 hour" } }, &.{ .{ .str = "20 or fewer" }, .{ .str = "Killed instantly" } } },
            },
            .heading = "Hit Point Thresholds",
            .desc = null,
        }},
    },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const draconic_transformation: Spell = Spell.compInit(
    "Draconic Transformation",
    .ftd,
    .level_7,
    .transmutation,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a statuette of a dragon worth at least 500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Temporarily gain draconic senses, breath, and flight.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Blindsight",
            .desc = "Gain blindsight to 30 feet, including the ability to perceive invisible creatures that are not successfully hidden.",
        }, .{
            .table = null,
            .heading = "Breath Weapon",
            .desc = "When cast and as a bonus action on later turns, exhale a 60-foot cone; creatures make Dexterity saves against 6d8 force damage.",
        }, .{
            .table = null,
            .heading = "Wings",
            .desc = "Gain a 60-foot flying speed.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_6d8},
    null,
);

pub const dream_of_the_blue_veil: Spell = Spell.compInit(
    "Dream of the Blue Veil",
    .tce,
    .level_7,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 20 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a magic item or a willing creature from the destination world" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 6 } }, .concentration = false, .special = false, .brief = null },
    "Transport a group to another world of the Material Plane after a shared magical dream.",
    .{
        .desc = "You and up to eight willing creatures fall unconscious and experience visions of another world.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Destination Link",
            .desc = "Casting requires either a magic item from the destination world or an affected creature born there.",
        }, .{
            .table = null,
            .heading = "Travel",
            .desc = "If the full 6-hour duration completes, affected creatures are transported to a safe location near the magic item's origin or the native creature's birthplace.",
        }, .{
            .table = null,
            .heading = "Interruption",
            .desc = "Damage ends the effect early for that creature. If you take damage, the spell ends for everyone and nobody is transported.",
        } },
    },
    null,
    &.{}, // Classes: none (all listed classes are optional)
    null,
    null,
);

pub const etherealness: Spell = Spell.compInit(
    "Etherealness",
    .phb14,
    .level_7,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Enter the Border Ethereal for up to eight hours.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Border Ethereal",
            .desc = "You enter the Border Ethereal and can move through objects and effects that are not on that plane.",
        }, .{
            .table = null,
            .heading = "Perception",
            .desc = "You can see and hear your original plane out to 60 feet, though it appears gray and muted.",
        }, .{
            .table = null,
            .heading = "Return",
            .desc = "When the spell ends, you return to the corresponding position; if occupied, you are displaced to the nearest valid space and take force damage based on the distance moved.",
        } },
    },
    &.{
        .{
            .level = .{ .slot = .level_8 },
            .desc = .{ .desc = "Target up to 3 willing creatures total, including yourself.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Target up to 6 willing creatures total, including yourself.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Cleric, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const finger_of_death: Spell = Spell.compInit(
    "Finger of Death",
    .phb14,
    .level_7,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Deal severe necrotic damage and animate humanoids killed by it.",
    .{ .desc = "The target makes a Constitution save, taking 7d8 + 30 necrotic damage on a failure or half on a success. A humanoid killed by the spell rises at the start of your next turn as a permanently commanded zombie.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    &.{roll_7d8_plus_30},
    null,
);

pub const fire_storm: Spell = Spell.compInit(
    "Fire Storm",
    .phb14,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .cube, .brief = "up to ten face-adjacent 10-foot cubes" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Arrange a storm of flame through up to ten connected cubes.",
    .{ .desc = "Creatures in the chosen cubes make Dexterity saves against 7d10 fire damage. The flames damage objects and ignite unattended flammables, but you can choose to spare plant life.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric, Druid, Sorcerer
    &.{roll_7d10},
    null,
);

pub const forcecage: Spell = Spell.compInit(
    "Forcecage",
    .phb14,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 100 }, .shape = .cube, .brief = "20-foot barred cage or 10-foot solid box" },
    .{ .v = true, .s = true, .m = true, .m_brief = "ruby dust worth 1,500 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Trap creatures inside an invisible prison of magical force.",
    .{
        .desc = "Choose either a barred cage or solid box. The prison cannot be dispelled by dispel magic.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Cage",
            .desc = "Up to 20 feet on a side, made from closely spaced force bars.",
        }, .{
            .table = null,
            .heading = "Box",
            .desc = "Up to 10 feet on a side and completely solid, blocking matter and spells through its walls.",
        }, .{
            .table = null,
            .heading = "Escape",
            .desc = "Nonmagical escape is impossible. Teleportation or planar travel requires a successful Charisma save; the cage also blocks ethereal travel.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Warlock, Wizard
    null,
    null,
);

pub const mirage_arcane: Spell = Spell.compInit(
    "Mirage Arcane",
    .phb14,
    .level_7,
    .illusion,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "range: sight; affects up to 1 square mile" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Transform the apparent and tactile nature of a vast area of terrain.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Terrain",
            .desc = "Alter visual, auditory, olfactory, and tactile qualities across up to 1 square mile while preserving the terrain's general underlying shape.",
        }, .{
            .table = null,
            .heading = "Structures",
            .desc = "Existing structures can look different, and illusory structures can appear where none exist.",
        }, .{
            .table = null,
            .heading = "Truesight",
            .desc = "Truesight reveals the underlying terrain but does not remove the illusion's remaining physical and sensory interaction.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Druid, Wizard
    null,
    null,
);

pub const mordenkainens_magnificent_mansion: Spell = Spell.compInit(
    "Mordenkainen's Magnificent Mansion",
    .phb14,
    .level_7,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "an ivory miniature portal, polished marble, and a tiny silver spoon, each worth at least 5 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Create an extradimensional mansion accessible through a portal in range.",
    .{
        .desc = "You choose who may enter. The portal can be opened or closed while you are nearby, and contents created by the spell cannot be removed.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Space",
            .desc = "Create an extradimensional dwelling of up to fifty 10-foot cubes with a floor plan and decoration of your choice.",
        }, .{
            .table = null,
            .heading = "Hospitality",
            .desc = "The mansion contains enough food for a nine-course banquet for up to 100 people.",
        }, .{
            .table = null,
            .heading = "Servants",
            .desc = "One hundred obedient spectral servants can perform ordinary non-harmful household tasks but cannot leave the mansion.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const mordenkainens_sword: Spell = Spell.compInit(
    "Mordenkainen's Sword",
    .phb14,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a miniature platinum sword with copper and zinc fittings worth 250 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a hovering force sword that attacks repeatedly.",
    .{ .desc = "When the sword appears, make a melee spell attack against a creature within 5 feet of it for 3d10 force damage on a hit. On later turns, a bonus action can move the sword up to 20 feet and repeat the attack.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Wizard
    &.{roll_3d10},
    null,
);

pub const plane_shift: Spell = Spell.compInit(
    "Plane Shift",
    .phb14,
    .level_7,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a forked metal rod worth at least 250 gp and attuned to the destination plane" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Travel to another plane or attempt to banish a creature there.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Group Travel",
            .desc = "You and up to eight willing creatures linking hands can travel to a generally specified destination on another plane.",
        }, .{
            .table = null,
            .heading = "Teleportation Circle",
            .desc = "Knowing a circle's sigil sequence on another plane lets the spell deliver the group directly to that circle.",
        }, .{
            .table = null,
            .heading = "Banishment",
            .desc = "Instead, make a melee spell attack against an unwilling creature; on a hit and failed Charisma save, it is sent to a random place on the chosen plane.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Druid, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const power_word_pain: Spell = Spell.compInit(
    "Power Word: Pain",
    .xge,
    .level_7,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Afflict a sufficiently weakened creature with crippling pain.",
    .{
        .desc = "The target repeats a Constitution save at the end of each turn, ending the pain on a success.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Threshold",
            .desc = "The spell affects only a creature with 100 hit points or fewer that is not immune to charm.",
        }, .{
            .table = null,
            .heading = "Pain",
            .desc = "Affected creatures have speed capped at 10 feet and disadvantage on attacks, ability checks, and saves other than Constitution saves.",
        }, .{
            .table = null,
            .heading = "Spellcasting",
            .desc = "Attempting to cast requires a successful Constitution save or the spell fails and is wasted.",
        } },
    },
    null,
    &.{}, // Classes: Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const prismatic_spray: Spell = Spell.compInit(
    "Prismatic Spray",
    .phb14,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .cone, .brief = "60-foot cone" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast creatures in a cone with randomly determined prismatic rays.",
    .{
        .desc = "Each creature in the cone makes a Dexterity save, then a d8 determines the ray affecting that target.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "d8", "Color", "Effect" },
                .table_entry = &.{ &.{ .{ .int = 1 }, .{ .str = "Red" }, .{ .str = "10d6 fire damage, Dexterity save for half." } }, &.{ .{ .int = 2 }, .{ .str = "Orange" }, .{ .str = "10d6 acid damage, Dexterity save for half." } }, &.{ .{ .int = 3 }, .{ .str = "Yellow" }, .{ .str = "10d6 lightning damage, Dexterity save for half." } }, &.{ .{ .int = 4 }, .{ .str = "Green" }, .{ .str = "10d6 poison damage, Dexterity save for half." } }, &.{ .{ .int = 5 }, .{ .str = "Blue" }, .{ .str = "10d6 cold damage, Dexterity save for half." } }, &.{ .{ .int = 6 }, .{ .str = "Indigo" }, .{ .str = "Failed save restrains; repeated Constitution saves can end the effect or result in permanent petrification." } }, &.{ .{ .int = 7 }, .{ .str = "Violet" }, .{ .str = "Failed save blinds; a later failed Wisdom save transports the target to another plane." } }, &.{ .{ .int = 8 }, .{ .str = "Special" }, .{ .str = "Roll twice more and apply two different rays, rerolling further 8s." } } },
            },
            .heading = "Prismatic Rays",
            .desc = null,
        }},
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    &.{ roll_1d8, roll_10d6 },
    null,
);

pub const project_image: Spell = Spell.compInit(
    "Project Image",
    .phb14,
    .level_7,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .mile, .count = 500 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small replica of yourself made from materials worth at least 5 gp" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a distant illusory duplicate of yourself.",
    .{
        .desc = "The image can appear at any previously seen location within 500 miles and disappears if damaged.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Control",
            .desc = "Use your action to move the image up to twice your speed and direct its speech and behavior.",
        }, .{
            .table = null,
            .heading = "Remote Senses",
            .desc = "A bonus action switches your sight and hearing between your body and the image; while perceiving through it, you are blind and deaf to your own surroundings.",
        }, .{
            .table = null,
            .heading = "Detection",
            .desc = "Physical interaction reveals the illusion, and careful examination can identify it with an Intelligence (Investigation) check against your spell save DC.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const regenerate: Spell = Spell.compInit(
    "Regenerate",
    .phb14,
    .level_7,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a prayer wheel and holy water" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Restore hit points continuously and regrow severed body parts.",
    .{ .desc = "The target immediately regains 4d8 + 15 hit points, then regains 1 hit point at the start of each turn for the duration. Severed body parts regrow after 2 minutes, or reattach immediately if held to the stump.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Cleric, Druid
    &.{ roll_4d8_plus_15, roll_1 },
    null,
);

pub const resurrection: Spell = Spell.compInit(
    "Resurrection",
    .phb14,
    .level_7,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a diamond worth at least 1,000 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Return a long-dead creature to life.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Eligibility",
            .desc = "The creature must have been dead no more than a century, cannot have died of old age, cannot be undead, and must have a free and willing soul.",
        }, .{
            .table = null,
            .heading = "Restoration",
            .desc = "The creature returns with all hit points; mortal wounds close and missing body parts are restored.",
        }, .{
            .table = null,
            .heading = "Recovery",
            .desc = "The creature suffers a -4 penalty to attacks, saves, and ability checks; each long rest reduces the penalty by 1.",
        }, .{
            .table = null,
            .heading = "Long-Dead Cost",
            .desc = "Restoring a creature dead for at least one year prevents you from casting spells until a long rest and gives disadvantage on attacks, ability checks, and saves until then.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Cleric
    null,
    null,
);

pub const reverse_gravity: Spell = Spell.compInit(
    "Reverse Gravity",
    .phb14,
    .level_7,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 100 }, .shape = .cylinder, .brief = "50-foot radius, 100-foot-high cylinder" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a lodestone and iron filings" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Reverse gravity inside a large cylinder.",
    .{ .desc = "Unanchored creatures and objects fall upward. A creature can grab a fixed object with a Dexterity save. When the spell ends, affected creatures and objects fall normally again.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    null,
    null,
);

pub const sequester: Spell = Spell.compInit(
    "Sequester",
    .phb14,
    .level_7,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "diamond, emerald, ruby, and sapphire dust worth at least 5,000 gp, consumed" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Hide a willing creature or object from sight and divination.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Concealment",
            .desc = "The willing creature or object becomes invisible and cannot be found by divination spells or scrying sensors.",
        }, .{
            .table = null,
            .heading = "Creature Target",
            .desc = "A creature enters suspended animation and stops aging while sequestered.",
        }, .{
            .table = null,
            .heading = "Ending Condition",
            .desc = "You may define a condition that ends the spell early; damage to the target also ends it.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const simulacrum: Spell = Spell.compInit(
    "Simulacrum",
    .phb14,
    .level_7,
    .illusion,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 12 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "enough snow or ice for a life-sized copy, a piece of the creature's body, and powdered ruby worth 1,500 gp, consumed" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled" },
    "Create a partially real duplicate of a beast or humanoid.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Duplicate",
            .desc = "Create a construct duplicate of a beast or humanoid present for the full casting; it has half the original's hit point maximum and no equipment.",
        }, .{
            .table = null,
            .heading = "Limits",
            .desc = "The simulacrum cannot learn, increase its level or abilities, or recover expended spell slots.",
        }, .{
            .table = null,
            .heading = "Repair",
            .desc = "Repairing it requires an alchemical laboratory and rare materials worth 100 gp per hit point restored.",
        }, .{
            .table = null,
            .heading = "One at a Time",
            .desc = "Casting Simulacrum again immediately destroys any simulacrum you previously created with the spell.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const symbol: Spell = Spell.compInit(
    "Symbol",
    .phb14,
    .level_7,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = "triggered effect fills a 60-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "mercury, phosphorus, and powdered diamond and opal worth at least 1,000 gp total, consumed" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled or triggered" },
    "Inscribe a hidden magical glyph that produces one chosen large-area effect when triggered.",
    .{
        .desc = "The glyph can be placed on a surface or inside a stationary closable object. You define its trigger and exemptions when casting; once triggered, it affects creatures in a 60-foot-radius sphere.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Death",
            .desc = "Constitution save; 10d10 necrotic damage on a failure, half on a success.",
        }, .{
            .table = null,
            .heading = "Discord",
            .desc = "Failed Constitution save causes 1 minute of bickering, preventing meaningful communication and imposing disadvantage on attacks and ability checks.",
        }, .{
            .table = null,
            .heading = "Fear",
            .desc = "Failed Wisdom save frightens for 1 minute and forces the target to move away when able.",
        }, .{
            .table = null,
            .heading = "Hopelessness",
            .desc = "Failed Charisma save prevents attacks or harmful targeting for 1 minute.",
        }, .{
            .table = null,
            .heading = "Insanity",
            .desc = "Failed Intelligence save prevents actions and coherent communication for 1 minute while movement becomes erratic.",
        }, .{
            .table = null,
            .heading = "Pain",
            .desc = "Failed Constitution save incapacitates the target for 1 minute.",
        }, .{
            .table = null,
            .heading = "Sleep",
            .desc = "Failed Wisdom save causes unconsciousness for 10 minutes, ending on damage or if another creature wakes the target.",
        }, .{
            .table = null,
            .heading = "Stunning",
            .desc = "Failed Wisdom save stuns the target for 1 minute.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Cleric, Wizard
    &.{roll_10d10},
    null,
);

pub const teleport: Spell = Spell.compInit(
    "Teleport",
    .phb14,
    .level_7,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Instantly transport a group or object to a known destination on the same plane.",
    .{
        .desc = "Transport yourself and up to eight willing visible creatures in range, or one unattended object small enough to fit inside a 10-foot cube.",
        .desc_fields = &.{ .{
            .table = .{
                .headings = &.{ "Familiarity", "Mishap", "Similar Area", "Off Target", "On Target" },
                .table_entry = &.{ &.{ .{ .str = "Permanent circle" }, .{ .str = "—" }, .{ .str = "—" }, .{ .str = "—" }, .{ .str = "01-100" } }, &.{ .{ .str = "Associated object" }, .{ .str = "—" }, .{ .str = "—" }, .{ .str = "—" }, .{ .str = "01-100" } }, &.{ .{ .str = "Very familiar" }, .{ .str = "01-05" }, .{ .str = "06-13" }, .{ .str = "14-24" }, .{ .str = "25-100" } }, &.{ .{ .str = "Seen casually" }, .{ .str = "01-33" }, .{ .str = "34-43" }, .{ .str = "44-53" }, .{ .str = "54-100" } }, &.{ .{ .str = "Viewed once" }, .{ .str = "01-43" }, .{ .str = "44-53" }, .{ .str = "54-73" }, .{ .str = "74-100" } }, &.{ .{ .str = "Description" }, .{ .str = "01-43" }, .{ .str = "44-53" }, .{ .str = "54-73" }, .{ .str = "74-100" } }, &.{ .{ .str = "False destination" }, .{ .str = "01-50" }, .{ .str = "51-100" }, .{ .str = "—" }, .{ .str = "—" } } },
            },
            .heading = "Arrival Table",
            .desc = "The DM rolls d100; familiarity with the destination determines the result.",
        }, .{
            .table = null,
            .heading = "Off Target",
            .desc = "Distance off target is 1d10 × 1d10 percent of the intended travel distance, in a random d8 compass direction.",
        }, .{
            .table = null,
            .heading = "Similar Area",
            .desc = "The group arrives at a different location that resembles the intended destination.",
        }, .{
            .table = null,
            .heading = "Mishap",
            .desc = "Each traveler or transported object takes 3d10 force damage, then the DM rerolls on the table; multiple mishaps can occur.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    &.{ roll_1d10, roll_1d10, roll_1d8, roll_3d10 },
    null,
);

pub const temple_of_the_gods: Spell = Spell.compInit(
    "Temple of the Gods",
    .xge,
    .level_7,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .cube, .brief = "temple fits inside a cube up to 120 feet on each side" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a holy symbol worth at least 5 gp" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Conjure a divine temple with protective and restorative properties.",
    .{
        .desc = "The temple is an opaque force structure extending into the Ethereal Plane, dedicated to the faith represented by the casting holy symbol.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Exclusion",
            .desc = "Choose one or more of celestial, elemental, fey, fiend, or undead; chosen creatures must pass a Charisma save to enter.",
        }, .{
            .table = null,
            .heading = "Hindrance",
            .desc = "Chosen creature types inside subtract 1d4 from attack rolls, ability checks, and saving throws.",
        }, .{
            .table = null,
            .heading = "Divination Ward",
            .desc = "Divination sensors cannot appear inside and creatures within cannot be targeted by divination spells.",
        }, .{
            .table = null,
            .heading = "Healing",
            .desc = "A creature healed by a spell of 1st level or higher regains extra hit points equal to your Wisdom modifier, minimum 1.",
        }, .{
            .table = null,
            .heading = "Permanence",
            .desc = "Casting on the same spot every day for one year makes the temple permanent.",
        } },
    },
    null,
    &.{}, // Classes: Cleric
    &.{ roll_negative_1d4, roll_spell_mod },
    null,
);

pub const whirlwind: Spell = Spell.compInit(
    "Whirlwind",
    .xge,
    .level_7,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 300 }, .shape = .cylinder, .brief = "10-foot radius, 30-foot-high cylinder" },
    .{ .v = true, .s = false, .m = true, .m_brief = "a piece of straw" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create and move a destructive whirlwind.",
    .{
        .desc = "As an action on later turns, you can move the whirlwind up to 30 feet along the ground.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Impact",
            .desc = "A creature first entering the whirlwind on a turn, or struck by its movement, makes a Dexterity save against 10d6 bludgeoning damage.",
        }, .{
            .table = null,
            .heading = "Restraint",
            .desc = "A Large-or-smaller creature that fails the Dexterity save must also pass a Strength save or become restrained inside the whirlwind.",
        }, .{
            .table = null,
            .heading = "Escape",
            .desc = "A restrained creature can use an action to make a Strength or Dexterity check against your spell save DC; success hurls it 3d6 × 10 feet away in a random direction.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Wizard
    &.{ roll_10d6, roll_3d6 },
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_7_spell_arr = [_]Spell{
    conjure_celestial,
    create_magen,
    crown_of_stars,
    delayed_blast_fireball,
    divine_word,
    draconic_transformation,
    dream_of_the_blue_veil,
    etherealness,
    finger_of_death,
    fire_storm,
    forcecage,
    mirage_arcane,
    mordenkainens_magnificent_mansion,
    mordenkainens_sword,
    plane_shift,
    power_word_pain,
    prismatic_spray,
    project_image,
    regenerate,
    resurrection,
    reverse_gravity,
    sequester,
    simulacrum,
    symbol,
    teleport,
    temple_of_the_gods,
    whirlwind,
};

const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 9 spells from dnd5e.wikidot.com/spells.
// Dunamancy (D/DG/DC), Technomagic (T), and UA entries are intentionally excluded.
// Level 9 is the maximum spell level, so these definitions have no ScalingLevel entries.
// Class arrays remain empty until the class API is implemented; comments preserve
// only non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_10d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d6 } }, .negative = false }},
};

const roll_14d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 14, .dice = &dice.d6 } }, .negative = false }},
};

const roll_1d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }},
};

const roll_1d4_plus_1: modifier.DiceRoll = .{
    .roll = &.{ .{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false }, .{ .roll = .{ .flat = 1 }, .negative = false } },
};

const roll_1d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }},
};

const roll_20d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 20, .dice = &dice.d6 } }, .negative = false }},
};

const roll_2d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d4 } }, .negative = false }},
};

const roll_2d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d6 } }, .negative = false }},
};

const roll_4d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false }},
};

const roll_4d12: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d12 } }, .negative = false }},
};

const roll_700: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .flat = 700 }, .negative = false }},
};

const roll_8d12: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d12 } }, .negative = false }},
};

// ============================================================================
// Level 9 spells
// ============================================================================

pub const astral_projection: Spell = Spell.compInit(
    "Astral Projection",
    .phb14,
    .level_9,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 10 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "for each affected creature, one jacinth worth at least 1,000 gp and one ornately carved silver bar worth at least 100 gp, all consumed" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "special; persists until ended for each affected creature" },
    "Project a group into the Astral Plane while their bodies remain behind.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Astral Bodies",
            .desc = "You and up to eight willing creatures leave unconscious physical bodies behind while astral forms appear on the Astral Plane.",
        }, .{
            .table = null,
            .heading = "Silver Cord",
            .desc = "Each astral form remains connected to its body by a silvery tether. If an effect specifically cuts that cord, the creature dies.",
        }, .{
            .table = null,
            .heading = "Planar Travel",
            .desc = "Astral forms can travel through the Astral Plane and use its portals. Entering another plane transports the corresponding body and possessions so the creature can re-enter its body there.",
        }, .{
            .table = null,
            .heading = "Ending Early",
            .desc = "The spell can end for one creature through dismissal, dispelling, or either form reaching 0 hit points. An intact cord returns that astral form to its body.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Warlock, Wizard
    null,
    null,
);

pub const blade_of_disaster: Spell = Spell.compInit(
    "Blade of Disaster",
    .tce,
    .level_9,
    .conjuration,
    false,
    .{ .time = .bonus_action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a mobile planar-rift blade that makes repeated force attacks.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Attacks",
            .desc = "When created, and again after moving it with a bonus action on later turns, the blade can make up to two melee spell attacks against creatures, loose objects, or structures within 5 feet.",
        }, .{
            .table = null,
            .heading = "Critical Hit",
            .desc = "The blade scores a critical hit on a d20 result of 18 or higher. A critical hit adds another 8d12 force damage, for 12d12 total.",
        }, .{
            .table = null,
            .heading = "Movement",
            .desc = "As a bonus action, move the blade up to 30 feet to an unoccupied space you can see. It can pass harmlessly through barriers, including a Wall of Force.",
        } },
    },
    null,
    &.{}, // Classes: none (all listed classes are optional)
    &.{ roll_4d12, roll_4d12, roll_8d12 },
    null,
);

pub const foresight: Spell = Spell.compInit(
    "Foresight",
    .phb14,
    .level_9,
    .divination,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a hummingbird feather" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = false, .special = false, .brief = null },
    "Grant a willing creature supernatural awareness of the immediate future.",
    .{ .desc = "The target cannot be surprised, has advantage on attack rolls, ability checks, and saving throws, and attacks against it have disadvantage. Casting Foresight again ends the previous casting.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Druid, Warlock, Wizard
    null,
    null,
);

pub const gate: Spell = Spell.compInit(
    "Gate",
    .phb14,
    .level_9,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a diamond worth at least 5,000 gp" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Open a portal to another plane or call a named extraplanar creature.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Portal",
            .desc = "Create a circular portal 5 to 20 feet in diameter between an unoccupied space in range and a precise location on another plane. Travel works only through the front face.",
        }, .{
            .table = null,
            .heading = "Planar Authority",
            .desc = "Deities and similar planar rulers can prevent the portal from opening in their presence or domains.",
        }, .{
            .table = null,
            .heading = "Calling a Creature",
            .desc = "Speaking the true name of a specific creature on another plane can open the portal near it and pull it through. The spell gives you no control over that creature afterward.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Sorcerer, Wizard
    null,
    null,
);

pub const imprisonment: Spell = Spell.compInit(
    "Imprisonment",
    .phb14,
    .level_9,
    .abjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a likeness of the target plus a version-specific component worth at least 500 gp per Hit Die of the target" },
    .{ .duration = null, .concentration = false, .special = true, .brief = "until dispelled or the chosen release condition occurs" },
    "Bind a creature using one of five forms of magical imprisonment.",
    .{
        .desc = "The target makes a Wisdom save. On a failure it is imprisoned, does not age, need food, drink, or air, and cannot be located or perceived by divination magic.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Burial",
            .desc = "The target is entombed far underground inside a sealed magical-force sphere. Special component: a small mithral orb.",
        }, .{
            .table = null,
            .heading = "Chaining",
            .desc = "Anchored magical chains restrain the target and prevent movement. Special component: a fine chain made from precious metal.",
        }, .{
            .table = null,
            .heading = "Hedged Prison",
            .desc = "The target is transported into a tiny warded demiplane such as a maze, cage, or tower. Special component: a jade miniature of the prison.",
        }, .{
            .table = null,
            .heading = "Minimus Containment",
            .desc = "The target shrinks to 1 inch tall and is sealed inside a transparent gemstone that cannot be broken while the spell remains. Special component: a large transparent gemstone.",
        }, .{
            .table = null,
            .heading = "Slumber",
            .desc = "The target falls asleep and cannot be awakened. Special component: rare soporific herbs.",
        }, .{
            .table = null,
            .heading = "Release Condition",
            .desc = "You may define a reasonable observable condition that releases the target. A 9th-level Dispel Magic can also end the imprisonment.",
        } },
    },
    null,
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const invulnerability: Spell = Spell.compInit(
    "Invulnerability",
    .xge,
    .level_9,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a small piece of adamantine worth at least 500 gp, consumed" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Become immune to all damage.",
    .{ .desc = "For the duration, you are immune to all damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const mass_heal: Spell = Spell.compInit(
    "Mass Heal",
    .phb14,
    .level_9,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Distribute 700 points of healing among visible creatures in range.",
    .{ .desc = "Divide up to 700 restored hit points among any number of creatures you can see in range. Each healed creature is also cured of disease and any effect causing blindness or deafness. The spell does not affect undead or constructs.", .desc_fields = null },
    null,
    &.{}, // Classes: Cleric
    &.{roll_700},
    null,
);

pub const mass_polymorph: Spell = Spell.compInit(
    "Mass Polymorph",
    .xge,
    .level_9,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a caterpillar cocoon" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Transform up to ten creatures into beast forms.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Targets",
            .desc = "Transform up to ten creatures you can see. Unwilling creatures make Wisdom saves, while unwilling shapechangers automatically resist.",
        }, .{
            .table = null,
            .heading = "Beast Form",
            .desc = "Each target becomes a beast you have seen whose challenge rating does not exceed the target's CR, or half its level if it has no CR.",
        }, .{
            .table = null,
            .heading = "Temporary Hit Points",
            .desc = "The target keeps its normal hit points but gains temporary hit points equal to the beast form's hit points. Losing those temporary hit points causes reversion.",
        }, .{
            .table = null,
            .heading = "Statistics and Equipment",
            .desc = "The beast form replaces game statistics, including mental scores, while alignment and personality remain. Equipment melds into the form and cannot be used.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Sorcerer, Wizard
    null,
    null,
);

pub const meteor_swarm: Spell = Spell.compInit(
    "Meteor Swarm",
    .phb14,
    .level_9,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .mile, .count = 1 }, .shape = .sphere, .brief = "four separate 40-foot-radius spheres" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Call down four devastating meteors at points within range.",
    .{ .desc = "Each creature in a chosen sphere makes a Dexterity save, taking 20d6 fire plus 20d6 bludgeoning damage on a failure or half on a success. A creature in overlapping spheres is affected only once. The impacts damage objects and ignite unattended flammables.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_20d6, roll_20d6 },
    null,
);

pub const power_word_heal: Spell = Spell.compInit(
    "Power Word: Heal",
    .phb14,
    .level_9,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Fully heal a touched creature and end several disabling conditions.",
    .{ .desc = "The target regains all hit points and ends the charmed, frightened, paralyzed, and stunned conditions. A prone target may use its reaction to stand. The spell does not affect undead or constructs.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard
    null,
    null,
);

pub const power_word_kill: Spell = Spell.compInit(
    "Power Word: Kill",
    .phb14,
    .level_9,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Kill a sufficiently weakened creature instantly.",
    .{ .desc = "A visible target with 100 hit points or fewer dies. A target above that threshold is unaffected.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const prismatic_wall: Spell = Spell.compInit(
    "Prismatic Wall",
    .phb14,
    .level_9,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = "wall up to 90 feet long and 30 feet high, or sphere up to 30 feet in diameter" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Create a seven-layer prismatic barrier with different effects and destruction conditions.",
    .{
        .desc = "The opaque wall sheds bright light, can blind nearby creatures, and affects intruders one color layer at a time. You may designate creatures that can safely approach and pass through it.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "Layer", "Effect", "Destroyed By" },
                .table_entry = &.{
                    &.{ .{ .str = "Red" }, .{ .str = "10d6 fire; blocks nonmagical ranged attacks" }, .{ .str = "At least 25 cold damage" } },
                    &.{ .{ .str = "Orange" }, .{ .str = "10d6 acid; blocks magical ranged attacks" }, .{ .str = "Strong wind" } },
                    &.{ .{ .str = "Yellow" }, .{ .str = "10d6 lightning" }, .{ .str = "At least 60 force damage" } },
                    &.{ .{ .str = "Green" }, .{ .str = "10d6 poison" }, .{ .str = "Passwall or comparable surface-opening magic" } },
                    &.{ .{ .str = "Blue" }, .{ .str = "10d6 cold" }, .{ .str = "At least 25 fire damage" } },
                    &.{ .{ .str = "Indigo" }, .{ .str = "Failed save restrains and can ultimately petrify; blocks spellcasting through the wall" }, .{ .str = "Daylight or equivalent/higher bright-light magic" } },
                    &.{ .{ .str = "Violet" }, .{ .str = "Failed save blinds and can transport the creature to another plane" }, .{ .str = "Dispel Magic or comparable spell-ending magic" } },
                },
            },
            .heading = "Layers",
            .desc = null,
        }},
    },
    null,
    &.{}, // Classes: Wizard
    &.{roll_10d6},
    null,
);

pub const psychic_scream: Spell = Spell.compInit(
    "Psychic Scream",
    .xge,
    .level_9,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 90 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Blast the minds of up to ten creatures and potentially stun them.",
    .{ .desc = "Choose up to ten visible creatures. Targets with Intelligence 2 or lower are unaffected. Others make Intelligence saves, taking 14d6 psychic damage and becoming stunned on a failure, or half damage without the stun on a success. Stunned targets repeat the save at the end of each turn.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    &.{roll_14d6},
    null,
);

pub const shapechange: Spell = Spell.compInit(
    "Shapechange",
    .phb14,
    .level_9,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a jade circlet worth at least 1,500 gp worn while casting" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Assume powerful creature forms and change between them during the spell.",
    .{
        .desc = null,
        .desc_fields = &.{
            .{
                .table = null,
                .heading = "Allowed Forms",
                .desc = "Assume a non-construct, non-undead creature you have seen whose challenge rating is no higher than your level. The form cannot have class levels or the Spellcasting trait.",
            },
            .{
                .table = null,
                .heading = "Statistics",
                .desc = "Use the form's statistics while retaining alignment, Intelligence, Wisdom, Charisma, and your existing skill and saving-throw proficiencies. Legendary and lair actions are unavailable.",
            },
            .{
                .table = null,
                .heading = "Hit Points",
                .desc = "You assume the form's hit points and Hit Dice. Excess damage can carry into your normal form when you revert.",
            },
            .{
                .table = null,
                .heading = "Features and Equipment",
                .desc = "Retain usable class, race, and other features if the new body can support them. Equipment may fall, merge, or remain worn if the form can use it.",
            },
            .{
                .table = null,
                .heading = "Changing Again",
                .desc = "During the duration, use an action to adopt another valid form. If the new form has more hit points than your current form, your current hit points do not increase.",
            },
        },
    },
    null,
    &.{}, // Classes: Druid, Wizard
    null,
    null,
);

pub const storm_of_vengeance: Spell = Spell.compInit(
    "Storm of Vengeance",
    .phb14,
    .level_9,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "range: sight; storm cloud has a 360-foot radius" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a vast storm whose effect changes each round.",
    .{
        .desc = "The storm forms at a visible point and affects creatures beneath it, no more than 5,000 feet below the cloud.",
        .desc_fields = &.{.{
            .table = .{
                .headings = &.{ "Round", "Effect" },
                .table_entry = &.{
                    &.{ .{ .int = 1 }, .{ .str = "Creatures under the cloud make Constitution saves; 2d6 thunder and deafened for 5 minutes on a failure." } },
                    &.{ .{ .int = 2 }, .{ .str = "Acid rain deals 1d6 acid damage to every creature and object under the cloud." } },
                    &.{ .{ .int = 3 }, .{ .str = "Six lightning bolts strike chosen creatures or objects; each deals 10d6 lightning, Dexterity save for half." } },
                    &.{ .{ .int = 4 }, .{ .str = "Hail deals 2d6 bludgeoning damage to every creature under the cloud." } },
                    &.{ .{ .str = "5-10" }, .{ .str = "Freezing rain creates difficult, heavily obscured terrain; creatures take 1d6 cold damage, ranged weapon attacks are impossible, and strong wind disperses fog and similar effects." } },
                },
            },
            .heading = "Storm Progression",
            .desc = null,
        }},
    },
    null,
    &.{}, // Classes: Druid
    &.{ roll_2d6, roll_1d6, roll_10d6, roll_2d6, roll_1d6 },
    null,
);

pub const time_stop: Spell = Spell.compInit(
    "Time Stop",
    .phb14,
    .level_9,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Take several turns while time is stopped for everyone else.",
    .{ .desc = "Take 1d4 + 1 consecutive turns. The effect ends early if one of your actions or created effects affects another creature or another creature's worn or carried object, or if you move more than 1,000 feet from where you cast the spell.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_1d4_plus_1},
    null,
);

pub const true_polymorph: Spell = Spell.compInit(
    "True Polymorph",
    .phb14,
    .level_9,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a drop of mercury, gum arabic, and a wisp of smoke" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Transform creatures and objects far beyond ordinary polymorph magic.",
    .{
        .desc = "Choose one creature or nonmagical object. Shapechangers are unaffected, unwilling creatures can resist with Wisdom saves, and targets at 0 hit points cannot be affected.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Creature into Creature",
            .desc = "Transform a creature into another creature whose CR does not exceed the target's CR or level. The new form replaces its statistics while preserving alignment and personality.",
        }, .{
            .table = null,
            .heading = "Object into Creature",
            .desc = "Transform an unworn, uncarried object into a creature no larger than the object and with CR 9 or lower. The creature is initially friendly and controlled by you.",
        }, .{
            .table = null,
            .heading = "Creature into Object",
            .desc = "Transform a creature and its equipment into a nonmagical object no larger than the creature. The creature remembers nothing from the time spent as an object.",
        }, .{
            .table = null,
            .heading = "Permanence",
            .desc = "The transformation normally ends with the duration, at 0 hit points, or on death. Maintaining concentration for the full hour makes it permanent until ended by an appropriate effect.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Warlock, Wizard
    null,
    null,
);

pub const true_resurrection: Spell = Spell.compInit(
    "True Resurrection",
    .phb14,
    .level_9,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "holy water and diamonds worth at least 25,000 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Restore a long-dead creature completely, even without its original body.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Time Limit",
            .desc = "The creature may have been dead for up to 200 years, but not from old age. Its soul must be free and willing.",
        }, .{
            .table = null,
            .heading = "Restoration",
            .desc = "The creature returns with all hit points; wounds close, poison and disease end, curses present at death are lifted, and missing organs or limbs are restored.",
        }, .{
            .table = null,
            .heading = "Undead and Missing Bodies",
            .desc = "An undead target returns to its non-undead form. If no body remains, speaking the creature's name creates a new body in an open space within 10 feet.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Druid
    null,
    null,
);

pub const weird: Spell = Spell.compInit(
    "Weird",
    .phb14,
    .level_9,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = .sphere, .brief = "30-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Manifest a group of creatures' worst fears as damaging illusions.",
    .{ .desc = "Creatures in the sphere make Wisdom saves. Failed targets become frightened. At the end of each frightened target's turn, it repeats the save; failure deals 4d10 psychic damage, while success ends the spell for that creature.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    &.{roll_4d10},
    null,
);

pub const wish: Spell = Spell.compInit(
    "Wish",
    .phb14,
    .level_9,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Reshape reality with the broadest spell available to mortal magic.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Duplicate a Spell",
            .desc = "The safest use is duplicating any spell of 8th level or lower without satisfying that spell's requirements, including costly components.",
        }, .{
            .table = null,
            .heading = "Create Wealth",
            .desc = "Create one nonmagical object worth up to 25,000 gp, no more than 300 feet in any dimension, in an open space you can see on the ground.",
        }, .{
            .table = null,
            .heading = "Mass Restoration",
            .desc = "Up to twenty visible creatures regain all hit points and end the effects described by Greater Restoration.",
        }, .{
            .table = null,
            .heading = "Resistance",
            .desc = "Grant up to ten visible creatures permanent resistance to one chosen damage type.",
        }, .{
            .table = null,
            .heading = "Temporary Immunity",
            .desc = "Grant up to ten visible creatures immunity to one spell or other magical effect for 8 hours.",
        }, .{
            .table = null,
            .heading = "Undo a Recent Event",
            .desc = "Force a reroll of one roll made within the last round, with advantage or disadvantage chosen by you, and choose whether the original or reroll is used.",
        }, .{
            .table = null,
            .heading = "Greater Wishes",
            .desc = "You may attempt effects beyond the listed options, but the result is at the DM's discretion and may be only partially fulfilled or carry unforeseen consequences.",
        }, .{
            .table = null,
            .heading = "Stress",
            .desc = "Using Wish for anything other than duplicating a lower-level spell causes severe stress: casting other spells before a long rest deals 1d10 necrotic damage per spell level, Strength becomes 3 for 2d4 days, and there is a 33% chance you can never cast Wish again.",
        } },
    },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{ roll_1d10, roll_2d4 },
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_9_spell_arr = [_]Spell{
    astral_projection,
    blade_of_disaster,
    foresight,
    gate,
    imprisonment,
    invulnerability,
    mass_heal,
    mass_polymorph,
    meteor_swarm,
    power_word_heal,
    power_word_kill,
    prismatic_wall,
    psychic_scream,
    shapechange,
    storm_of_vengeance,
    time_stop,
    true_polymorph,
    true_resurrection,
    weird,
    wish,
};

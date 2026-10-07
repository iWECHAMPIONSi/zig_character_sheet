const dice = @import("dice.zig");
const modifier = @import("modifier.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

// Level 8 spells from dnd5e.wikidot.com/spells.
// UA, Dunamancy (D/DG/DC), and Technomagic (T) entries are intentionally excluded.
// Class arrays remain empty until the class API is implemented; comments preserve
// only non-optional class lists from the individual spell pages.

// ============================================================================
// Shared dice rolls
// ============================================================================

const roll_10d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 10, .dice = &dice.d8 } }, .negative = false }},
};

const roll_12d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d6 } }, .negative = false }},
};

const roll_12d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 12, .dice = &dice.d8 } }, .negative = false }},
};

const roll_1d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d10 } }, .negative = false }},
};

const roll_1d4: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d4 } }, .negative = false }},
};

const roll_1d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 1, .dice = &dice.d6 } }, .negative = false }},
};

const roll_2d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 2, .dice = &dice.d10 } }, .negative = false }},
};

const roll_3d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 3, .dice = &dice.d10 } }, .negative = false }},
};

const roll_4d10: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d10 } }, .negative = false }},
};

const roll_4d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 4, .dice = &dice.d6 } }, .negative = false }},
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

const roll_7d6: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 7, .dice = &dice.d6 } }, .negative = false }},
};

const roll_8d8: modifier.DiceRoll = .{
    .roll = &.{.{ .roll = .{ .roll = .{ .count = 8, .dice = &dice.d8 } }, .negative = false }},
};

// ============================================================================
// Level 8 spells
// ============================================================================

pub const abi_dalzims_horrid_wilting: Spell = Spell.compInit(
    "Abi-Dalzim's Horrid Wilting",
    .xge,
    .level_8,
    .necromancy,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .cube, .brief = "30-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a bit of sponge" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Drain moisture from creatures in a large cube.",
    .{ .desc = "Creatures in the 30-foot cube make Constitution saves, taking 12d8 necrotic damage on a failure or half on a success. Constructs and undead are unaffected, while plants and water elementals save with disadvantage. Ordinary nonmagical plants in the area wither and die.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_12d8},
    null,
);

pub const animal_shapes: Spell = Spell.compInit(
    "Animal Shapes",
    .phb14,
    .level_8,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 30 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = true, .special = false, .brief = null },
    "Transform any number of willing creatures into beast forms.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Forms",
            .desc = "Each willing target becomes a Large-or-smaller beast of CR 4 or lower. Different targets can use different forms.",
        }, .{
            .table = null,
            .heading = "Statistics",
            .desc = "The beast form replaces physical game statistics while alignment and Intelligence, Wisdom, and Charisma remain. The target uses the form's hit points.",
        }, .{
            .table = null,
            .heading = "Reversion",
            .desc = "A target reverts at 0 hit points or death; excess damage carries over to its normal form.",
        }, .{
            .table = null,
            .heading = "Repeated Transformation",
            .desc = "On later turns, your action can change affected creatures into new valid beast forms.",
        }, .{
            .table = null,
            .heading = "Equipment",
            .desc = "Worn and carried gear melds into the new form and cannot be used while transformed.",
        } },
    },
    null,
    &.{}, // Classes: Druid
    null,
    null,
);

pub const antimagic_field: Spell = Spell.compInit(
    "Antimagic Field",
    .phb14,
    .level_8,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .sphere, .brief = "10-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of powdered iron or iron filings" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Suppress most magic inside a moving sphere centered on yourself.",
    .{
        .desc = "A 10-foot-radius sphere of antimagic moves with you. Magic from artifacts and deities is exempt, but ordinary spells and magical effects are suppressed within the area.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Targeted Effects",
            .desc = "Spells and magical effects targeting creatures or objects inside the sphere are suppressed.",
        }, .{
            .table = null,
            .heading = "Areas of Magic",
            .desc = "Overlapping magical areas are suppressed only in the portion inside the sphere.",
        }, .{
            .table = null,
            .heading = "Active Spells",
            .desc = "Ongoing spells and magical effects on creatures or objects stop functioning while they remain inside.",
        }, .{
            .table = null,
            .heading = "Magic Items",
            .desc = "Magic item properties and powers are suppressed while the relevant item or effect remains inside.",
        }, .{
            .table = null,
            .heading = "Magical Travel",
            .desc = "Teleportation, planar travel, portals, and extradimensional openings cannot function through the sphere.",
        }, .{
            .table = null,
            .heading = "Summoned or Created Creatures",
            .desc = "Creatures and objects created or summoned by magic temporarily disappear while their space lies inside the field.",
        }, .{
            .table = null,
            .heading = "Dispel Interaction",
            .desc = "Dispel magic and similar effects do not end the field, and overlapping antimagic fields do not cancel one another.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Wizard
    null,
    null,
);

pub const antipathy_sympathy: Spell = Spell.compInit(
    "Antipathy/Sympathy",
    .phb14,
    .level_8,
    .enchantment,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = "target can be a Huge-or-smaller creature/object or an area up to a 200-foot cube" },
    .{ .v = true, .s = true, .m = true, .m_brief = "alum soaked in vinegar for Antipathy or a drop of honey for Sympathy" },
    .{ .duration = .{ .duration = .{ .unit = .day, .count = 10 } }, .concentration = false, .special = false, .brief = null },
    "Make a creature, object, or area repel or attract one specified kind of intelligent creature.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Antipathy",
            .desc = "Specified intelligent creatures that see or approach the target must save or become frightened and compelled to move away.",
        }, .{
            .table = null,
            .heading = "Sympathy",
            .desc = "Specified intelligent creatures that see or approach the target must save or feel compelled to approach and remain near it.",
        }, .{
            .table = null,
            .heading = "Ending the Effect",
            .desc = "An affected creature can save again after ending a turn far enough away and out of sight, after being harmed by a Sympathy target, and once every 24 hours. A successful save gives brief immunity.",
        } },
    },
    null,
    &.{}, // Classes: Druid, Wizard
    null,
    null,
);

pub const clone: Spell = Spell.compInit(
    "Clone",
    .phb14,
    .level_8,
    .necromancy,
    false,
    .{ .time = .{ .duration = .{ .unit = .hour, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a diamond worth at least 1,000 gp and at least 1 cubic inch of the creature's flesh, both consumed, plus a sealable vessel worth at least 2,000 gp large enough to hold the clone" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Grow an inert duplicate that can receive the original creature's soul after death.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Growth",
            .desc = "The inert clone reaches full size and maturity after 120 days and can be created as a younger version of the original.",
        }, .{
            .table = null,
            .heading = "Soul Transfer",
            .desc = "After maturity, the original creature's free and willing soul transfers to the clone when the original dies.",
        }, .{
            .table = null,
            .heading = "Identity",
            .desc = "The clone has the original's personality, memories, and abilities but none of its equipment.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const control_weather: Spell = Spell.compInit(
    "Control Weather",
    .phb14,
    .level_8,
    .transmutation,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 10 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "5-mile radius" },
    .{ .v = true, .s = true, .m = true, .m_brief = "burning incense and bits of earth and wood mixed in water" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 8 } }, .concentration = true, .special = false, .brief = null },
    "Control regional weather while outdoors.",
    .{
        .desc = "You must remain outdoors with a clear path to the sky. Weather gradually returns to normal when the spell ends.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Changing Conditions",
            .desc = "Change precipitation, temperature, and wind one stage at a time. Wind direction may also be changed.",
        }, .{
            .table = null,
            .heading = "Transition Time",
            .desc = "Each chosen change takes 1d4 × 10 minutes to take effect. Once established, you can change the conditions again.",
        }, .{
            .table = .{
                .headings = &.{ "Stage", "Precipitation" },
                .table_entry = &.{ &.{ .{ .int = 1 }, .{ .str = "Clear" } }, &.{ .{ .int = 2 }, .{ .str = "Light clouds" } }, &.{ .{ .int = 3 }, .{ .str = "Overcast or ground fog" } }, &.{ .{ .int = 4 }, .{ .str = "Rain, hail, or snow" } }, &.{ .{ .int = 5 }, .{ .str = "Torrential rain, driving hail, or blizzard" } } },
            },
            .heading = "Precipitation",
            .desc = null,
        }, .{
            .table = .{
                .headings = &.{ "Stage", "Temperature" },
                .table_entry = &.{ &.{ .{ .int = 1 }, .{ .str = "Unbearable heat" } }, &.{ .{ .int = 2 }, .{ .str = "Hot" } }, &.{ .{ .int = 3 }, .{ .str = "Warm" } }, &.{ .{ .int = 4 }, .{ .str = "Cool" } }, &.{ .{ .int = 5 }, .{ .str = "Cold" } }, &.{ .{ .int = 6 }, .{ .str = "Arctic cold" } } },
            },
            .heading = "Temperature",
            .desc = null,
        }, .{
            .table = .{
                .headings = &.{ "Stage", "Wind" },
                .table_entry = &.{ &.{ .{ .int = 1 }, .{ .str = "Calm" } }, &.{ .{ .int = 2 }, .{ .str = "Moderate wind" } }, &.{ .{ .int = 3 }, .{ .str = "Strong wind" } }, &.{ .{ .int = 4 }, .{ .str = "Gale" } }, &.{ .{ .int = 5 }, .{ .str = "Storm" } } },
            },
            .heading = "Wind",
            .desc = null,
        } },
    },
    null,
    &.{}, // Classes: Cleric, Druid, Wizard
    &.{roll_1d4},
    null,
);

pub const demiplane: Spell = Spell.compInit(
    "Demiplane",
    .phb14,
    .level_8,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Open a temporary door to a 30-foot extradimensional room.",
    .{ .desc = "The shadowy door appears on a flat solid surface and leads to a 30-foot room of wood or stone. Each casting can create a new demiplane or reconnect to one you previously created; sufficiently known demiplanes created by others can also be reached. When the spell ends, creatures and objects left inside remain there.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock, Wizard
    null,
    null,
);

pub const dominate_monster: Spell = Spell.compInit(
    "Dominate Monster",
    .phb14,
    .level_8,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Charm and mentally command any creature that fails a Wisdom save.",
    .{ .desc = "You establish a telepathic link with the charmed creature, issue general commands without an action, and can use your action for precise control. Damage gives the target another Wisdom save to end the spell.", .desc_fields = null },
    &.{
        .{
            .level = .{ .slot = .level_9 },
            .desc = .{ .desc = "Duration becomes concentration, up to 8 hours.", .desc_fields = null },
            .dice_rolls = null,
            .modifiers = null,
        },
    },
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const earthquake: Spell = Spell.compInit(
    "Earthquake",
    .phb14,
    .level_8,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 500 }, .shape = .radius, .brief = "100-foot-radius area centered on a ground point" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pinch of dirt, a piece of rock, and a lump of clay" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a violent seismic disturbance that damages terrain and structures.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Ground",
            .desc = "The 100-foot-radius area becomes difficult terrain. Grounded creatures can fall prone, and concentration can be broken by the tremors.",
        }, .{
            .table = null,
            .heading = "Fissures",
            .desc = "At the start of your next turn, 1d6 fissures open. Each is 1d10 × 10 feet deep, 10 feet wide, and spans the area; creatures over an opening can fall inside.",
        }, .{
            .table = null,
            .heading = "Structures",
            .desc = "Structures touching the ground take 50 bludgeoning damage when the spell is cast and at the start of each of your turns. Collapsing structures can deal 5d6 bludgeoning damage and bury nearby creatures.",
        } },
    },
    null,
    &.{}, // Classes: Cleric, Druid, Sorcerer
    &.{ roll_1d6, roll_1d10, roll_50, roll_5d6 },
    null,
);

pub const feeblemind: Spell = Spell.compInit(
    "Feeblemind",
    .phb14,
    .level_8,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a handful of clay, crystal, glass, or mineral spheres" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Damage and potentially devastate a creature's intellect and personality.",
    .{
        .desc = "The target takes 4d6 psychic damage before making the spell's Intelligence save.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Mental Collapse",
            .desc = "On a failed Intelligence save, the target's Intelligence and Charisma scores become 1 and it cannot cast spells, activate magic items, understand language, or communicate intelligibly.",
        }, .{
            .table = null,
            .heading = "Recovery",
            .desc = "At the end of every 30 days, the target repeats the Intelligence save. Greater Restoration, Heal, and Wish can also end the effect.",
        } },
    },
    null,
    &.{}, // Classes: Bard, Druid, Warlock, Wizard
    &.{roll_4d6},
    null,
);

pub const glibness: Spell = Spell.compInit(
    "Glibness",
    .phb14,
    .level_8,
    .transmutation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = false, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 1 } }, .concentration = false, .special = false, .brief = null },
    "Guarantee exceptionally strong Charisma checks and defeat magical truth detection.",
    .{ .desc = "When you make a Charisma check, you can replace the d20 result with 15. Magic that attempts to determine whether you are lying reports your statements as truthful.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Warlock
    null,
    null,
);

pub const holy_aura: Spell = Spell.compInit(
    "Holy Aura",
    .phb14,
    .level_8,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = .radius, .brief = "30-foot radius" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a tiny reliquary worth at least 1,000 gp containing a sacred relic" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Surround chosen nearby creatures with powerful divine protection.",
    .{
        .desc = "Affected creatures shed dim light in a 5-foot radius.",
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Protection",
            .desc = "Chosen creatures within the 30-foot aura have advantage on all saving throws, while attacks against them have disadvantage.",
        }, .{
            .table = null,
            .heading = "Fiends and Undead",
            .desc = "A fiend or undead that hits an affected creature with a melee attack must make a Constitution save or become blinded until the spell ends.",
        } },
    },
    null,
    &.{}, // Classes: Cleric
    null,
    null,
);

pub const illusory_dragon: Spell = Spell.compInit(
    "Illusory Dragon",
    .xge,
    .level_8,
    .illusion,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 120 }, .shape = null, .brief = null },
    .{ .v = false, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a tangible Huge shadow-dragon illusion.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Fear",
            .desc = "Enemies that can see the dragon when it appears make Wisdom saves or become frightened for up to 1 minute.",
        }, .{
            .table = null,
            .heading = "Movement",
            .desc = "As a bonus action, move the Huge illusion up to 60 feet.",
        }, .{
            .table = null,
            .heading = "Breath",
            .desc = "During its movement, the dragon can exhale a 60-foot cone. Choose acid, cold, fire, lightning, necrotic, or poison; failed Intelligence saves take 7d6 of the chosen damage type.",
        }, .{
            .table = null,
            .heading = "Disbelief",
            .desc = "The dragon cannot be damaged. An action and successful Intelligence (Investigation) check can identify it as an illusion, granting vision through it and advantage against its breath.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    &.{roll_7d6},
    null,
);

pub const incendiary_cloud: Spell = Spell.compInit(
    "Incendiary Cloud",
    .phb14,
    .level_8,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "20-foot-radius sphere" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 1 } }, .concentration = true, .special = false, .brief = null },
    "Create a moving, heavily obscuring cloud of burning embers.",
    .{ .desc = "Creatures make Dexterity saves against 10d8 fire damage when the cloud appears, when they first enter it on a turn, or when they end a turn there. The cloud moves 10 feet directly away from you at the start of each of your turns and can be dispersed by sufficiently strong wind.", .desc_fields = null },
    null,
    &.{}, // Classes: Sorcerer, Wizard
    &.{roll_10d8},
    null,
);

pub const maddening_darkness: Spell = Spell.compInit(
    "Maddening Darkness",
    .xge,
    .level_8,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "60-foot-radius sphere" },
    .{ .v = true, .s = false, .m = true, .m_brief = "a drop of pitch mixed with a drop of mercury" },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Create supernatural darkness filled with disturbing sounds.",
    .{ .desc = "Darkvision cannot see through the sphere, and nonmagical light or magical light of 8th level or lower cannot illuminate it. A creature starting its turn inside makes a Wisdom save against 8d8 psychic damage.", .desc_fields = null },
    null,
    &.{}, // Classes: Warlock, Wizard
    &.{roll_8d8},
    null,
);

pub const maze: Spell = Spell.compInit(
    "Maze",
    .phb14,
    .level_8,
    .conjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .minute, .count = 10 } }, .concentration = true, .special = false, .brief = null },
    "Banish a creature into a labyrinthine demiplane.",
    .{ .desc = "The target can use its action to attempt a DC 20 Intelligence check to escape; minotaurs and goristro demons automatically succeed. When the spell ends, the target returns to its former space or the nearest open space.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const mighty_fortress: Spell = Spell.compInit(
    "Mighty Fortress",
    .xge,
    .level_8,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .mile, .count = 1 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = true, .m_brief = "a diamond worth at least 500 gp, consumed" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Create a fully furnished stone fortress.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Outer Walls",
            .desc = "A 120-foot square fortress rises with four 20-foot-square, 30-foot-tall corner turrets joined by 80-foot walls. Up to four exterior stone doors can be placed.",
        }, .{
            .table = null,
            .heading = "Keep",
            .desc = "A furnished three-story keep with a 50-foot-square base stands inside. You choose its rooms, stairs, doors, and decoration.",
        }, .{
            .table = null,
            .heading = "Food and Servants",
            .desc = "The fortress provides a daily nine-course banquet for up to 100 people and contains 100 invisible servants.",
        }, .{
            .table = null,
            .heading = "Durability",
            .desc = "Each 10-by-10-foot stone section has AC 15 and 30 hit points per inch of thickness and is immune to poison and psychic damage.",
        }, .{
            .table = null,
            .heading = "Duration and Permanence",
            .desc = "The fortress disappears after 7 days or when you create another. Casting it on the same spot once every 7 days for one year makes it permanent.",
        } },
    },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const mind_blank: Spell = Spell.compInit(
    "Mind Blank",
    .phb14,
    .level_8,
    .abjuration,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .touch, .count = 0 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Protect one willing creature's mind from psychic and divinatory effects.",
    .{ .desc = "The target becomes immune to psychic damage, the charmed condition, emotion-sensing and thought-reading effects, and divination spells. The protection also defeats Wish and similarly powerful effects used to manipulate or learn about the target's mind.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Wizard
    null,
    null,
);

pub const power_word_stun: Spell = Spell.compInit(
    "Power Word: Stun",
    .phb14,
    .level_8,
    .enchantment,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 60 }, .shape = null, .brief = null },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Stun a creature that currently has 150 hit points or fewer.",
    .{ .desc = "A target above 150 hit points is unaffected. A stunned target makes a Constitution save at the end of each of its turns, ending the stun on a success.", .desc_fields = null },
    null,
    &.{}, // Classes: Bard, Sorcerer, Warlock, Wizard
    null,
    null,
);

pub const sunburst: Spell = Spell.compInit(
    "Sunburst",
    .phb14,
    .level_8,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .foot, .count = 150 }, .shape = .sphere, .brief = "60-foot-radius sphere" },
    .{ .v = true, .s = true, .m = true, .m_brief = "fire and a piece of sunstone" },
    .{ .duration = .instantaneous, .concentration = false, .special = false, .brief = null },
    "Detonate brilliant sunlight over a very large area.",
    .{ .desc = "Creatures make Constitution saves, taking 12d6 radiant damage and becoming blinded for 1 minute on a failure, or half damage without blindness on a success. Undead and oozes save with disadvantage. Blinded creatures repeat the save each turn. The spell also dispels magical darkness in its area.", .desc_fields = null },
    null,
    &.{}, // Classes: Druid, Sorcerer, Wizard
    &.{roll_12d6},
    null,
);

pub const telepathy: Spell = Spell.compInit(
    "Telepathy",
    .phb14,
    .level_8,
    .evocation,
    false,
    .{ .time = .action, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "range: unlimited on the same plane" },
    .{ .v = true, .s = true, .m = true, .m_brief = "a pair of linked silver rings" },
    .{ .duration = .{ .duration = .{ .unit = .hour, .count = 24 } }, .concentration = false, .special = false, .brief = null },
    "Create a long-distance telepathic link with a familiar willing creature.",
    .{ .desc = "While both participants remain on the same plane, they can instantly exchange words, images, sounds, and other sensory messages. A target with Intelligence 1 or higher can understand the meaning of your words and sensory messages.", .desc_fields = null },
    null,
    &.{}, // Classes: Wizard
    null,
    null,
);

pub const tsunami: Spell = Spell.compInit(
    "Tsunami",
    .phb14,
    .level_8,
    .conjuration,
    false,
    .{ .time = .{ .duration = .{ .unit = .minute, .count = 1 } }, .brief = null },
    .{ .distance = .{ .unit = .self, .count = 0 }, .shape = null, .brief = "range: sight" },
    .{ .v = true, .s = true, .m = false, .m_brief = null },
    .{ .duration = .{ .duration = .{ .unit = .round, .count = 6 } }, .concentration = true, .special = false, .brief = null },
    "Create a colossal moving wall of water.",
    .{
        .desc = null,
        .desc_fields = &.{ .{
            .table = null,
            .heading = "Initial Wave",
            .desc = "The wall can be up to 300 feet long, 300 feet high, and 50 feet thick. Creatures in the initial area make Strength saves against 6d10 bludgeoning damage.",
        }, .{
            .table = null,
            .heading = "Movement",
            .desc = "At the start of each later turn, the wall and creatures inside move 50 feet away from you. Huge-or-smaller creatures in its path make Strength saves against the current wave damage.",
        }, .{
            .table = null,
            .heading = "Diminishing Wave",
            .desc = "After each movement, the wall loses 50 feet of height and subsequent damage drops by 1d10, starting from 5d10.",
        }, .{
            .table = null,
            .heading = "Escape",
            .desc = "A caught creature must succeed on a Strength (Athletics) check against your spell save DC to swim within the wall. Leaving the wall causes it to fall to the ground.",
        } },
    },
    null,
    &.{}, // Classes: Druid
    &.{ roll_6d10, roll_5d10, roll_4d10, roll_3d10, roll_2d10, roll_1d10 },
    null,
);

// ============================================================================
// Registry
// ============================================================================

pub const level_8_spell_arr = [_]Spell{
    abi_dalzims_horrid_wilting,
    animal_shapes,
    antimagic_field,
    antipathy_sympathy,
    clone,
    control_weather,
    demiplane,
    dominate_monster,
    earthquake,
    feeblemind,
    glibness,
    holy_aura,
    illusory_dragon,
    incendiary_cloud,
    maddening_darkness,
    maze,
    mighty_fortress,
    mind_blank,
    power_word_stun,
    sunburst,
    telepathy,
    tsunami,
};

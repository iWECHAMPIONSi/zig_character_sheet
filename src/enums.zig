pub const Skill = enum {
    acrobatics,
    animal_handling,
    arcana,
    athletics,
    deception,
    history,
    insight,
    intimidation,
    investigation,
    medicine,
    nature,
    perception,
    performance,
    persuasion,
    religion,
    sleight_of_hand,
    stealth,
    survival,
};

pub const Ability = enum {
    strength,
    dexterity,
    constitution,
    intelligence,
    wisdom,
    charisma,
};

pub fn convertScoreToMod(score: u8) i8 {
    const score_mod: i8 = @intCast(score);
    return @divFloor(score_mod, 2) - 5;
}

pub fn getAbilityFromSkill(skill: Skill) Ability {
    return switch (skill) {
        .acrobatics => Ability.dexterity,
        .animal_handling => Ability.wisdom,
        .arcana => Ability.intelligence,
        .athletics => Ability.strength,
        .deception => Ability.charisma,
        .history => Ability.intelligence,
        .insight => Ability.wisdom,
        .intimidation => Ability.charisma,
        .investigation => Ability.intelligence,
        .medicine => Ability.wisdom,
        .nature => Ability.intelligence,
        .perception => Ability.wisdom,
        .performance => Ability.charisma,
        .persuasion => Ability.charisma,
        .religion => Ability.intelligence,
        .sleight_of_hand => Ability.dexterity,
        .stealth => Ability.dexterity,
        .survival => Ability.wisdom,
    };
}

pub const Alignment = enum {
    lawful_good,
    neutral_good,
    chaotic_good,

    lawful_neutral,
    neutral_neutral,
    chaotic_neutral,

    lawful_evil,
    neutral_evil,
    chaotic_evil,
};

// ================= WEAPONS ===============

pub const WeaponCategory = enum {
    simple,
    martial,
};

pub const WeaponType = enum {
    bludgeoning,
    piercing,
    slashing,
};

// =================== ITEMS ===================

pub const ItemType = enum {
    weapon,
    item,
    container,
    armor,
    shield,
    quiver,
    fluid_container,
    ammo,
    tool,
    small_container,
};

pub const ToolType = enum {
    artisans,
    gaming_set,
    instrument,
    none,
};

// =================== ARMOR =====================

pub const ArmorCategory = enum {
    light,
    medium,
    heavy,
    shield,
};

// ================== SPELLS ======================

pub const SpellLevel = enum {
    cantrip,
    level_1,
    level_2,
    level_3,
    level_4,
    level_5,
    level_6,
    level_7,
    level_8,
    level_9,
};

pub const SchoolOfMagic = enum {
    abjuration,
    conjuration,
    divination,
    enchantment,
    evocation,
    issusion,
    necromancy,
    transmutation,
};

pub const Shapes = enum {
    cone,
    cube,
    cylinder,
    line,
    sphere,
};

// ======================== UNITS =========================

pub const Time = enum(u64) {
    instantaneos = 0,
    second = 1,
    action = 5, // action and round are the exact same in terms of time, just that it differs outside of the character sheet
    round = 6,
    minute = 60,
    hour = 3600,
    day = 3600 * 24,
};

pub const Distance = enum(u64) {
    inch = 1,
    foot = 12,
    yard = 36,
    mile = 36 * 1760,
};

pub const Range = union(enum) {
    self,
    touch,
    distance: struct {
        unit: Distance,
        value: u64,
    },
};

const TravelDistance = struct {
    unit: Distance,
    distance: u64,
};

const TravelPace = struct {
    minute: TravelDistance,
    hour: TravelDistance,
    day: TravelDistance,
    effect: ?[]const u8,
};

pub const Pace = struct {
    pub const fast: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .distance = 400,
        },
        .hour = .{
            .unit = .mile,
            .distance = 4,
        },
        .day = .{
            .unit = .mile,
            .distance = 30,
        },
        .effect = "-5 penalty to passive Wisdom (Perception) scores",
    };

    pub const normal: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .distance = 300,
        },
        .hour = .{
            .unit = .mile,
            .distance = 3,
        },
        .day = .{
            .unit = .mile,
            .distance = 24,
        },
        .effect = null,
    };

    pub const slow: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .distance = 200,
        },
        .hour = .{
            .unit = .mile,
            .distance = 2,
        },
        .day = .{
            .unit = .mile,
            .distance = 18,
        },
        .effect = "Able to use stealth",
    };
};

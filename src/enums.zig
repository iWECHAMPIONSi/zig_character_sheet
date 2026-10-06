// ================================== STATS =========================

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
    return @divTrunc(score_mod, 2) - 5;
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

pub const PlayerStat = enum {
    hit_points,
    proficiency,
    passive_wisdom,
    max_hit_points,
    temp_hit_points,
};

// ======================== MODS ==========================

pub const Mod = union(enum) {
    ability_score: Ability,
    ability_mod: Ability,
    ability_save: Ability,

    skill: Skill,

    player_stat: PlayerStat,

    bonus: Bonus,
};

pub const DiceMod = enum {
    strength,
    dexterity,
    constitution,
    intelligence,
    wisdom,
    charisma,
    proficiency,
    level,
    half_level,
    weapon_roll,
    weapon_dice,
    spell_mod,
};

pub const Bonus = enum {
    proficiency_bonus,
    weapon_attack,
    weapon_damage,
    melee_attack,
    melee_damage,
    ranged_attack,
    ranged_damage,
    spell_attack,
    spell_dc,
    hit_points,
    armor_class,
    saving_throw,
    initiative,
    speed,
    passive_wisdom,
};

// =================== ITEMS ===================

pub const DamageType = union(enum) {
    physical: PhysicalDamage,
    magical: MagicDamage,
};

pub const WeaponCategory = enum {
    simple,
    martial,
};

pub const PhysicalDamage = enum {
    bludgeoning,
    piercing,
    slashing,
};

pub const MagicDamage = enum {
    acid,
    cold,
    fire,
    force,
    lightning,
    necrotic,
    poison,
    psychic,
    radiant,
    thunder,
};

pub const ToolType = enum {
    artisans,
    gaming_set,
    instrument,
    none,
};

pub const ArmorCategory = enum {
    light,
    medium,
    heavy,
    shield,
};

pub const Rarity = enum {
    common,
    uncommon,
    rare,
    very_rare,
    legendary,
    artifact,
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
    illusion,
    necromancy,
    transmutation,
};

pub const Shapes = enum {
    cone,
    cube,
    cylinder,
    line,
    sphere,
    radius,
};

// ========================= SOURCES ===========================

pub const Source = enum {
    phb,
    mm,
    dmg,

    scag,
    vgm,
    xge,
    ggtr,
    ai,
    bgdia,
    erlw,
    egtw,

    pub fn sourceName(self: Source) []const u8 {
        return switch (self) {
            .phb => "Player's Handbook",
            .mm => "Monster Manual",
            .dmg => "Dungeon Master's Guide",

            .scag => "Sword Coast Adventurer's Guide",
            .vgm => "Volo's Guide to Monsters",
            .xge => "Xanathar's Guide to Everything",
            .ggtr => "Guildmasters' Guide to Ravinca",
            .ai => "Acquisitions Incorporated",
            .bgdia => "Baldur's Gate: Descent Into Avernus",
            .erlw => "Eberron: Rising from the Last War",
            .egtw => "Explorer's Guide to Wildemount",
        };
    }
};

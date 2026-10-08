const items = @import("items.zig");
const Item = items.Item;
const Spell = @import("spells.zig").Spell;

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

// ======================= CHARACTER ==========================

pub const Scripts = enum {};

pub const LanguageRarity = enum {
    standard,
    exotic,
    rare,
};

pub const Languages = enum {};

pub const Size = enum {
    tiny,
    small,
    medium,
    large,
    huge,
};

pub const HashIdentity = union(enum) {
    item: u64,
    spell: u64,
    language: u64,
};

pub const Proficiency = union(enum) {
    hash: HashIdentity,
    weapon_category: WeaponCategory,
    armor_category: ArmorCategory,
    skill: Skill,
    ability_save: Ability,
};

// ======================== MODS ==========================

/// This is effectivelly a way to allow for exotic homebrews
pub const LogicOperators = enum {
    @"and",
    @"or",
    not,
    nand,
    nor,
    xor,
};

pub const CompareOperators = enum {
    gt,
    gte,
    eq,
    neq,
    lte,
    lt,
};

pub const Operators = union(enum) {
    logic: LogicOperators,
    compare: CompareOperators,
};

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

pub const AttackType = enum {
    melee,
    ranged,
    magic,
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
    misc,
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

/// most of these are redunant for those who want to add things
pub const Source = enum {
    // =========================================================================
    // Core Rules
    // =========================================================================

    phb,
    phb14,
    dmg,
    dmg14,
    mm,
    mm14,

    br,
    br14,

    srd52,
    srd51,

    // =========================================================================
    // Major Rules Supplements / Setting Books
    // =========================================================================

    eepc,
    scag,
    vgm,
    xge,
    mtf,
    ggr,
    ai,
    wgte,
    erlw,
    egtw,
    mot,
    tce,
    vrgr,
    ftd,
    scc,
    mpmm,
    sais,
    bgg,
    paitm,
    bmt,

    /// this is for quick homebrew, if you want to specify homebrews, you need to use the string system or manually add it in the source code
    hb,

    // =========================================================================
    // 2025+ Rules / Setting Books
    // =========================================================================

    efota,
    frhof,
    fraif,
    lfl,
    nf,

    rthw,
    au,
    aud,

    // Announced for November 2026.
    wow,

    // =========================================================================
    // Major Adventures / Adventure Anthologies
    // =========================================================================

    hotdq,
    rot,
    tod,

    pota,
    oota,
    cos,
    skt,
    tftyp,
    toa,

    wdh,
    wdmm,

    gos,
    bgdia,
    idrotf,
    cm,
    twbtw,
    crcotn,
    jtrc,
    dsotdq,
    kgv,
    pabtso,
    veor,
    qftis,
    drde,

    // =========================================================================
    // Starter Sets / Introductory Adventures
    // =========================================================================

    lmop,
    doip,
    slw,
    sdw,
    dc,
    dosi,
    hotb,

    // =========================================================================
    // Official Digital / Legacy Supplements
    // =========================================================================

    tp,
    oga,
    mffv1,
    lr,
    llk,
    imr,
    rrakkma,
    mmv1,

    dod,
    mbjv,

    // =========================================================================
    // Other Official Digital Adventures
    // =========================================================================

    sa,
    hftt,
    lightning_keep,
    hold_back_the_dead,

    // =========================================================================
    // Monstrous Compendium
    // =========================================================================

    mc1_spelljammer,
    mc2_dragonlance,
    mc3_minecraft,
    mc4_eldraine,

    // =========================================================================
    // Licensed / Promotional Official Products
    // =========================================================================

    ddvrm,

    // =========================================================================
    // Plane Shift
    //
    // WotC-published material, but not treated the same as normal official
    // D&D sourcebooks. Kept here because it is plausible compendium input.
    // =========================================================================

    ps_zendikar,
    ps_innistrad,
    ps_kaladesh,
    ps_amonkhet,
    ps_ixalan,
    ps_dominaria,

    // ======================================================
    // This is when you know something has a source, but don't know the source (if it's a homebrew, then use .hb)
    unknown,

    pub fn sourceName(self: Source) []const u8 {
        return switch (self) {
            // =================================================================
            // Core Rules
            // =================================================================

            .phb => "Player's Handbook",
            .phb14 => "Player's Handbook (2014)",
            .dmg => "Dungeon Master's Guide",
            .dmg14 => "Dungeon Master's Guide (2014)",
            .mm => "Monster Manual",
            .mm14 => "Monster Manual (2014)",

            .br => "Basic Rules",
            .br14 => "Basic Rules (2014)",

            .srd52 => "System Reference Document 5.2",
            .srd51 => "System Reference Document 5.1",

            // =================================================================
            // Major Rules Supplements / Setting Books
            // =================================================================

            .eepc => "Elemental Evil Player's Companion",
            .scag => "Sword Coast Adventurer's Guide",
            .vgm => "Volo's Guide to Monsters",
            .xge => "Xanathar's Guide to Everything",
            .mtf => "Mordenkainen's Tome of Foes",
            .ggr => "Guildmasters' Guide to Ravnica",
            .ai => "Acquisitions Incorporated",
            .wgte => "Wayfinder's Guide to Eberron",
            .erlw => "Eberron: Rising from the Last War",
            .egtw => "Explorer's Guide to Wildemount",
            .mot => "Mythic Odysseys of Theros",
            .tce => "Tasha's Cauldron of Everything",
            .vrgr => "Van Richten's Guide to Ravenloft",
            .ftd => "Fizban's Treasury of Dragons",
            .scc => "Strixhaven: A Curriculum of Chaos",
            .mpmm => "Mordenkainen Presents: Monsters of the Multiverse",
            .sais => "Spelljammer: Adventures in Space",
            .bgg => "Bigby Presents: Glory of the Giants",
            .paitm => "Planescape: Adventures in the Multiverse",
            .bmt => "The Book of Many Things",

            .hb => "Homebrew",

            // =================================================================
            // 2025+ Rules / Setting Books
            // =================================================================

            .efota => "Eberron: Forge of the Artificer",
            .frhof => "Forgotten Realms: Heroes of Faerun",
            .fraif => "Forgotten Realms: Adventures in Faerun",
            .lfl => "Lorwyn: First Light",
            .nf => "Netheril's Fall",

            .rthw => "Ravenloft: The Horrors Within",
            .au => "Arcana Unleashed",
            .aud => "Arcana Unleashed: Deadfall",

            .wow => "D&D: World of Warcraft",

            // =================================================================
            // Major Adventures / Adventure Anthologies
            // =================================================================

            .hotdq => "Hoard of the Dragon Queen",
            .rot => "The Rise of Tiamat",
            .tod => "Tyranny of Dragons",

            .pota => "Princes of the Apocalypse",
            .oota => "Out of the Abyss",
            .cos => "Curse of Strahd",
            .skt => "Storm King's Thunder",
            .tftyp => "Tales from the Yawning Portal",
            .toa => "Tomb of Annihilation",

            .wdh => "Waterdeep: Dragon Heist",
            .wdmm => "Waterdeep: Dungeon of the Mad Mage",

            .gos => "Ghosts of Saltmarsh",
            .bgdia => "Baldur's Gate: Descent into Avernus",
            .idrotf => "Icewind Dale: Rime of the Frostmaiden",
            .cm => "Candlekeep Mysteries",
            .twbtw => "The Wild Beyond the Witchlight",
            .crcotn => "Critical Role: Call of the Netherdeep",
            .jtrc => "Journeys through the Radiant Citadel",
            .dsotdq => "Dragonlance: Shadow of the Dragon Queen",
            .kgv => "Keys from the Golden Vault",
            .pabtso => "Phandelver and Below: The Shattered Obelisk",
            .veor => "Vecna: Eve of Ruin",
            .qftis => "Quests from the Infinite Staircase",
            .drde => "Dragon Delves",

            // =================================================================
            // Starter Sets / Introductory Adventures
            // =================================================================

            .lmop => "Lost Mine of Phandelver",
            .doip => "Dragon of Icespire Peak",
            .slw => "Storm Lord's Wrath",
            .sdw => "Sleeping Dragon's Wake",
            .dc => "Divine Contention",
            .dosi => "Dragons of Stormwreck Isle",
            .hotb => "Heroes of the Borderlands",

            // =================================================================
            // Official Digital / Legacy Supplements
            // =================================================================

            .tp => "The Tortle Package",
            .oga => "One Grung Above",
            .mffv1 => "Mordenkainen's Fiendish Folio Volume 1",
            .lr => "Locathah Rising",
            .llk => "Lost Laboratory of Kwalish",
            .imr => "Infernal Machine Rebuild",
            .rrakkma => "Rrakkma",
            .mmv1 => "Misplaced Monsters: Volume One",

            .dod => "Domains of Delight",
            .mbjv => "Minsc and Boo's Journal of Villainy",

            // =================================================================
            // Other Official Digital Adventures
            // =================================================================

            .sa => "Spelljammer Academy",
            .hftt => "Hunt for the Thessalhydra",
            .lightning_keep => "Lightning Keep",
            .hold_back_the_dead => "Hold Back the Dead",

            // =================================================================
            // Monstrous Compendium
            // =================================================================

            .mc1_spelljammer => "Monstrous Compendium Vol. 1: Spelljammer Creatures",
            .mc2_dragonlance => "Monstrous Compendium Vol. 2: Dragonlance Creatures",
            .mc3_minecraft => "Monstrous Compendium Vol. 3: Minecraft Creatures",
            .mc4_eldraine => "Monstrous Compendium Vol. 4: Eldraine Creatures",

            // =================================================================
            // Licensed / Promotional Official Products
            // =================================================================

            .ddvrm => "Dungeons & Dragons vs. Rick and Morty",

            // =================================================================
            // Plane Shift
            // =================================================================

            .ps_zendikar => "Plane Shift: Zendikar",
            .ps_innistrad => "Plane Shift: Innistrad",
            .ps_kaladesh => "Plane Shift: Kaladesh",
            .ps_amonkhet => "Plane Shift: Amonkhet",
            .ps_ixalan => "Plane Shift: Ixalan",
            .ps_dominaria => "Plane Shift: Dominaria",

            // ============================================
            // This is when you know something has a source, but don't know the source (if it's a homebrew, then use .hb)
            .unknown => "Unknown",
        };
    }
};

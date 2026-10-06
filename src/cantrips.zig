const std = @import("std");
const hash = std.hash.Wyhash.hash;
const enums = @import("enums.zig");
const units = @import("units.zig");
const classes = @import("class_temp.zig");
const spells = @import("spells.zig");
const Spell = spells.Spell;

const CastingTime = spells.CastingTime;
const CastingRange = spells.CastingRange;
const Components = spells.Components;
const Duration = spells.Duration;
const HigherLevel = spells.HigherLevel;

fn compInit(
    comptime name: []const u8,
    comptime spell_level: enums.SpellLevel,
    comptime school: enums.SchoolOfMagic,
    comptime ritual: bool,
    comptime casting_time: CastingTime,
    comptime casting_range: CastingRange,
    comptime components: Components,
    comptime duration: Duration,
    comptime desc: []const u8,
    comptime higher_levels: ?[]const HigherLevel,
    comptime class: []const u64,
) Spell {
    return .{
        .name = name,
        .hash = hash(0, name),
        .spell_level = spell_level,
        .school = school,
        .ritual = ritual,
        .casting_time = casting_time,
        .casting_range = casting_range,
        .components = components,
        .duration = duration,
        .desc = desc,
        .higher_levels = higher_levels,
        .classes = class,
    };
}

pub const acid_splash: Spell = compInit(
    "Acid Splash",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Hurl acid at one creature, or at two creatures within 5 feet of each other. Each target makes a Dexterity saving throw, taking 1d6 acid damage on a failure.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const blade_ward: Spell = compInit(
    "Blade Ward",
    .cantrip,
    .abjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Until the end of your next turn, you have resistance to bludgeoning, piercing, and slashing damage dealt by weapon attacks.",
    null,
    &.{
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const booming_blade: Spell = compInit(
    "Booming Blade",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = .{
            .distance = .{ .distance = .{ .unit = .foot, .value = 5 } },
            .shape = .radius,
        },
    },
    .{
        .v = false,
        .s = true,
        .m = true,
        .m_desc = "a melee weapon worth at least 1 sp",
    },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Brandish the material weapon and make a melee attack with it against a creature within 5 feet. On a hit, the weapon has its normal effect and the target is wrapped in booming energy; if it willingly moves at least 5 feet before the start of your next turn, it takes 1d8 thunder damage and the spell ends.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "The melee hit deals an extra 1d8 thunder damage, and movement damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "The melee hit deals an extra 2d8 thunder damage, and movement damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "The melee hit deals an extra 3d8 thunder damage, and movement damage becomes 4d8.",
        },
    },
    &.{
        classes.artificer.hash,
    },
);

pub const chill_touch: Spell = compInit(
    "Chill Touch",
    .cantrip,
    .necromancy,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 120 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Make a ranged spell attack with a spectral skeletal hand. On a hit, the target takes 1d8 necrotic damage and cannot regain hit points until the start of your next turn; an undead target also has disadvantage on attacks against you until then.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const control_flames: Spell = compInit(
    "Control Flames",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .desc = "Instantaneous or 1 hour",
    },
    "Manipulate a nonmagical flame that fits in a 5-foot cube: expand it into nearby fuel, extinguish it, alter its light or color for 1 hour, or form simple animated shapes in it for 1 hour. Up to three non-instantaneous effects can be active at once.",
    null,
    &.{
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const create_bonfire: Spell = compInit(
    "Create Bonfire",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = true,
        .special = false,
        .desc = null,
    },
    "Create a bonfire in a 5-foot cube on ground you can see. A creature in the space when cast, entering it for the first time on a turn, or ending its turn there makes a Dexterity save or takes 1d8 fire damage. The fire ignites unattended flammable objects.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const dancing_lights: Spell = compInit(
    "Dancing Lights",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 120 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "a bit of phosphorus or wychwood, or a glowworm",
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = true,
        .special = false,
        .desc = null,
    },
    "Create up to four torch-sized lights, or combine them into one glowing Medium humanoid form. Each sheds dim light in a 10-foot radius. As a bonus action, move the lights up to 60 feet while keeping each within range and within 20 feet of another light.",
    null,
    &.{
        classes.artificer.hash,
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const druidcraft: Spell = compInit(
    "Druidcraft",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Create one minor nature effect: a tiny weather omen for the next 24 hours, make a plant blossom or bud, create a harmless instantaneous sensory effect fitting in a 5-foot cube, or light or extinguish a candle, torch, or small campfire.",
    null,
    &.{
        classes.druid.hash,
    },
);

pub const eldritch_blast: Spell = compInit(
    "Eldritch Blast",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 120 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Make a ranged spell attack with a beam of force. On a hit, the target takes 1d10 force damage.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Create two beams.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Create three beams.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Create four beams.",
        },
    },
    &.{
        classes.warlock.hash,
    },
);

pub const encode_thoughts: Spell = compInit(
    "Encode Thoughts",
    .cantrip,
    .enchantment,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .hour, .value = 8 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Extract a memory, idea, or message from a mind into a Tiny tangible thought strand that lasts for the duration. If cast while reading or manipulating another creature's thoughts, those thoughts can be encoded instead. Holding a strand while casting lets you receive its contents.",
    null,
    &.{},
);

pub const fire_bolt: Spell = compInit(
    "Fire Bolt",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 120 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Make a ranged spell attack with a mote of fire. On a hit, the target takes 1d10 fire damage; an unattended flammable object hit by the spell ignites.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d10.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d10.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d10.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const friends: Spell = compInit(
    "Friends",
    .cantrip,
    .enchantment,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = true,
        .m_desc = "a small amount of makeup applied to the face while casting",
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = true,
        .special = false,
        .desc = null,
    },
    "Choose one nonhostile creature. For the duration, you have advantage on Charisma checks directed at it. When the spell ends, the creature realizes magic influenced its mood and becomes hostile toward you, reacting as appropriate.",
    null,
    &.{
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const frostbite: Spell = compInit(
    "Frostbite",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see makes a Constitution saving throw. On a failure, it takes 1d6 cold damage and has disadvantage on its next weapon attack before the end of its next turn.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
        classes.artificer.hash,
    },
);

pub const green_flame_blade: Spell = compInit(
    "Green-Flame Blade",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = .{
            .distance = .{ .distance = .{ .unit = .foot, .value = 5 } },
            .shape = .radius,
        },
    },
    .{
        .v = false,
        .s = true,
        .m = true,
        .m_desc = "a melee weapon worth at least 1 sp",
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Brandish the material weapon and make a melee attack against a creature within 5 feet. On a hit, the attack has its normal effect and green fire can leap to another creature you can see within 5 feet of the target, dealing fire damage equal to your spellcasting ability modifier.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "The melee hit deals an extra 1d8 fire damage, and the second creature takes 1d8 plus your spellcasting ability modifier.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Both added damage rolls become 2d8, with the spellcasting ability modifier still added to the second creature's damage.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Both added damage rolls become 3d8, with the spellcasting ability modifier still added to the second creature's damage.",
        },
    },
    &.{
        classes.artificer.hash,
    },
);

pub const guidance: Spell = compInit(
    "Guidance",
    .cantrip,
    .divination,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = true,
        .special = false,
        .desc = null,
    },
    "Touch one willing creature. Once before the spell ends, it can roll a d4 and add the result to one ability check, choosing to roll before or after the check. The spell then ends.",
    null,
    &.{
        classes.artificer.hash,
        classes.cleric.hash,
        classes.druid.hash,
    },
);

pub const gust: Spell = compInit(
    "Gust",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Create one air effect at a visible point: force a Medium or smaller creature to make a Strength save or be pushed up to 5 feet away; push an unattended object weighing at most 5 pounds up to 10 feet away; or create a harmless sensory effect with air.",
    null,
    &.{
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const infestation: Spell = compInit(
    "Infestation",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "a living flea",
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see makes a Constitution saving throw. On a failure, it takes 1d6 poison damage and, if able, moves 5 feet in a random cardinal direction determined by a d4. This movement does not provoke opportunity attacks.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const light: Spell = compInit(
    "Light",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = false,
        .m = true,
        .m_desc = "a firefly or phosphorescent moss",
    },
    .{
        .duration = .{ .duration = .{ .unit = .hour, .value = 1 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Touch an object no larger than 10 feet in any dimension. It emits bright light for 20 feet and dim light for another 20 feet, in a color you choose. Opaque covering blocks the light; a hostile creature holding or wearing the object can avoid the spell with a Dexterity save.",
    null,
    &.{
        classes.artificer.hash,
        classes.bard.hash,
        classes.cleric.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const lightning_lure: Spell = compInit(
    "Lightning Lure",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = .{
            .distance = .{ .distance = .{ .unit = .foot, .value = 15 } },
            .shape = .radius,
        },
    },
    .{
        .v = true,
        .s = false,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see within 15 feet makes a Strength saving throw. On a failure, it is pulled up to 10 feet toward you in a straight line and, if it ends within 5 feet of you, takes 1d8 lightning damage.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.artificer.hash,
    },
);

pub const mage_hand: Spell = compInit(
    "Mage Hand",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Create a spectral hand at a point within range. You can use an action to move and manipulate objects with it, including opening unlocked containers or pouring a vial. It cannot attack, activate magic items, carry more than 10 pounds, or remain more than 30 feet from you.",
    null,
    &.{
        classes.artificer.hash,
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const magic_stone: Spell = compInit(
    "Magic Stone",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = true,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Imbue one to three pebbles. A creature can make a ranged spell attack with one by throwing it or using a sling, using your spellcasting ability for the attack. On a hit it deals 1d6 plus your spellcasting ability modifier bludgeoning damage. The magic ends on a stone after it hits or misses, and recasting ends the effect on remaining stones.",
    null,
    &.{
        classes.druid.hash,
        classes.warlock.hash,
        classes.artificer.hash,
    },
);

pub const mending: Spell = compInit(
    "Mending",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "two lodestones",
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Repair one break or tear in a touched object, provided the damaged area is no larger than 1 foot in any dimension. The repair leaves no trace. Magic items and constructs can be physically repaired, but lost magic is not restored.",
    null,
    &.{
        classes.artificer.hash,
        classes.bard.hash,
        classes.cleric.hash,
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const message: Spell = compInit(
    "Message",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 120 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "a short piece of copper wire",
    },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Whisper a message to a creature within range; only it hears you and it can whisper a reply only you hear. The spell can pass around corners and through some barriers, but magical silence and sufficiently thick stone, metal, lead, or wood block it.",
    null,
    &.{
        classes.artificer.hash,
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const mind_sliver: Spell = compInit(
    "Mind Sliver",
    .cantrip,
    .enchantment,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = false,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .round,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see makes an Intelligence saving throw. On a failure, it takes 1d6 psychic damage and subtracts 1d4 from the next saving throw it makes before the end of your next turn.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{},
);

pub const minor_illusion: Spell = compInit(
    "Minor Illusion",
    .cantrip,
    .illusion,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = true,
        .m_desc = "a bit of fleece",
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Create either a sound or an image of an object within range. An image must fit in a 5-foot cube and cannot produce other sensory effects. Physical interaction reveals an image as unreal; examining the illusion can reveal it with an Intelligence (Investigation) check against your spell save DC.",
    null,
    &.{
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const mold_earth: Spell = compInit(
    "Mold Earth",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .desc = "Instantaneous or 1 hour",
    },
    "Manipulate visible dirt or stone fitting in a 5-foot cube: excavate and move loose earth up to 5 feet, create shapes or colors for 1 hour, or change ground between normal and difficult terrain for 1 hour. Up to two non-instantaneous effects can be active at once.",
    null,
    &.{
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const poison_spray: Spell = compInit(
    "Poison Spray",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 10 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see within range makes a Constitution saving throw, taking 1d12 poison damage on a failure.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d12.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d12.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d12.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const prestidigitation: Spell = compInit(
    "Prestidigitation",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 10 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .hour, .value = 1 } },
        .concentration = false,
        .special = true,
        .desc = "Up to 1 hour",
    },
    "Create a minor magical trick within range: a harmless sensory effect; light or extinguish a small flame; clean or soil up to 1 cubic foot; chill, warm, or flavor material; create a small mark or symbol; or create a hand-sized trinket or illusion. Up to three non-instantaneous effects can be active at once.",
    null,
    &.{
        classes.artificer.hash,
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const primal_savagery: Spell = compInit(
    "Primal Savagery",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Temporarily sharpen your teeth or nails and make a melee spell attack against a creature within 5 feet. On a hit, it takes 1d10 acid damage.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d10.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d10.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d10.",
        },
    },
    &.{
        classes.druid.hash,
    },
);

pub const produce_flame: Spell = compInit(
    "Produce Flame",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 10 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Create a harmless flame in your hand that sheds bright light for 10 feet and dim light for another 10 feet. You can hurl it at a creature within 30 feet when casting or as a later action, making a ranged spell attack that deals 1d8 fire damage and ends the spell.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.druid.hash,
    },
);

pub const ray_of_frost: Spell = compInit(
    "Ray of Frost",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Make a ranged spell attack with a freezing beam. On a hit, the target takes 1d8 cold damage and its speed is reduced by 10 feet until the start of your next turn.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const resistance: Spell = compInit(
    "Resistance",
    .cantrip,
    .abjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "a miniature cloak",
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = true,
        .special = false,
        .desc = null,
    },
    "Touch one willing creature. Once before the spell ends, it can roll a d4 and add the result to one saving throw, choosing to roll before or after the save. The spell then ends.",
    null,
    &.{
        classes.artificer.hash,
        classes.cleric.hash,
        classes.druid.hash,
    },
);

pub const sacred_flame: Spell = compInit(
    "Sacred Flame",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see within range makes a Dexterity saving throw, taking 1d8 radiant damage on a failure. The target gains no benefit from cover for this save.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.cleric.hash,
    },
);

pub const shape_water: Spell = compInit(
    "Shape Water",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = null,
        .concentration = false,
        .special = true,
        .desc = "Instantaneous or 1 hour",
    },
    "Manipulate visible water fitting in a 5-foot cube: move or redirect it up to 5 feet, form and animate simple shapes for 1 hour, change its color or opacity for 1 hour, or freeze it for 1 hour if no creature is within it. Up to two non-instantaneous effects can be active at once.",
    null,
    &.{
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const shillelagh: Spell = compInit(
    "Shillelagh",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = true,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "mistletoe, a shamrock leaf, and a club or quarterstaff",
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Imbue a club or quarterstaff you hold. For the duration, melee attacks with it can use your spellcasting ability instead of Strength, its damage die becomes d8, and it counts as magical. The spell ends if recast or if you let go of the weapon.",
    null,
    &.{
        classes.druid.hash,
    },
);

pub const shocking_grasp: Spell = compInit(
    "Shocking Grasp",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Make a melee spell attack that has advantage against a target wearing metal armor. On a hit, the target takes 1d8 lightning damage and cannot take reactions until the start of its next turn.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.sorcerer.hash,
        classes.wizard.hash,
    },
);

pub const spare_the_dying: Spell = compInit(
    "Spare the Dying",
    .cantrip,
    .necromancy,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .touch,
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Touch a living creature at 0 hit points; it becomes stable. The spell has no effect on undead or constructs.",
    null,
    &.{
        classes.artificer.hash,
        classes.cleric.hash,
    },
);

pub const sword_burst: Spell = compInit(
    "Sword Burst",
    .cantrip,
    .conjuration,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = .{
            .distance = .{ .distance = .{ .unit = .foot, .value = 5 } },
            .shape = .radius,
        },
    },
    .{
        .v = true,
        .s = false,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Spectral blades sweep around you. Every other creature within 5 feet makes a Dexterity saving throw, taking 1d6 force damage on a failure.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.artificer.hash,
    },
);

pub const thaumaturgy: Spell = compInit(
    "Thaumaturgy",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = false,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .{ .duration = .{ .unit = .minute, .value = 1 } },
        .concentration = false,
        .special = true,
        .desc = "Up to 1 minute",
    },
    "Create a minor supernatural effect within range: amplify your voice, alter flames, cause harmless tremors, create an instantaneous sound, open or slam an unlocked door or window, or alter your eyes. Up to three 1-minute effects can be active at once.",
    null,
    &.{
        classes.cleric.hash,
    },
);

pub const thorn_whip: Spell = compInit(
    "Thorn Whip",
    .cantrip,
    .transmutation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = true,
        .m_desc = "the stem of a plant with thorns",
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Make a melee spell attack with a thorny vine against a creature within range. On a hit, it takes 1d6 piercing damage, and if it is Large or smaller you can pull it up to 10 feet closer.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.artificer.hash,
        classes.druid.hash,
    },
);

pub const thunderclap: Spell = compInit(
    "Thunderclap",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .self,
        .shape = .{
            .distance = .{ .distance = .{ .unit = .foot, .value = 5 } },
            .shape = .radius,
        },
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Create a burst of thunder audible 100 feet away. Every creature other than you within 5 feet makes a Constitution saving throw, taking 1d6 thunder damage on a failure.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.bard.hash,
        classes.druid.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
        classes.artificer.hash,
    },
);

pub const toll_the_dead: Spell = compInit(
    "Toll the Dead",
    .cantrip,
    .necromancy,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see within range makes a Wisdom saving throw. On a failure, it takes 1d8 necrotic damage, or 1d12 if it is missing any hit points.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d8, or 2d12 if the target is missing hit points.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d8, or 3d12 if the target is missing hit points.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d8, or 4d12 if the target is missing hit points.",
        },
    },
    &.{
        classes.cleric.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const true_strike: Spell = compInit(
    "True Strike",
    .cantrip,
    .divination,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 30 } },
        .shape = null,
    },
    .{
        .v = false,
        .s = true,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .round,
        .concentration = true,
        .special = false,
        .desc = null,
    },
    "Choose a target within range. If concentration lasts until your next turn, you have advantage on the first attack roll you make against that target on that turn.",
    null,
    &.{
        classes.bard.hash,
        classes.sorcerer.hash,
        classes.warlock.hash,
        classes.wizard.hash,
    },
);

pub const vicious_mockery: Spell = compInit(
    "Vicious Mockery",
    .cantrip,
    .enchantment,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 60 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = false,
        .m = false,
        .m_desc = null,
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "One creature you can see and that can hear you makes a Wisdom saving throw. On a failure, it takes 1d4 psychic damage and has disadvantage on its next attack roll before the end of its next turn.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d4.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d4.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d4.",
        },
    },
    &.{
        classes.bard.hash,
    },
);

pub const word_of_radiance: Spell = compInit(
    "Word of Radiance",
    .cantrip,
    .evocation,
    false,
    .{
        .duration = .action,
        .bonus = false,
        .reaction = false,
        .desc = null,
    },
    .{
        .distance = .{ .distance = .{ .unit = .foot, .value = 5 } },
        .shape = null,
    },
    .{
        .v = true,
        .s = false,
        .m = true,
        .m_desc = "a holy symbol",
    },
    .{
        .duration = .instantaneous,
        .concentration = false,
        .special = false,
        .desc = null,
    },
    "Each creature of your choice that you can see within range makes a Constitution saving throw, taking 1d6 radiant damage on a failure.",
    &.{
        .{
            .level = .{ .character = 5 },
            .desc = "Damage becomes 2d6.",
        },
        .{
            .level = .{ .character = 11 },
            .desc = "Damage becomes 3d6.",
        },
        .{
            .level = .{ .character = 17 },
            .desc = "Damage becomes 4d6.",
        },
    },
    &.{
        classes.cleric.hash,
    },
);

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

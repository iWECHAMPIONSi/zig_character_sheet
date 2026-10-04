const std = @import("std");
const ArrayList = std.ArrayList;
const enums = @import("enums.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const weapons = @import("weapons.zig");
const Weapon = weapons.Weapon;
const armor = @import("armor.zig");
const Armor = armor.Armor;
const Shield = armor.Shield;
const hash = std.hash.Wyhash.hash;

pub const ItemContained = union {
    item: Item,
    container: Container,
    small_container: SmallContainer,
    weapon: Weapon,
    armor: Armor,
    shield: Shield,
    fluid_container: FluidContainer,
    ammo: Ammo,
    quiver: Quiver,
    tool: Tool,
};

pub const ItemWrapper = struct {
    item_type: enums.ItemType,
    item: ItemContained,
};

pub const Item = struct {
    name: []const u8,
    hash: u64,
    weight: f32,
    can_be_in_container: bool,
    can_be_in_small_container: bool,
    length: ?u8,
    count: ?u64,
    const Self = @This();

    pub fn init(name: []const u8, weight: f32, can_be_in_container: bool, can_be_in_small_container: bool, length: ?u8) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .can_be_in_small_container = can_be_in_small_container,
            .length = length,
            .count = null,
        };
    }

    pub fn clone(self: *Self, count: u64) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .can_be_in_container = self.can_be_in_container,
            .can_be_in_small_container = self.can_be_in_small_container,
            .length = self.length,
            .count = count,
        };
    }
};

pub const SmallContainer = struct {
    allocator: ?std.mem.Allocator,
    name: []const u8,
    hash: u64,
    weight: f32,
    contents: ?ArrayList(ItemWrapper),
    const Self = @This();
    pub fn init(name: []const u8, weight: f32) Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .contents = null,
        };
    }
    pub fn clone(self: *Self, allocator: std.mem.Allocator) Self {
        return .{
            .allocator = allocator,
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .contents = ArrayList(ItemWrapper).empty,
        };
    }
    pub fn deinit(self: *Self) void {
        if (self.contents) |contents| {
            contents.deinit(self.allocator);
        } else {
            return;
        }
    }
};

pub const Container = struct {
    allocator: ?std.mem.Allocator,
    name: []const u8,
    hash: u64,
    weight: f32,
    can_be_in_container: bool,
    contents: ?ArrayList(ItemWrapper),
    const Self = @This();
    pub fn init(name: []const u8, weight: f32, can_be_in_container: bool) Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .contents = null,
        };
    }
    pub fn clone(self: *Self, allocator: std.mem.Allocator) Self {
        return .{
            .allocator = allocator,
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .can_be_in_container = self.can_be_in_container,
            .contents = ArrayList(ItemWrapper).empty,
        };
    }

    pub fn deinit(self: *Self) void {
        if (self.contents) |contents| {
            contents.deinit(self.allocator);
        } else {
            return;
        }
    }
};

pub const Ammo = struct {
    name: []const u8,
    hash: u64,
    weight: f32,
    count: ?u64,
    const Self = @This();
    pub fn init(name: []const u8, weight: f32) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .count = null,
        };
    }
    pub fn clone(self: *Self, count: u64) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .count = count,
        };
    }
};

pub const Quiver = struct {
    allocator: ?std.mem.Allocator,
    name: []const u8,
    hash: u64,
    weight: f32,
    contents: ?ArrayList(Ammo),
    const Self = @This();
    pub fn init(name: []const u8, weight: f32) Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .contents = null,
        };
    }

    pub fn clone(self: *Self, allocator: std.mem.Allocator) Self {
        return .{
            .allocator = allocator,
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .contents = ArrayList(Ammo).empty,
        };
    }

    pub fn deinit(self: *Self) void {
        if (self.contents) |contents| {
            contents.deinit(self.allocator);
        } else {
            return;
        }
    }
};

pub const Fluid = struct {
    name: []const u8,
    hash: u64,
    const Self = @This();

    pub fn init(name: []const u8) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
        };
    }

    pub fn clone(self: *Self) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
        };
    }
};

pub const FluidContainer = struct {
    name: []const u8,
    hash: u64,
    weight: f32,
    can_be_in_container: bool,
    fluid: ?Fluid,
    const Self = @This();
    pub fn init(name: []const u8, weight: f32, can_be_in_container: bool) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .fluid = null,
        };
    }
    pub fn clone(self: *Self, fluid: ?Fluid) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .can_be_in_container = self.can_be_in_container,
            .fluid = fluid,
        };
    }
};

pub const Tool = struct {
    name: []const u8,
    hash: u64,
    weight: f32,
    tool_type: enums.ToolType,
    count: ?u64,
    const Self = @This();
    pub fn init(name: []const u8, weight: f32, tool_type: enums.ToolType) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .tool_type = tool_type,
            .count = null,
        };
    }
    pub fn clone(self: *Self, count: u64) Self {
        return .{
            .name = self.name,
            .hash = self.hash,
            .weight = self.weight,
            .tool_type = self.tool_type,
            .count = count,
        };
    }
};

// ============================================================================
// Ammunition
// ============================================================================

// The PHB gives ammunition weight by bundle.
// These prototypes represent one individual piece of ammunition.

pub var arrow: Ammo = Ammo.init(
    "Arrow",
    1.0 / 20.0,
);

pub var blowgun_needle: Ammo = Ammo.init(
    "Blowgun Needle",
    1.0 / 50.0,
);

pub var crossbow_bolt: Ammo = Ammo.init(
    "Crossbow Bolt",
    1.5 / 20.0,
);

pub var sling_bullet: Ammo = Ammo.init(
    "Sling Bullet",
    1.5 / 20.0,
);

// ============================================================================
// Containers
// ============================================================================

// Backpack is explicitly unable to be placed inside another container despite
// weighing less than 25 lb.

pub var backpack: Container = Container.init(
    "Backpack",
    5.0,
    false,
);

pub var barrel: Container = Container.init(
    "Barrel",
    70.0,
    false,
);

pub var basket: Container = Container.init(
    "Basket",
    2.0,
    true,
);

pub var bucket: Container = Container.init(
    "Bucket",
    2.0,
    true,
);

pub var map_scroll_case: Container = Container.init(
    "Map or Scroll Case",
    1.0,
    true,
);

pub var chest: Container = Container.init(
    "Chest",
    25.0,
    false,
);

// ============================================================================
// Small Containers
// ============================================================================

pub var component_pouch: SmallContainer = SmallContainer.init(
    "Component Pouch",
    2.0,
);

pub var pouch: SmallContainer = SmallContainer.init(
    "Pouch",
    1.0,
);

pub var sack: SmallContainer = SmallContainer.init(
    "Sack",
    0.5,
);

// ============================================================================
// Ammunition Containers
// ============================================================================

pub var crossbow_bolt_case: Quiver = Quiver.init(
    "Crossbow Bolt Case",
    1.0,
);

pub var quiver: Quiver = Quiver.init(
    "Quiver",
    1.0,
);

// ============================================================================
// Fluid Containers
// ============================================================================

// Only the vessel exists as a base prototype. A populated instance should be
// produced later with FluidContainer.clone().
//
// Tankard is intentionally not represented separately from Flask.
// Pitcher is likewise represented by Jug because the PHB lists them as the
// same container entry.

pub var glass_bottle: FluidContainer = FluidContainer.init(
    "Glass Bottle",
    2.0,
    true,
);

pub var flask: FluidContainer = FluidContainer.init(
    "Flask",
    1.0,
    true,
);

pub var jug: FluidContainer = FluidContainer.init(
    "Jug",
    4.0,
    true,
);

pub var iron_pot: FluidContainer = FluidContainer.init(
    "Iron Pot",
    10.0,
    true,
);

pub var vial: FluidContainer = FluidContainer.init(
    "Vial",
    0.0,
    true,
);

// Waterskin intentionally omitted.

// ============================================================================
// Fluids
// ============================================================================

// Fluids contain no weight themselves under the current model.
// Their FluidContainer supplies the weight.

pub var acid: Fluid = Fluid.init(
    "Acid",
);

pub var alchemists_fire: Fluid = Fluid.init(
    "Alchemist's Fire",
);

pub var antitoxin: Fluid = Fluid.init(
    "Antitoxin",
);

pub var holy_water: Fluid = Fluid.init(
    "Holy Water",
);

pub var ink: Fluid = Fluid.init(
    "Ink",
);

pub var oil: Fluid = Fluid.init(
    "Oil",
);

pub var perfume: Fluid = Fluid.init(
    "Perfume",
);

pub var basic_poison: Fluid = Fluid.init(
    "Basic Poison",
);

// Potion of Healing intentionally omitted.

// ============================================================================
// Arcane Focuses
// ============================================================================

pub var crystal: Item = Item.init(
    "Crystal",
    1.0,
    true,
    true,
    null,
);

pub var orb: Item = Item.init(
    "Orb",
    3.0,
    true,
    true,
    null,
);

pub var rod: Item = Item.init(
    "Rod",
    2.0,
    true,
    false,
    null,
);

pub var staff: Item = Item.init(
    "Staff",
    4.0,
    true,
    false,
    null,
);

pub var wand: Item = Item.init(
    "Wand",
    1.0,
    true,
    true,
    null,
);

// ============================================================================
// Druidic Focuses
// ============================================================================

pub var sprig_of_mistletoe: Item = Item.init(
    "Sprig of Mistletoe",
    0.0,
    true,
    true,
    null,
);

pub var totem: Item = Item.init(
    "Totem",
    0.0,
    true,
    true,
    null,
);

pub var wooden_staff: Item = Item.init(
    "Wooden Staff",
    4.0,
    true,
    false,
    null,
);

pub var yew_wand: Item = Item.init(
    "Yew Wand",
    1.0,
    true,
    true,
    null,
);

// ============================================================================
// Holy Symbols
// ============================================================================

pub var amulet: Item = Item.init(
    "Amulet",
    1.0,
    true,
    true,
    null,
);

pub var emblem: Item = Item.init(
    "Emblem",
    0.0,
    true,
    true,
    null,
);

pub var reliquary: Item = Item.init(
    "Reliquary",
    2.0,
    true,
    true,
    null,
);

// ============================================================================
// Adventuring Gear
// ============================================================================

pub var abacus: Item = Item.init(
    "Abacus",
    2.0,
    true,
    false,
    null,
);

pub var ball_bearing: Item = Item.init(
    "Ball Bearing",
    2.0 / 1000.0,
    true,
    true,
    null,
);

pub var bedroll: Item = Item.init(
    "Bedroll",
    7.0,
    true,
    false,
    null,
);

pub var bell: Item = Item.init(
    "Bell",
    0.0,
    true,
    true,
    null,
);

pub var blanket: Item = Item.init(
    "Blanket",
    3.0,
    true,
    false,
    null,
);

pub var block_and_tackle: Item = Item.init(
    "Block and Tackle",
    5.0,
    true,
    false,
    null,
);

pub var book: Item = Item.init(
    "Book",
    5.0,
    true,
    false,
    null,
);

pub var caltrop: Item = Item.init(
    "Caltrop",
    2.0 / 20.0,
    true,
    true,
    null,
);

pub var candle: Item = Item.init(
    "Candle",
    0.0,
    true,
    true,
    null,
);

pub var chain: Item = Item.init(
    "Chain",
    10.0,
    true,
    false,
    10,
);

pub var chalk: Item = Item.init(
    "Chalk",
    0.0,
    true,
    true,
    null,
);

pub var climbers_kit: Item = Item.init(
    "Climber's Kit",
    12.0,
    true,
    false,
    null,
);

pub var common_clothes: Item = Item.init(
    "Common Clothes",
    3.0,
    true,
    false,
    null,
);

pub var costume: Item = Item.init(
    "Costume",
    4.0,
    true,
    false,
    null,
);

pub var fine_clothes: Item = Item.init(
    "Fine Clothes",
    6.0,
    true,
    false,
    null,
);

pub var travelers_clothes: Item = Item.init(
    "Traveler's Clothes",
    4.0,
    true,
    false,
    null,
);

pub var crowbar: Item = Item.init(
    "Crowbar",
    5.0,
    true,
    false,
    null,
);

pub var fishing_tackle: Item = Item.init(
    "Fishing Tackle",
    4.0,
    true,
    false,
    null,
);

pub var grappling_hook: Item = Item.init(
    "Grappling Hook",
    4.0,
    true,
    false,
    null,
);

pub var hammer: Item = Item.init(
    "Hammer",
    3.0,
    true,
    false,
    null,
);

pub var sledgehammer: Item = Item.init(
    "Sledgehammer",
    10.0,
    true,
    false,
    null,
);

pub var healers_kit: Item = Item.init(
    "Healer's Kit",
    3.0,
    true,
    false,
    null,
);

pub var hourglass: Item = Item.init(
    "Hourglass",
    1.0,
    true,
    true,
    null,
);

pub var hunting_trap: Item = Item.init(
    "Hunting Trap",
    25.0,
    false,
    false,
    null,
);

pub var ink_pen: Item = Item.init(
    "Ink Pen",
    0.0,
    true,
    true,
    null,
);

pub var ladder: Item = Item.init(
    "Ladder",
    25.0,
    false,
    false,
    10,
);

pub var lamp: Item = Item.init(
    "Lamp",
    1.0,
    true,
    false,
    null,
);

pub var bullseye_lantern: Item = Item.init(
    "Bullseye Lantern",
    2.0,
    true,
    false,
    null,
);

pub var hooded_lantern: Item = Item.init(
    "Hooded Lantern",
    2.0,
    true,
    false,
    null,
);

pub var lock: Item = Item.init(
    "Lock",
    1.0,
    true,
    true,
    null,
);

pub var magnifying_glass: Item = Item.init(
    "Magnifying Glass",
    0.0,
    true,
    true,
    null,
);

pub var manacles: Item = Item.init(
    "Manacles",
    6.0,
    true,
    true,
    null,
);

pub var mess_kit: Item = Item.init(
    "Mess Kit",
    1.0,
    true,
    false,
    null,
);

pub var steel_mirror: Item = Item.init(
    "Steel Mirror",
    0.5,
    true,
    true,
    null,
);

pub var paper: Item = Item.init(
    "Paper",
    0.0,
    true,
    true,
    null,
);

pub var parchment: Item = Item.init(
    "Parchment",
    0.0,
    true,
    true,
    null,
);

pub var miners_pick: Item = Item.init(
    "Miner's Pick",
    10.0,
    true,
    false,
    null,
);

pub var piton: Item = Item.init(
    "Piton",
    0.25,
    true,
    true,
    null,
);

pub var pole: Item = Item.init(
    "Pole",
    7.0,
    true,
    false,
    10,
);

pub var portable_ram: Item = Item.init(
    "Portable Ram",
    35.0,
    false,
    false,
    null,
);

pub var ration: Item = Item.init(
    "Ration",
    2.0,
    true,
    true,
    null,
);

pub var robes: Item = Item.init(
    "Robes",
    4.0,
    true,
    false,
    null,
);

pub var hempen_rope: Item = Item.init(
    "Hempen Rope",
    10.0,
    true,
    false,
    50,
);

pub var silk_rope: Item = Item.init(
    "Silk Rope",
    5.0,
    true,
    false,
    50,
);

pub var merchants_scale: Item = Item.init(
    "Merchant's Scale",
    3.0,
    true,
    false,
    null,
);

pub var sealing_wax: Item = Item.init(
    "Sealing Wax",
    0.0,
    true,
    true,
    null,
);

pub var shovel: Item = Item.init(
    "Shovel",
    5.0,
    true,
    false,
    null,
);

pub var signal_whistle: Item = Item.init(
    "Signal Whistle",
    0.0,
    true,
    true,
    null,
);

pub var signet_ring: Item = Item.init(
    "Signet Ring",
    0.0,
    true,
    true,
    null,
);

pub var soap: Item = Item.init(
    "Soap",
    0.0,
    true,
    true,
    null,
);

pub var spellbook: Item = Item.init(
    "Spellbook",
    3.0,
    true,
    false,
    null,
);

pub var iron_spike: Item = Item.init(
    "Iron Spike",
    5.0 / 10.0,
    true,
    true,
    null,
);

pub var spyglass: Item = Item.init(
    "Spyglass",
    1.0,
    true,
    true,
    null,
);

pub var two_person_tent: Item = Item.init(
    "Two-Person Tent",
    20.0,
    true,
    false,
    null,
);

pub var tinderbox: Item = Item.init(
    "Tinderbox",
    1.0,
    true,
    true,
    null,
);

pub var torch: Item = Item.init(
    "Torch",
    1.0,
    true,
    false,
    null,
);

pub var whetstone: Item = Item.init(
    "Whetstone",
    1.0,
    true,
    true,
    null,
);

// ============================================================================
// Artisan's Tools
// ============================================================================

pub var alchemists_supplies: Tool = Tool.init(
    "Alchemist's Supplies",
    8.0,
    .artisans,
);

pub var brewers_supplies: Tool = Tool.init(
    "Brewer's Supplies",
    9.0,
    .artisans,
);

pub var calligraphers_supplies: Tool = Tool.init(
    "Calligrapher's Supplies",
    5.0,
    .artisans,
);

pub var carpenters_tools: Tool = Tool.init(
    "Carpenter's Tools",
    6.0,
    .artisans,
);

pub var cartographers_tools: Tool = Tool.init(
    "Cartographer's Tools",
    6.0,
    .artisans,
);

pub var cobblers_tools: Tool = Tool.init(
    "Cobbler's Tools",
    5.0,
    .artisans,
);

pub var cooks_utensils: Tool = Tool.init(
    "Cook's Utensils",
    8.0,
    .artisans,
);

pub var glassblowers_tools: Tool = Tool.init(
    "Glassblower's Tools",
    5.0,
    .artisans,
);

pub var jewelers_tools: Tool = Tool.init(
    "Jeweler's Tools",
    2.0,
    .artisans,
);

pub var leatherworkers_tools: Tool = Tool.init(
    "Leatherworker's Tools",
    5.0,
    .artisans,
);

pub var masons_tools: Tool = Tool.init(
    "Mason's Tools",
    8.0,
    .artisans,
);

pub var painters_supplies: Tool = Tool.init(
    "Painter's Supplies",
    5.0,
    .artisans,
);

pub var potters_tools: Tool = Tool.init(
    "Potter's Tools",
    3.0,
    .artisans,
);

pub var smiths_tools: Tool = Tool.init(
    "Smith's Tools",
    8.0,
    .artisans,
);

pub var tinkers_tools: Tool = Tool.init(
    "Tinker's Tools",
    10.0,
    .artisans,
);

pub var weavers_tools: Tool = Tool.init(
    "Weaver's Tools",
    5.0,
    .artisans,
);

pub var woodcarvers_tools: Tool = Tool.init(
    "Woodcarver's Tools",
    5.0,
    .artisans,
);

// ============================================================================
// Gaming Sets
// ============================================================================

pub var dice_set: Tool = Tool.init(
    "Dice Set",
    0.0,
    .gaming_set,
);

pub var dragonchess_set: Tool = Tool.init(
    "Dragonchess Set",
    0.5,
    .gaming_set,
);

pub var playing_card_set: Tool = Tool.init(
    "Playing Card Set",
    0.0,
    .gaming_set,
);

pub var three_dragon_ante_set: Tool = Tool.init(
    "Three-Dragon Ante Set",
    0.0,
    .gaming_set,
);

// ============================================================================
// Musical Instruments
// ============================================================================

pub var bagpipes: Tool = Tool.init(
    "Bagpipes",
    6.0,
    .instrument,
);

pub var drum: Tool = Tool.init(
    "Drum",
    3.0,
    .instrument,
);

pub var dulcimer: Tool = Tool.init(
    "Dulcimer",
    10.0,
    .instrument,
);

pub var flute: Tool = Tool.init(
    "Flute",
    1.0,
    .instrument,
);

pub var lute: Tool = Tool.init(
    "Lute",
    2.0,
    .instrument,
);

pub var lyre: Tool = Tool.init(
    "Lyre",
    2.0,
    .instrument,
);

pub var horn: Tool = Tool.init(
    "Horn",
    2.0,
    .instrument,
);

pub var pan_flute: Tool = Tool.init(
    "Pan Flute",
    2.0,
    .instrument,
);

pub var shawm: Tool = Tool.init(
    "Shawm",
    1.0,
    .instrument,
);

pub var viol: Tool = Tool.init(
    "Viol",
    1.0,
    .instrument,
);

// ============================================================================
// Other Tools
// ============================================================================

pub var disguise_kit: Tool = Tool.init(
    "Disguise Kit",
    3.0,
    .none,
);

pub var forgery_kit: Tool = Tool.init(
    "Forgery Kit",
    5.0,
    .none,
);

pub var herbalism_kit: Tool = Tool.init(
    "Herbalism Kit",
    3.0,
    .none,
);

pub var navigators_tools: Tool = Tool.init(
    "Navigator's Tools",
    2.0,
    .none,
);

pub var poisoners_kit: Tool = Tool.init(
    "Poisoner's Kit",
    2.0,
    .none,
);

pub var thieves_tools: Tool = Tool.init(
    "Thieves' Tools",
    1.0,
    .none,
);

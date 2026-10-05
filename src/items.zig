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

    fn compInit(
        comptime name: []const u8,
        comptime weight: f32,
        comptime can_be_in_container: bool,
        comptime can_be_in_small_container: bool,
        comptime length: ?u8,
    ) Self {
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

    pub fn init(name: []const u8, weight: f32, can_be_in_container: bool, can_be_in_small_container: bool, length: ?u8) StdErr!Self {
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

    pub fn clone(self: *const Self, count: u64) Self {
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
    fn compInit(comptime name: []const u8, comptime weight: f32) Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .contents = null,
        };
    }

    pub fn init(name: []const u8, weight: f32) StdErr!Self {
        if (name.len == 0) {
            return StdErr.InvalidParameter;
        }
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .contents = null,
        };
    }

    pub fn clone(self: *const Self, allocator: std.mem.Allocator) Self {
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
    fn compInit(comptime name: []const u8, comptime weight: f32, comptime can_be_in_container: bool) Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .contents = null,
        };
    }
    pub fn init(name: []const u8, weight: f32, can_be_in_container: bool) StdErr!Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .contents = null,
        };
    }
    pub fn clone(self: *const Self, allocator: std.mem.Allocator) Self {
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
    fn compInit(comptime name: []const u8, comptime weight: f32) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .count = null,
        };
    }
    pub fn init(name: []const u8, weight: f32) StdErr!Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .count = null,
        };
    }
    pub fn clone(self: *const Self, count: u64) Self {
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
    fn compInit(comptime name: []const u8, comptime weight: f32) Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .contents = null,
        };
    }
    pub fn init(name: []const u8, weight: f32) StdErr!Self {
        return .{
            .allocator = null,
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .contents = null,
        };
    }

    pub fn clone(self: *const Self, allocator: std.mem.Allocator) Self {
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
    fn compInit(comptime name: []const u8) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
        };
    }

    pub fn init(name: []const u8) StdErr!Self {
        return .{
            .name = name,
            .hash = hash(0, name),
        };
    }

    pub fn clone(self: *const Self) Self {
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
    fn compInit(comptime name: []const u8, comptime weight: f32, comptime can_be_in_container: bool) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .fluid = null,
        };
    }
    pub fn init(name: []const u8, weight: f32, can_be_in_container: bool) StdErr!Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .can_be_in_container = can_be_in_container,
            .fluid = null,
        };
    }
    pub fn clone(self: *const Self, fluid: ?Fluid) Self {
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
    fn compInit(comptime name: []const u8, comptime weight: f32, comptime tool_type: enums.ToolType) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .tool_type = tool_type,
            .count = null,
        };
    }
    pub fn init(name: []const u8, weight: f32, tool_type: enums.ToolType) StdErr!Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .weight = weight,
            .tool_type = tool_type,
            .count = null,
        };
    }
    pub fn clone(self: *const Self, count: u64) Self {
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

pub const arrow: Ammo = Ammo.compInit(
    "Arrow",
    1.0 / 20.0,
);

pub const blowgun_needle: Ammo = Ammo.compInit(
    "Blowgun Needle",
    1.0 / 50.0,
);

pub const crossbow_bolt: Ammo = Ammo.compInit(
    "Crossbow Bolt",
    1.5 / 20.0,
);

pub const sling_bullet: Ammo = Ammo.compInit(
    "Sling Bullet",
    1.5 / 20.0,
);

// ============================================================================
// Containers
// ============================================================================

// Backpack is explicitly unable to be placed inside another container despite
// weighing less than 25 lb.

pub const backpack: Container = Container.compInit(
    "Backpack",
    5.0,
    false,
);

pub const barrel: Container = Container.compInit(
    "Barrel",
    70.0,
    false,
);

pub const basket: Container = Container.compInit(
    "Basket",
    2.0,
    true,
);

pub const bucket: Container = Container.compInit(
    "Bucket",
    2.0,
    true,
);

pub const map_scroll_case: Container = Container.compInit(
    "Map or Scroll Case",
    1.0,
    true,
);

pub const chest: Container = Container.compInit(
    "Chest",
    25.0,
    false,
);

// ============================================================================
// Small Containers
// ============================================================================

pub const component_pouch: SmallContainer = SmallContainer.compInit(
    "Component Pouch",
    2.0,
);

pub const pouch: SmallContainer = SmallContainer.compInit(
    "Pouch",
    1.0,
);

pub const sack: SmallContainer = SmallContainer.compInit(
    "Sack",
    0.5,
);

// ============================================================================
// Ammunition Containers
// ============================================================================

pub const crossbow_bolt_case: Quiver = Quiver.compInit(
    "Crossbow Bolt Case",
    1.0,
);

pub const quiver: Quiver = Quiver.compInit(
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

pub const glass_bottle: FluidContainer = FluidContainer.compInit(
    "Glass Bottle",
    2.0,
    true,
);

pub const flask: FluidContainer = FluidContainer.compInit(
    "Flask",
    1.0,
    true,
);

pub const jug: FluidContainer = FluidContainer.compInit(
    "Jug",
    4.0,
    true,
);

pub const iron_pot: FluidContainer = FluidContainer.compInit(
    "Iron Pot",
    10.0,
    true,
);

pub const vial: FluidContainer = FluidContainer.compInit(
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

pub const acid: Fluid = Fluid.compInit(
    "Acid",
);

pub const alchemists_fire: Fluid = Fluid.compInit(
    "Alchemist's Fire",
);

pub const antitoxin: Fluid = Fluid.compInit(
    "Antitoxin",
);

pub const holy_water: Fluid = Fluid.compInit(
    "Holy Water",
);

pub const ink: Fluid = Fluid.compInit(
    "Ink",
);

pub const oil: Fluid = Fluid.compInit(
    "Oil",
);

pub const perfume: Fluid = Fluid.compInit(
    "Perfume",
);

pub const basic_poison: Fluid = Fluid.compInit(
    "Basic Poison",
);

// Potion of Healing intentionally omitted.

// ============================================================================
// Arcane Focuses
// ============================================================================

pub const crystal: Item = Item.compInit(
    "Crystal",
    1.0,
    true,
    true,
    null,
);

pub const orb: Item = Item.compInit(
    "Orb",
    3.0,
    true,
    true,
    null,
);

pub const rod: Item = Item.compInit(
    "Rod",
    2.0,
    true,
    false,
    null,
);

pub const staff: Item = Item.compInit(
    "Staff",
    4.0,
    true,
    false,
    null,
);

pub const wand: Item = Item.compInit(
    "Wand",
    1.0,
    true,
    true,
    null,
);

// ============================================================================
// Druidic Focuses
// ============================================================================

pub const sprig_of_mistletoe: Item = Item.compInit(
    "Sprig of Mistletoe",
    0.0,
    true,
    true,
    null,
);

pub const totem: Item = Item.compInit(
    "Totem",
    0.0,
    true,
    true,
    null,
);

pub const wooden_staff: Item = Item.compInit(
    "Wooden Staff",
    4.0,
    true,
    false,
    null,
);

pub const yew_wand: Item = Item.compInit(
    "Yew Wand",
    1.0,
    true,
    true,
    null,
);

// ============================================================================
// Holy Symbols
// ============================================================================

pub const amulet: Item = Item.compInit(
    "Amulet",
    1.0,
    true,
    true,
    null,
);

pub const emblem: Item = Item.compInit(
    "Emblem",
    0.0,
    true,
    true,
    null,
);

pub const reliquary: Item = Item.compInit(
    "Reliquary",
    2.0,
    true,
    true,
    null,
);

// ============================================================================
// Adventuring Gear
// ============================================================================

pub const abacus: Item = Item.compInit(
    "Abacus",
    2.0,
    true,
    false,
    null,
);

pub const ball_bearing: Item = Item.compInit(
    "Ball Bearing",
    2.0 / 1000.0,
    true,
    true,
    null,
);

pub const bedroll: Item = Item.compInit(
    "Bedroll",
    7.0,
    true,
    false,
    null,
);

pub const bell: Item = Item.compInit(
    "Bell",
    0.0,
    true,
    true,
    null,
);

pub const blanket: Item = Item.compInit(
    "Blanket",
    3.0,
    true,
    false,
    null,
);

pub const block_and_tackle: Item = Item.compInit(
    "Block and Tackle",
    5.0,
    true,
    false,
    null,
);

pub const book: Item = Item.compInit(
    "Book",
    5.0,
    true,
    false,
    null,
);

pub const caltrop: Item = Item.compInit(
    "Caltrop",
    2.0 / 20.0,
    true,
    true,
    null,
);

pub const candle: Item = Item.compInit(
    "Candle",
    0.0,
    true,
    true,
    null,
);

pub const chain: Item = Item.compInit(
    "Chain",
    10.0,
    true,
    false,
    10,
);

pub const chalk: Item = Item.compInit(
    "Chalk",
    0.0,
    true,
    true,
    null,
);

pub const climbers_kit: Item = Item.compInit(
    "Climber's Kit",
    12.0,
    true,
    false,
    null,
);

pub const common_clothes: Item = Item.compInit(
    "Common Clothes",
    3.0,
    true,
    false,
    null,
);

pub const costume: Item = Item.compInit(
    "Costume",
    4.0,
    true,
    false,
    null,
);

pub const fine_clothes: Item = Item.compInit(
    "Fine Clothes",
    6.0,
    true,
    false,
    null,
);

pub const travelers_clothes: Item = Item.compInit(
    "Traveler's Clothes",
    4.0,
    true,
    false,
    null,
);

pub const crowbar: Item = Item.compInit(
    "Crowbar",
    5.0,
    true,
    false,
    null,
);

pub const fishing_tackle: Item = Item.compInit(
    "Fishing Tackle",
    4.0,
    true,
    false,
    null,
);

pub const grappling_hook: Item = Item.compInit(
    "Grappling Hook",
    4.0,
    true,
    false,
    null,
);

pub const hammer: Item = Item.compInit(
    "Hammer",
    3.0,
    true,
    false,
    null,
);

pub const sledgehammer: Item = Item.compInit(
    "Sledgehammer",
    10.0,
    true,
    false,
    null,
);

pub const healers_kit: Item = Item.compInit(
    "Healer's Kit",
    3.0,
    true,
    false,
    null,
);

pub const hourglass: Item = Item.compInit(
    "Hourglass",
    1.0,
    true,
    true,
    null,
);

pub const hunting_trap: Item = Item.compInit(
    "Hunting Trap",
    25.0,
    false,
    false,
    null,
);

pub const ink_pen: Item = Item.compInit(
    "Ink Pen",
    0.0,
    true,
    true,
    null,
);

pub const ladder: Item = Item.compInit(
    "Ladder",
    25.0,
    false,
    false,
    10,
);

pub const lamp: Item = Item.compInit(
    "Lamp",
    1.0,
    true,
    false,
    null,
);

pub const bullseye_lantern: Item = Item.compInit(
    "Bullseye Lantern",
    2.0,
    true,
    false,
    null,
);

pub const hooded_lantern: Item = Item.compInit(
    "Hooded Lantern",
    2.0,
    true,
    false,
    null,
);

pub const lock: Item = Item.compInit(
    "Lock",
    1.0,
    true,
    true,
    null,
);

pub const magnifying_glass: Item = Item.compInit(
    "Magnifying Glass",
    0.0,
    true,
    true,
    null,
);

pub const manacles: Item = Item.compInit(
    "Manacles",
    6.0,
    true,
    true,
    null,
);

pub const mess_kit: Item = Item.compInit(
    "Mess Kit",
    1.0,
    true,
    false,
    null,
);

pub const steel_mirror: Item = Item.compInit(
    "Steel Mirror",
    0.5,
    true,
    true,
    null,
);

pub const paper: Item = Item.compInit(
    "Paper",
    0.0,
    true,
    true,
    null,
);

pub const parchment: Item = Item.compInit(
    "Parchment",
    0.0,
    true,
    true,
    null,
);

pub const miners_pick: Item = Item.compInit(
    "Miner's Pick",
    10.0,
    true,
    false,
    null,
);

pub const piton: Item = Item.compInit(
    "Piton",
    0.25,
    true,
    true,
    null,
);

pub const pole: Item = Item.compInit(
    "Pole",
    7.0,
    true,
    false,
    10,
);

pub const portable_ram: Item = Item.compInit(
    "Portable Ram",
    35.0,
    false,
    false,
    null,
);

pub const ration: Item = Item.compInit(
    "Ration",
    2.0,
    true,
    true,
    null,
);

pub const robes: Item = Item.compInit(
    "Robes",
    4.0,
    true,
    false,
    null,
);

pub const hempen_rope: Item = Item.compInit(
    "Hempen Rope",
    10.0,
    true,
    false,
    50,
);

pub const silk_rope: Item = Item.compInit(
    "Silk Rope",
    5.0,
    true,
    false,
    50,
);

pub const merchants_scale: Item = Item.compInit(
    "Merchant's Scale",
    3.0,
    true,
    false,
    null,
);

pub const sealing_wax: Item = Item.compInit(
    "Sealing Wax",
    0.0,
    true,
    true,
    null,
);

pub const shovel: Item = Item.compInit(
    "Shovel",
    5.0,
    true,
    false,
    null,
);

pub const signal_whistle: Item = Item.compInit(
    "Signal Whistle",
    0.0,
    true,
    true,
    null,
);

pub const signet_ring: Item = Item.compInit(
    "Signet Ring",
    0.0,
    true,
    true,
    null,
);

pub const soap: Item = Item.compInit(
    "Soap",
    0.0,
    true,
    true,
    null,
);

pub const spellbook: Item = Item.compInit(
    "Spellbook",
    3.0,
    true,
    false,
    null,
);

pub const iron_spike: Item = Item.compInit(
    "Iron Spike",
    5.0 / 10.0,
    true,
    true,
    null,
);

pub const spyglass: Item = Item.compInit(
    "Spyglass",
    1.0,
    true,
    true,
    null,
);

pub const two_person_tent: Item = Item.compInit(
    "Two-Person Tent",
    20.0,
    true,
    false,
    null,
);

pub const tinderbox: Item = Item.compInit(
    "Tinderbox",
    1.0,
    true,
    true,
    null,
);

pub const torch: Item = Item.compInit(
    "Torch",
    1.0,
    true,
    false,
    null,
);

pub const whetstone: Item = Item.compInit(
    "Whetstone",
    1.0,
    true,
    true,
    null,
);

// ============================================================================
// Artisan's Tools
// ============================================================================

pub const alchemists_supplies: Tool = Tool.compInit(
    "Alchemist's Supplies",
    8.0,
    .artisans,
);

pub const brewers_supplies: Tool = Tool.compInit(
    "Brewer's Supplies",
    9.0,
    .artisans,
);

pub const calligraphers_supplies: Tool = Tool.compInit(
    "Calligrapher's Supplies",
    5.0,
    .artisans,
);

pub const carpenters_tools: Tool = Tool.compInit(
    "Carpenter's Tools",
    6.0,
    .artisans,
);

pub const cartographers_tools: Tool = Tool.compInit(
    "Cartographer's Tools",
    6.0,
    .artisans,
);

pub const cobblers_tools: Tool = Tool.compInit(
    "Cobbler's Tools",
    5.0,
    .artisans,
);

pub const cooks_utensils: Tool = Tool.compInit(
    "Cook's Utensils",
    8.0,
    .artisans,
);

pub const glassblowers_tools: Tool = Tool.compInit(
    "Glassblower's Tools",
    5.0,
    .artisans,
);

pub const jewelers_tools: Tool = Tool.compInit(
    "Jeweler's Tools",
    2.0,
    .artisans,
);

pub const leatherworkers_tools: Tool = Tool.compInit(
    "Leatherworker's Tools",
    5.0,
    .artisans,
);

pub const masons_tools: Tool = Tool.compInit(
    "Mason's Tools",
    8.0,
    .artisans,
);

pub const painters_supplies: Tool = Tool.compInit(
    "Painter's Supplies",
    5.0,
    .artisans,
);

pub const potters_tools: Tool = Tool.compInit(
    "Potter's Tools",
    3.0,
    .artisans,
);

pub const smiths_tools: Tool = Tool.compInit(
    "Smith's Tools",
    8.0,
    .artisans,
);

pub const tinkers_tools: Tool = Tool.compInit(
    "Tinker's Tools",
    10.0,
    .artisans,
);

pub const weavers_tools: Tool = Tool.compInit(
    "Weaver's Tools",
    5.0,
    .artisans,
);

pub const woodcarvers_tools: Tool = Tool.compInit(
    "Woodcarver's Tools",
    5.0,
    .artisans,
);

// ============================================================================
// Gaming Sets
// ============================================================================

pub const dice_set: Tool = Tool.compInit(
    "Dice Set",
    0.0,
    .gaming_set,
);

pub const dragonchess_set: Tool = Tool.compInit(
    "Dragonchess Set",
    0.5,
    .gaming_set,
);

pub const playing_card_set: Tool = Tool.compInit(
    "Playing Card Set",
    0.0,
    .gaming_set,
);

pub const three_dragon_ante_set: Tool = Tool.compInit(
    "Three-Dragon Ante Set",
    0.0,
    .gaming_set,
);

// ============================================================================
// Musical Instruments
// ============================================================================

pub const bagpipes: Tool = Tool.compInit(
    "Bagpipes",
    6.0,
    .instrument,
);

pub const drum: Tool = Tool.compInit(
    "Drum",
    3.0,
    .instrument,
);

pub const dulcimer: Tool = Tool.compInit(
    "Dulcimer",
    10.0,
    .instrument,
);

pub const flute: Tool = Tool.compInit(
    "Flute",
    1.0,
    .instrument,
);

pub const lute: Tool = Tool.compInit(
    "Lute",
    2.0,
    .instrument,
);

pub const lyre: Tool = Tool.compInit(
    "Lyre",
    2.0,
    .instrument,
);

pub const horn: Tool = Tool.compInit(
    "Horn",
    2.0,
    .instrument,
);

pub const pan_flute: Tool = Tool.compInit(
    "Pan Flute",
    2.0,
    .instrument,
);

pub const shawm: Tool = Tool.compInit(
    "Shawm",
    1.0,
    .instrument,
);

pub const viol: Tool = Tool.compInit(
    "Viol",
    1.0,
    .instrument,
);

// ============================================================================
// Other Tools
// ============================================================================

pub const disguise_kit: Tool = Tool.compInit(
    "Disguise Kit",
    3.0,
    .none,
);

pub const forgery_kit: Tool = Tool.compInit(
    "Forgery Kit",
    5.0,
    .none,
);

pub const herbalism_kit: Tool = Tool.compInit(
    "Herbalism Kit",
    3.0,
    .none,
);

pub const navigators_tools: Tool = Tool.compInit(
    "Navigator's Tools",
    2.0,
    .none,
);

pub const poisoners_kit: Tool = Tool.compInit(
    "Poisoner's Kit",
    2.0,
    .none,
);

pub const thieves_tools: Tool = Tool.compInit(
    "Thieves' Tools",
    1.0,
    .none,
);

pub const ammo_arr = [_]Ammo{
    arrow,
    blowgun_needle,
    crossbow_bolt,
    sling_bullet,
};

pub const container_arr = [_]Container{
    backpack,
    barrel,
    basket,
    bucket,
    map_scroll_case,
    chest,
};

pub const small_container_arr = [_]SmallContainer{
    component_pouch,
    pouch,
    sack,
};

pub const quiver_arr = [_]Quiver{
    crossbow_bolt_case,
    quiver,
};

pub const fluid_container_arr = [_]FluidContainer{
    glass_bottle,
    flask,
    jug,
    iron_pot,
    vial,
};

pub const fluid_arr = [_]Fluid{
    acid,
    alchemists_fire,
    antitoxin,
    holy_water,
    ink,
    oil,
    perfume,
    basic_poison,
};

pub const item_arr = [_]Item{
    crystal,
    orb,
    rod,
    staff,
    wand,

    sprig_of_mistletoe,
    totem,
    wooden_staff,
    yew_wand,

    amulet,
    emblem,
    reliquary,

    abacus,
    ball_bearing,
    bedroll,
    bell,
    blanket,
    block_and_tackle,
    book,
    caltrop,
    candle,
    chain,
    chalk,
    climbers_kit,
    common_clothes,
    costume,
    fine_clothes,
    travelers_clothes,
    crowbar,
    fishing_tackle,
    grappling_hook,
    hammer,
    sledgehammer,
    healers_kit,
    hourglass,
    hunting_trap,
    ink_pen,
    ladder,
    lamp,
    bullseye_lantern,
    hooded_lantern,
    lock,
    magnifying_glass,
    manacles,
    mess_kit,
    steel_mirror,
    paper,
    parchment,
    miners_pick,
    piton,
    pole,
    portable_ram,
    ration,
    robes,
    hempen_rope,
    silk_rope,
    merchants_scale,
    sealing_wax,
    shovel,
    signal_whistle,
    signet_ring,
    soap,
    spellbook,
    iron_spike,
    spyglass,
    two_person_tent,
    tinderbox,
    torch,
    whetstone,
};

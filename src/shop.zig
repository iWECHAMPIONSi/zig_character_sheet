const std = @import("std");
const weapons = @import("weapons.zig");
const armors = @import("armor.zig");
const items = @import("items.zig");
const Item = items.Item;
const hash = std.hash.Wyhash.hash;
const cantrips = @import("cantrips.zig");
const errors = @import("errors.zig");
const spells = @import("spells.zig");
const currency = @import("currency.zig");
const Currency = currency.Currency;
const CurrencyValue = currency.CurrencyValue;
const CurrencyTable = currency.CurrencyTable;
const StdErr = errors.StdErr;
const enums = @import("enums.zig");

pub const EquipmentPack = struct {
    name: []const u8,
    hash: u64,
    source: union(enum) { default_source: enums.Source, custom_source: []const u8 },
    cost: CurrencyValue,
    /// this will default to the item's in-shop values (equivelant to buying the items for free) if the item does not have a shop entry for any reason, it will just fall back to the item by itself
    contents: []const struct { count: u64, item: u64 },

    const Self = @This();

    pub fn compInit(
        comptime name: []const u8,
        comptime source: enums.Source,
        comptime cost: CurrencyValue,
        comptime contents: []const struct { count: u64, item: u64 },
    ) Self {
        return .{
            .name = name,
            .hash = hash(0, name),
            .source = .{ .default_source = source },
            .cost = cost,
            .contents = contents,
        };
    }
};

pub const ShopEntry = struct {
    item: u64,
    cost: currency.CurrencyValue,
    count: u64,
    wrapping_container: ?u64,

    const Self = @This();

    pub fn compInit(
        comptime item: u64,
        comptime cost: currency.CurrencyValue,
        comptime count: u64,
        comptime wrapping_container: ?u64,
    ) Self {
        return .{
            .item = item,
            .cost = cost,
            .count = count,
            .wrapping_container = wrapping_container,
        };
    }
};

const std = @import("std");
const weapons = @import("weapons.zig");
const armors = @import("armor.zig");
const items = @import("items.zig");
const Item = items.Item;
const cantrips = @import("cantrips.zig");
const errors = @import("errors.zig");
const spells = @import("spells.zig");
const currency = @import("currency.zig");
const Currency = currency.Currency;
const CurrencyAmount = currency.CurrencyAmount;
const CurrencyTable = currency.CurrencyTable;
const StdErr = errors.StdErr;

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
            .wrapping_contaner = wrapping_container,
        };
    }
};

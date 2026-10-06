const std = @import("std");
const dice = @import("dice.zig");
const Dice = dice.Dice;
const Roll = dice.Roll;
const Io = std.Io;
const weapons = @import("weapons.zig");
const Weapon = weapons.Weapon;
const WeaponProperties = weapons.WeaponProperties;
const currency = @import("currency.zig");
const Currency = currency.Currency;
const CurrencyValue = currency.CurrencyValue;
const enums = @import("enums.zig");
const items = @import("items.zig");
const armor = @import("armor.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const hash_handler = @import("hash_handler.zig");

const zig_character_sheet = @import("zig_character_sheet");

pub fn main(init: std.process.Init) !void {
    const allocator = init.arena.allocator();
    const io = init.io;
    var io_source: std.Random.IoSource = .{ .io = io };
    const secure_source = io_source.interface();
    const seed = secure_source.int(u64);
    var prng = std.Random.DefaultPrng.init(seed);

    const rand: std.Random = prng.random();

    dice.d4.setRng(rand);
    dice.d6.setRng(rand);
    dice.d8.setRng(rand);
    dice.d10.setRng(rand);
    dice.d12.setRng(rand);
    dice.d20.setRng(rand);
    dice.d100.setRng(rand);

    try hash_handler.startupValidation(allocator);
    defer hash_handler.hash_table.deinit(allocator);
}

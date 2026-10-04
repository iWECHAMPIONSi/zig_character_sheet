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
const CurrencyAmount = currency.CurrencyAmount;
const enums = @import("enums.zig");

const zig_character_sheet = @import("zig_character_sheet");

pub fn main(init: std.process.Init) !void {
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

    var club: Weapon = weapons.club;

    std.debug.print("{s} rolled a {!}\n", .{ club.name, club.roll() });
}

const std = @import("std");
const dice = @import("dice.zig");
const Dice = dice.Dice;
const DiceSet = dice.DiceSet;
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

    const d4: Dice = Dice.init(4, rand);
    const d6: Dice = Dice.init(6, rand);
    const d8: Dice = Dice.init(8, rand);
    const d10: Dice = Dice.init(10, rand);
    const d12: Dice = Dice.init(12, rand);
    const d20: Dice = Dice.init(20, rand);
    const d100: Dice = Dice.init(100, rand);

    const dice_set: DiceSet = .{ .d4 = d4, .d6 = d6, .d8 = d8, .d10 = d10, .d12 = d12, .d20 = d20, .d100 = d100 };
    dice.PubDiceSet = dice_set;

    const club: Weapon = weapons.club;

    std.debug.print("{} rolled a {}\n", .{ club.name, club.roll() });
}

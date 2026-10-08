const std = @import("std");
const dice = @import("dice.zig");
const Dice = dice.Dice;
const Roll = dice.Roll;
const Io = std.Io;
const currency = @import("currency.zig");
const Currency = currency.Currency;
const CurrencyValue = currency.CurrencyValue;
const enums = @import("enums.zig");
const items = @import("items.zig");
const armor = @import("armor.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const hash_handler = @import("hash_handler.zig");
const modifier = @import("modifier.zig");
const AttackRoll = modifier.AttackRoll;
const DiceModRoll = modifier.DiceModRoll;

const zig_character_sheet = @import("zig_character_sheet");

const mod: DiceModRoll = .{ .roll = .{ .flat = 5 }, .negative = false };

const test_roll: AttackRoll = AttackRoll.compInit(enums.AttackType.melee, &.{mod});

pub fn main(init: std.process.Init) !void {
    const allocator = init.arena.allocator();
    const io = init.io;
    var io_source: std.Random.IoSource = .{ .io = io };
    const secure_source = io_source.interface();
    const seed = secure_source.int(u64);
    var prng = std.Random.DefaultPrng.init(seed);

    const rand: std.Random = prng.random();

    _ = test_roll;

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

const std = @import("std");

pub const Dice = struct {
    sides: u8,
    rng: std.Random,
    const Self = @This();

    pub fn init(sides: u8, rng: std.Random) Self {
        return .{ .sides = sides, .rng = rng };
    }

    pub fn roll(self: *Self) u8 {
        return self.rng.intRangeAtMost(1, self.sides);
    }
    //
};

pub const DiceSet = struct { d4: Dice, d6: Dice, d8: Dice, d10: Dice, d12: Dice, d20: Dice, d100: Dice };

pub var PubDiceSet: DiceSet = undefined;

pub const Roll = struct {
    count: u8,
    dice: Dice,
};

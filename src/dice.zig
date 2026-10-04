const std = @import("std");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;

pub const Dice = struct {
    sides: u8,
    rng: ?std.Random,
    const Self = @This();

    pub fn init(sides: u8, rng: ?std.Random) Self {
        return .{ .sides = sides, .rng = rng };
    }

    pub fn roll(self: *Self) StdErr!u8 {
        if (self.rng) |rng| {
            return rng.intRangeAtMost(u8, 1, self.sides);
        } else {
            return StdErr.RuntimeFnCalledAtComptime;
        }
    }

    pub fn setRng(self: *Self, rng: std.Random) void {
        self.rng = rng;
    }
    //
};

pub var d4: Dice = Dice.init(4, null);
pub var d6: Dice = Dice.init(6, null);
pub var d8: Dice = Dice.init(8, null);
pub var d10: Dice = Dice.init(10, null);
pub var d12: Dice = Dice.init(12, null);
pub var d20: Dice = Dice.init(20, null);
pub var d100: Dice = Dice.init(100, null);

pub const Roll = struct {
    count: u8,
    dice: *Dice,
};

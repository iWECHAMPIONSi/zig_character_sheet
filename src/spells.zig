const enums = @import("enums.zig");

pub const Components = struct {
    v: bool,
    s: bool,
    m: struct { m: bool, desc: ?[]const u8 },
};

pub const CastingTime = struct {
    unit: enums.Time,
    time: u64,
    bonus: bool,
};

pub const CastingRange = struct {
    unit: enums.Distance,
    amount: u64,
    shape: ?struct { distance: u64, shape: ?enums.Shapes },
};

pub const Duration = struct {
    unit: enums.Time,
    amount: u64,
    concentration: bool,
};

pub const Spell = struct {
    name: []const u8,
    hash: u64,
    classes: []const u64, // the actual classes will be implimented later, but for now we are only going to have a commented out portion that's going to be an array of u64 hashes {
    school: enums.SchoolOfMagic,
    casting_time: CastingTime,
    casting_range: CastingRange,
    components: Components,
    duration: Duration,
    desc: []const u8,
};

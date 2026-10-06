pub const Time = enum(i64) {
    second = 1,
    minute = 60,
    hour = 3600,
    day = 3600 * 24,

    instantaneous,
    action,
    round,

    pub fn convert(self: Time) i64 {
        return switch (self) {
            .instantaneous => 0,
            .action, .round => 6,
            else => @intFromEnum(self),
        };
    }
};

pub const TimeValue = struct {
    unit: Time,
    count: i64,
};

pub const Duration = union(enum) {
    instantaneous,
    action,
    round,
    duration: TimeValue,
};

pub const Distance = enum(i64) {
    inch = 1,
    foot = 12,
    yard = 36,
    mile = 36 * 1760,

    self,
    touch,

    pub fn convert(self: Distance) i64 {
        return switch (self) {
            .self, .touch => 0,
            else => @intFromEnum(self),
        };
    }
};

pub const DistanceValue = struct {
    unit: Distance,
    count: i64,
};

pub const Range = union(enum) {
    self,
    touch,
    distance: DistanceValue,
};

const TravelPace = struct {
    minute: DistanceValue,
    hour: DistanceValue,
    day: DistanceValue,
    effect: ?[]const u8,
};

pub const Pace = struct {
    pub const fast: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .count = 400,
        },
        .hour = .{
            .unit = .mile,
            .count = 4,
        },
        .day = .{
            .unit = .mile,
            .count = 30,
        },
        .effect = "-5 penalty to passive Wisdom (Perception) scores",
    };

    pub const normal: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .count = 300,
        },
        .hour = .{
            .unit = .mile,
            .count = 3,
        },
        .day = .{
            .unit = .mile,
            .count = 24,
        },
        .effect = null,
    };

    pub const slow: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .count = 200,
        },
        .hour = .{
            .unit = .mile,
            .count = 2,
        },
        .day = .{
            .unit = .mile,
            .count = 18,
        },
        .effect = "Able to use stealth",
    };
};

pub const Weight = enum(i64) {
    ounce = 1,
    pound = 16,
};

pub const Volume = enum(i64) {
    ounce = 1,
    pint = 16,
    quart = 32,
    gallon = 128,
};

pub const WeightValue = struct {
    unit: Weight,
    count: f64,
};

pub const VolumeValue = struct {
    unit: Volume,
    count: f64,
};

pub const CubicVolumeValue = struct {
    unit: Distance,
    count: f64,
};

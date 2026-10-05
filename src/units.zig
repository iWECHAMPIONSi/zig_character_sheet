pub const Time = enum(u64) {
    second = 1,
    minute = 60,
    hour = 3600,
    day = 3600 * 24,

    instantaneous,
    action,
    round,

    pub fn convert(self: Time) u64 {
        return switch (self) {
            .instantaneous => 0,
            .action, .round => 6,
            else => @intFromEnum(self),
        };
    }
};

pub const Duration = union(enum) {
    instantaneous,
    action,
    round,
    duration: struct {
        unit: Time,
        value: u64,
    },
};

pub const Distance = enum(u64) {
    inch = 1,
    foot = 12,
    yard = 36,
    mile = 36 * 1760,

    self,
    touch,

    pub fn convert(self: Distance) u64 {
        return switch (self) {
            .self, .touch => 0,
            else => @intFromEnum(self),
        };
    }
};

pub const Range = union(enum) {
    self,
    touch,
    distance: struct {
        unit: Distance,
        value: u64,
    },
};

const TravelDistance = struct {
    unit: Distance,
    distance: u64,
};

const TravelPace = struct {
    minute: TravelDistance,
    hour: TravelDistance,
    day: TravelDistance,
    effect: ?[]const u8,
};

pub const Pace = struct {
    pub const fast: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .distance = 400,
        },
        .hour = .{
            .unit = .mile,
            .distance = 4,
        },
        .day = .{
            .unit = .mile,
            .distance = 30,
        },
        .effect = "-5 penalty to passive Wisdom (Perception) scores",
    };

    pub const normal: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .distance = 300,
        },
        .hour = .{
            .unit = .mile,
            .distance = 3,
        },
        .day = .{
            .unit = .mile,
            .distance = 24,
        },
        .effect = null,
    };

    pub const slow: TravelPace = .{
        .minute = .{
            .unit = .foot,
            .distance = 200,
        },
        .hour = .{
            .unit = .mile,
            .distance = 2,
        },
        .day = .{
            .unit = .mile,
            .distance = 18,
        },
        .effect = "Able to use stealth",
    };
};

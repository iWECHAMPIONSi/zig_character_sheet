const std = @import("std");
const ArrayList = std.ArrayList;

const errors = @import("errors.zig");
const StdErr = errors.StdErr;

const Pair = struct {
    key: u64,
    value: []const u8,
};

const SearchResult = struct {
    found: bool,
    index: usize,
};

pub const HashMap = struct {
    map: ArrayList(Pair),

    const Self = @This();

    pub fn init() Self {
        return .{
            .map = ArrayList(Pair).empty,
        };
    }

    pub fn deinit(self: *Self, allocator: std.mem.Allocator) void {
        self.map.deinit(allocator);
    }

    pub fn get(self: *const Self, key: u64) ?[]const u8 {
        const result = self.selfSearch(key);

        if (!result.found) {
            return null;
        }

        return self.map.items[result.index].value;
    }

    pub fn search(self: *const Self, key: u64) bool {
        return self.selfSearch(key).found;
    }

    fn selfSearch(self: *const Self, key: u64) SearchResult {
        var low: usize = 0;
        var high: usize = self.map.items.len;

        while (low < high) {
            const mid = low + (high - low) / 2;
            const mid_key = self.map.items[mid].key;

            if (mid_key < key) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }

        return .{
            .found = low < self.map.items.len and
                self.map.items[low].key == key,
            .index = low,
        };
    }

    pub fn put(
        self: *Self,
        allocator: std.mem.Allocator,
        key: u64,
        value: []const u8,
    ) StdErr!void {
        const result = self.selfSearch(key);

        if (result.found) {
            return StdErr.DuplicateHash;
        }

        self.map.insert(
            allocator,
            result.index,
            .{
                .key = key,
                .value = value,
            },
        ) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    pub fn remove(self: *Self, key: u64) bool {
        const result = self.selfSearch(key);

        if (!result.found) {
            return false;
        }

        _ = self.map.orderedRemove(result.index);
        return true;
    }
};

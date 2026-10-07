const std = @import("std");
const ArrayList = std.ArrayList;

const errors = @import("errors.zig");
const StdErr = errors.StdErr;

const items = @import("items.zig");
const Item = items.Item;

const spells = @import("spells.zig");
const Spell = spells.Spell;

const Pair = struct {
    key: u64,
    value: []const u8,
};

const SearchResult = struct {
    found: bool,
    index: usize,
};

pub const map_type = union(enum) { item: u64, spell: u64 };

pub const ArrayId = struct {
    list: ArrayList(Pair),
    id: u64,
};

pub const HashMap = struct {
    map: struct {
        items: ArrayList(Pair),
        spells: ArrayList(Pair),
    },

    const Self = @This();

    pub fn init() Self {
        return .{ .map = .{ .items = ArrayList(Pair).empty, .spells = ArrayList(Pair).empty } };
    }

    pub fn deinit(self: *Self, allocator: std.mem.Allocator) void {
        self.map.items.deinit(allocator);
        self.map.spells.deinit(allocator);
    }

    pub fn get(self: *const Self, key: map_type) ?[]const u8 {
        const result = self.selfSearch(key);

        if (!result.found) {
            return null;
        }

        return switch (key) {
            .item => self.map.items.items[result.index].value,
            .spell => self.map.spells.items[result.index].value,
        };
    }

    pub fn search(self: *const Self, key: map_type) bool {
        return self.selfSearch(key).found;
    }

    fn selfSearch(self: *const Self, key: map_type) SearchResult {
        const data: ArrayId = switch (key) {
            .item => .{
                .list = self.map.items,
                .id = key.item,
            },
            .spell => .{
                .list = self.map.spells,
                .id = key.spell,
            },
        };
        const list: ArrayList(Pair) = data.list;
        const id: u64 = data.id;
        var low: usize = 0;
        var high: usize = list.items.len;

        while (low < high) {
            const mid = low + (high - low) / 2;
            const mid_key = list.items[mid].key;

            if (mid_key < id) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }

        return .{
            .found = low < list.items.len and
                list.items[low].key == id,
            .index = low,
        };
    }

    pub fn put(
        self: *Self,
        allocator: std.mem.Allocator,
        key: map_type,
        value: []const u8,
    ) StdErr!void {
        const result = self.selfSearch(key);

        if (result.found) {
            return StdErr.DuplicateHash;
        }
        switch (key) {
            .item => {
                self.map.items.insert(
                    allocator,
                    result.index,
                    .{
                        .key = key.item,
                        .value = value,
                    },
                ) catch {
                    return StdErr.MemoryAllocationFailed;
                };
            },
            .spell => {
                self.map.spells.insert(
                    allocator,
                    result.index,
                    .{
                        .key = key.spell,
                        .value = value,
                    },
                ) catch {
                    return StdErr.MemoryAllocationFailed;
                };
            },
        }
    }

    pub fn remove(self: *Self, key: map_type) bool {
        const result = self.selfSearch(key);

        if (!result.found) {
            return false;
        }

        _ = switch (key) {
            .item => self.map.items.orderedRemove(result.index),
            .spell => self.map.spells.orderedRemove(result.index),
        };
        return true;
    }
};

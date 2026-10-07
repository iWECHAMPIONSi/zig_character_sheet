const std = @import("std");
const weapons = @import("weapons.zig");
const armors = @import("armor.zig");
const items = @import("items.zig");
const Item = items.Item;
const gear = @import("adventuring_gear.zig");
const packs = @import("equipment_packs.zig");
const tools = @import("tools.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const HashMap = @import("hash_table.zig").HashMap;
const cantrips = @import("cantrips.zig");

pub var hash_table: HashMap = undefined;

pub fn startupValidation(allocator: std.mem.Allocator) StdErr!void {
    hash_table = HashMap.init();
    errdefer hash_table.deinit(allocator);
    for (weapons.weapon_arr) |weapon| {
        if (hash_table.get(weapon.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, weapon.hash, weapon.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (weapons.ammunition_arr) |ammo| {
        if (hash_table.get(ammo.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, ammo.hash, ammo.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (armors.armor_arr) |armor| {
        if (hash_table.get(armor.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, armor.hash, armor.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (armors.shield_arr) |shield| {
        if (hash_table.get(shield.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, shield.hash, shield.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (gear.item_arr) |item| {
        if (hash_table.get(item.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, item.hash, item.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (tools.tool_arr) |tool| {
        if (hash_table.get(tool.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, tool.hash, tool.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (cantrips.cantrip_arr) |cantrip| {
        if (hash_table.get(cantrip.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, cantrip.hash, cantrip.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }
}

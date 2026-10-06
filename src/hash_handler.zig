const std = @import("std");
const weapons = @import("weapons.zig");
const armors = @import("armor.zig");
const items = @import("items.zig");
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

    for (items.item_arr) |item| {
        if (hash_table.get(item.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, item.hash, item.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (items.ammo_arr) |ammo| {
        if (hash_table.get(ammo.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, ammo.hash, ammo.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (items.container_arr) |container| {
        if (hash_table.get(container.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, container.hash, container.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (items.small_container_arr) |small_container| {
        if (hash_table.get(small_container.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, small_container.hash, small_container.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (items.quiver_arr) |quiver| {
        if (hash_table.get(quiver.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, quiver.hash, quiver.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (items.fluid_container_arr) |fluid_container| {
        if (hash_table.get(fluid_container.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, fluid_container.hash, fluid_container.name) catch {
            return StdErr.MemoryAllocationFailed;
        };
    }

    for (items.fluid_arr) |fluid| {
        if (hash_table.get(fluid.hash) != null) {
            return StdErr.DuplicateHash;
        }
        hash_table.put(allocator, fluid.hash, fluid.name) catch {
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

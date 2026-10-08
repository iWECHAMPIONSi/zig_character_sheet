const std = @import("std");
const hash = std.hash.Wyhash.hash;
const weapons = @import("weapons.zig");
const armors = @import("armor.zig");
const items = @import("items.zig");
const gear = @import("adventuring_gear.zig");
const packs = @import("equipment_packs.zig");
const tools = @import("tools.zig");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const HashMap = @import("hash_table.zig").HashMap;
const spells = @import("all_spells.zig");

pub var hash_table: HashMap = undefined;

pub fn startupValidation(allocator: std.mem.Allocator) StdErr!void {
    hash_table = HashMap.init();
    errdefer hash_table.deinit(allocator);
    for (weapons.weapon_arr) |weapon| {
        if (hash_table.get(.{ .item = weapon.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .item = weapon.hash }, weapon.name);
    }

    for (weapons.ammunition_arr) |ammo| {
        if (hash_table.get(.{ .item = ammo.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .item = ammo.hash }, ammo.name);
    }

    for (armors.armor_arr) |armor| {
        if (hash_table.get(.{ .item = armor.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .item = armor.hash }, armor.name);
    }

    for (armors.shield_arr) |shield| {
        if (hash_table.get(.{ .item = shield.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .item = shield.hash }, shield.name);
    }

    for (gear.item_arr) |item| {
        if (hash_table.get(.{ .item = item.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .item = item.hash }, item.name);
    }

    for (tools.tool_arr) |tool| {
        if (hash_table.get(.{ .item = tool.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .item = tool.hash }, tool.name);
    }

    for (spells.cantrips.cantrip_arr) |cantrip| {
        if (hash_table.get(.{ .spell = cantrip.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = cantrip.hash }, cantrip.name);
    }

    for (spells.level_1.level_1_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            const i: []const u8 = hash_table.get(.{ .spell = spell.hash }).?;
            std.debug.print("{s} {} : {s} {}\n", .{ spell.name, spell.hash, i, hash(0, i) });
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_2.level_2_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_3.level_3_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_4.level_4_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_5.level_5_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_6.level_6_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_7.level_7_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_8.level_8_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
    for (spells.level_9.level_9_spell_arr) |spell| {
        if (hash_table.get(.{ .spell = spell.hash }) != null) {
            return StdErr.DuplicateHash;
        }
        try hash_table.put(allocator, .{ .spell = spell.hash }, spell.name);
    }
}

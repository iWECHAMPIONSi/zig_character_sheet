const enums = @import("enums.zig");
pub const DescriptionField = struct {
    table: ?Table,
    heading: ?[]const u8,
    desc: ?[]const u8,
};

pub const Description = struct {
    desc: ?[]const u8,
    desc_fields: ?[]const DescriptionField,
};

pub const HigherLevel = struct {
    level: union(enum) { character: u8, slot: enums.SpellLevel },
    desc: ?[]DescriptionField,
};

pub const TableField = union(enum) {
    str: []const u8,
    int: i64,
};

pub const TableEntry = []const TableField;

pub const TableHeading = []const u8;

/// the length of headings and the length of every TableEntry must be equal
pub const Table = struct {
    headings: []const TableHeading,
    table_entry: []const TableEntry,
};

const enums = @import("enums.zig");
const std = @import("std");
const errors = @import("errors.zig");
const StdErr = errors.StdErr;
const ArrayList = std.ArrayList;

pub const Conditional = union(enum) {
    inventory: enums.HashIdentity,
    operator: enums.Operators,
};

pub const EquationPart = union(enum) {
    conditional: Conditional,
    number: i64,
    character_stat: union(enum) {
        ability_score: enums.Ability,
        ability_mod: enums.Ability,
        player_stat: enums.PlayerStat,
    },
};

pub const EquationArea = union(enum) {
    equation: *Equation,
    part: [3]EquationPart,
};

const AndArea = struct {
    start: usize,
    end: usize,
};

pub const Equation = struct {
    equation: []EquationArea,
    validated: bool,
    const Self = @This();

    pub fn deinit(self: *Self, allocator: std.mem.Allocator) void {
        if (!self.validated) return;
        for (self.equation) |i| {
            switch (i) {
                .equation => {
                    i.equation.deinit(allocator);
                },
                else => {},
            }
        }
        allocator.free(self.equation);
    }

    pub fn validate(self: *Self, allocator: std.mem.Allocator) StdErr!void {
        if (self.validated) return;
        var and_indexes: ArrayList(AndArea) = ArrayList(AndArea).empty;
        defer and_indexes.deinit(allocator);

        var not_indexes: ArrayList(usize) = ArrayList(usize).empty;
        defer not_indexes.deinit(allocator);

        var not: bool = false;
        var current_logic: ?enums.LogicOperators = null;
        var and_found: bool = false;
        var not_found: bool = false;
        var start_index: usize = 0;
        var prev_equation = false;

        var a: ?EquationPart = null;
        var b: ?EquationPart = null;
        var c: ?EquationPart = null;

        for (0..self.equation.len, self.equation) |index, area| {
            if (!not_found and !and_found) {
                start_index = index;
            }

            switch (area) {
                .equation => {
                    if (prev_equation) {
                        return StdErr.InvalidStateReached;
                    }
                    try area.equation.validate(allocator);
                    if (not) {
                        not = false;
                    }

                    if (current_logic) |logic| {
                        switch (logic) {
                            .not => {
                                return StdErr.InvalidStateReached;
                            },
                            .@"and", .nand => {},
                            else => {},
                        }
                    }
                    current_logic = null;
                    prev_equation = true;

                    continue;
                },

                .part => {
                    var num_1: ?i64 = null;
                    var num_2: ?i64 = null;
                    a = area.part[0];
                    b = area.part[1];
                    c = area.part[2];
                    if (a) |r| {
                        switch (r) {
                            .conditional => {
                                const con = r.conditional;
                                switch (con) {
                                    .operator => {
                                        const op = con.operator;
                                        switch (op) {
                                            .logic => {
                                                const logic = op.logic;
                                                if (not) {
                                                    return StdErr.InvalidStateReached;
                                                }
                                                switch (logic) {
                                                    .@"and", .nand => {
                                                        if (current_logic != null) {
                                                            return StdErr.InvalidStateReached;
                                                        }
                                                        prev_equation = false;
                                                        current_logic = enums.LogicOperators.@"and";
                                                        if (!and_found) {
                                                            if (start_index == index) {
                                                                start_index -= 1;
                                                            }
                                                            and_found = true;
                                                        }
                                                    },
                                                    .not => {
                                                        if (prev_equation) {
                                                            return StdErr.InvalidStateReached;
                                                        }
                                                        not = true;
                                                        if (!not_found) {
                                                            not_found = true;
                                                        }
                                                    },
                                                    else => {
                                                        if (current_logic != null) {
                                                            return StdErr.InvalidStateReached;
                                                        }
                                                        prev_equation = false;
                                                        current_logic = enums.LogicOperators.@"or";
                                                        not_found = false;
                                                        if (and_found) {
                                                            and_indexes.append(allocator, .{ .start = start_index, .end = index });
                                                            and_found = false;
                                                        }
                                                    },
                                                }
                                            },
                                            .compare => {
                                                return StdErr.InvalidStateReached;
                                            },
                                        }
                                    },
                                    .inventory => {
                                        return StdErr.InvalidStateReached;
                                    },
                                }
                                continue;
                            },
                            .number => {
                                if (prev_equation) {
                                    return StdErr.InvalidStateReached;
                                }
                                prev_equation = true;
                                num_1 = r.number;
                            },
                            .character_stat => {
                                return StdErr.InvalidStateReached;
                            },
                        }
                    }

                    if (b) |r| {
                        switch (r) {
                            .conditional => {
                                const con = r.conditional;

                                switch (con) {
                                    .operator => {
                                        const op = con.operator;
                                        switch (op) {
                                            .logic => {
                                                return StdErr.InvalidStateReached;
                                            },
                                            .compare => {},
                                        }
                                    },
                                    .inventory => {
                                        return StdErr.InvalidStateReached;
                                    },
                                }
                            },
                            .character_stat => {
                                return StdErr.InvalidStateReached;
                            },
                            .number => {
                                return StdErr.InvalidStateReached;
                            },
                        }
                    }

                    if (c) |r| {
                        switch (r) {
                            .conditional => {
                                return StdErr.InvalidStateReached;
                            },
                            .character_stat => {
                                return StdErr.InvalidStateReached;
                            },
                            .number => {
                                num_2 = r.number;
                            },
                        }
                    } else {
                        return StdErr.InvalidStateReached;
                    }

                    if (num_1) |_| {
                        if (num_2) |_| {
                            if (not) {
                                not = false;
                            }
                            if (current_logic) |logic| {
                                switch (logic) {
                                    .not => {
                                        return StdErr.InvalidStateReached;
                                    },
                                    .@"and", .nand => {},
                                    else => {},
                                }
                            }
                            current_logic = null;
                            prev_equation = true;

                            continue;
                        } else {
                            return StdErr.InvalidStateReached;
                        }
                    } else {
                        return StdErr.InvalidStateReached;
                    }
                },
            }
            prev_equation = false;
        }
        if (and_found) {
            and_indexes.append(allocator, .{ .start = start_index, .end = self.equation.len });
        }
        var new_equation = ArrayList(EquationArea).empty;
        var and_area: ?AndArea = null;
        if (and_indexes.items.len > 0) {
            and_area = and_indexes.orderedRemove(0);
        }
        var temp = ArrayList(EquationArea).empty;
        defer temp.deinit(allocator);
        for (0..self.equation.len) |index| {
            if (and_area) |area| {
                if (index >= area.start) {
                    temp.append(allocator, self.equation[index]);
                } else {
                    new_equation.append(allocator, self.equation[index]);
                }
                if (index + 1 == area.end) {
                    and_area = null;
                    const temp_arr: []EquationArea = temp.toOwnedSlice(allocator);
                    var temp_equation: Self = .{ .validated = false, .equation = temp_arr };
                    temp_equation.validate(allocator);
                    allocator.free(temp_arr);
                    new_equation.append(allocator, .{ .equation = &temp_equation });
                    if (and_indexes.items.len > 0) {
                        and_area = and_indexes.orderedRemove(0);
                    }
                }
            } else {
                new_equation.append(allocator, self.equation[index]);
            }
        }
        self.equation = new_equation.toOwnedSlice(allocator);
    }

    pub fn solve(self: *Self) StdErr!bool {
        var a: ?EquationPart = null;
        var b: ?EquationPart = null;
        var c: ?EquationPart = null;

        var ret_val: bool = true;
        var not: bool = false;
        var current_logic: ?enums.LogicOperators = null;

        for (self.equation) |area| {
            switch (area) {
                .equation => {
                    var result: bool = try area.equation.solve();
                    if (not) {
                        result = !result;
                        not = false;
                    }

                    if (current_logic) |logic| {
                        ret_val = switch (logic) {
                            .@"and" => ret_val and result,
                            .@"or" => ret_val or result,
                            .not => {
                                return StdErr.InvalidStateReached;
                            },
                            .nand => !(ret_val and result),
                            .nor => !(ret_val or result),
                            .xor => ret_val ^ result,
                        };
                    } else {
                        ret_val = result;
                    }
                    current_logic = null;

                    continue;
                },
                .part => {
                    var num_1: ?i64 = null;
                    var comp: ?enums.CompareOperators = null;
                    var num_2: ?i64 = null;
                    a = area.part[0];
                    b = area.part[1];
                    c = area.part[2];
                    if (a) |r| {
                        switch (r) {
                            .conditional => {
                                const con = r.conditional;
                                switch (con) {
                                    .operator => {
                                        const op = con.operator;
                                        switch (op) {
                                            .logic => {
                                                const logic = op.logic;
                                                if (not) {
                                                    return StdErr.InvalidStateReached;
                                                }
                                                switch (logic) {
                                                    .not => not = true,
                                                    else => {
                                                        if (current_logic != null) {
                                                            return StdErr.InvalidStateReached;
                                                        }
                                                        current_logic = op.logic;
                                                    },
                                                }
                                            },
                                            .compare => {
                                                return StdErr.InvalidStateReached;
                                            },
                                        }
                                    },
                                    .inventory => {
                                        return StdErr.InvalidStateReached;
                                    },
                                }

                                continue;
                            },
                            .number => {
                                num_1 = r.number;
                            },
                            .character_stat => {
                                unreachable;
                            },
                        }
                    }

                    if (b) |r| {
                        switch (r) {
                            .conditional => {
                                const con = r.conditional;

                                switch (con) {
                                    .operator => {
                                        const op = con.operator;
                                        switch (op) {
                                            .logic => {
                                                return StdErr.InvalidStateReached;
                                            },
                                            .compare => {
                                                comp = op.compare;
                                            },
                                        }
                                    },
                                    .inventory => {
                                        return StdErr.InvalidStateReached;
                                    },
                                }
                            },
                            .character_stat => {
                                return StdErr.InvalidStateReached;
                            },
                            .number => {
                                return StdErr.InvalidStateReached;
                            },
                        }
                    }

                    if (c) |r| {
                        switch (r) {
                            .conditional => {
                                return StdErr.InvalidStateReached;
                            },
                            .character_stat => {
                                return StdErr.InvalidStateReached;
                            },
                            .number => {
                                num_2 = r.number;
                            },
                        }
                    } else {
                        return StdErr.InvalidStateReached;
                    }

                    if (num_1) |number_1| {
                        if (num_2) |number_2| {
                            var result = switch (comp.?) {
                                .gt => number_1 > number_2,
                                .gte => number_1 >= number_2,
                                .eq => number_1 == number_2,
                                .neq => number_1 != number_2,
                                .lte => number_1 <= number_2,
                                .lt => number_1 < number_2,
                            };

                            if (not) {
                                result = !result;
                                not = false;
                            }

                            if (current_logic) |logic| {
                                ret_val = switch (logic) {
                                    .@"and" => ret_val and result,
                                    .@"or" => ret_val or result,
                                    .not => {
                                        return StdErr.InvalidStateReached;
                                    },
                                    .nand => !(ret_val and result),
                                    .nor => !(ret_val or result),
                                    .xor => ret_val ^ result,
                                };
                            } else {
                                ret_val = result;
                            }
                        } else {
                            return StdErr.InvalidStateReached;
                        }
                    } else {
                        return StdErr.InvalidStateReached;
                    }
                },
            }
        }
        return ret_val;
    }
};
// pub const LogicOperators = enum {
// @"and",
// @"or",
// not,
// nand,
// nor,
// xor,
// };

// pub const CompareOperators = enum {
// gt,
// gte,
// eq,
// neq,
// lte,
// lt,
// };

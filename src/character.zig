const enums = @import("enums.zig");
const modifier = @import("modifier.zig");
pub const AbilityScore = struct {
    score: u8,
    mod: i8,
};
const items = @import("items.zig");
const Item = items.Item;

pub const AbilityScores = struct {
    strength: AbilityScore,
    dexterity: AbilityScore,
    constitution: AbilityScore,
    intelligence: AbilityScore,
    wisdom: AbilityScore,
    charisma: AbilityScore,
    const Self = @This();

    pub fn compInit(
        comptime str: u8,
        comptime dex: u8,
        comptime con: u8,
        comptime int: u8,
        comptime wis: u8,
        comptime cha: u8,
    ) Self {
        return .{
            .strength = .{ .score = str, .mod = enums.convertScoreToMod(str) },
            .dexterity = .{ .score = dex, .mod = enums.convertScoreToMod(dex) },
            .constitution = .{ .score = con, .mod = enums.convertScoreToMod(con) },
            .intelligence = .{ .score = int, .mod = enums.convertScoreToMod(int) },
            .wisdom = .{ .score = wis, .mod = enums.convertScoreToMod(wis) },
            .charisma = .{ .score = cha, .mod = enums.convertScoreToMod(cha) },
        };
    }

    pub fn editAbilityScore(self: *Self, ability: union(enum) { str: u8, dex: u8, con: u8, int: u8, wis: u8, cha: u8 }) void {
        switch (ability) {
            .str => {
                self.strength.score = ability.str;
                self.strength.mod = enums.convertScoreToMod(ability.str);
            },
            .dex => {
                self.dexterity.score = ability.dex;
                self.dexterity.mod = enums.convertScoreToMod(ability.dex);
            },
            .con => {
                self.constitution.score = ability.con;
                self.constitution.mod = enums.convertScoreToMod(ability.con);
            },
            .int => {
                self.intelligence.score = ability.int;
                self.intelligence.mod = enums.convertScoreToMod(ability.int);
            },
            .wis => {
                self.wisdom.score = ability.wis;
                self.wisdom.mod = enums.convertScoreToMod(ability.wis);
            },
            .cha => {
                self.charisma.score = ability.cha;
                self.charisma.mod = enums.convertScoreToMod(ability.cha);
            },
        }
    }
};

pub const Attack = struct {
    name: []const u8,
    attack_type

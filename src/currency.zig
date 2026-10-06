const errors = @import("errors.zig");
const StdErr = errors.StdErr;

pub const Currency = enum(i64) {
    copper = 1,
    silver = 10,
    electrum = 50,
    gold = 100,
    platinum = 1000,

    pub fn convertToCopper(self: Currency) i64 {
        return @intFromEnum(self);
    }
};

pub const CurrencyValue = struct {
    currency: Currency,
    count: i64,
    const Self = @This();

    pub fn convertToCopper(self: *const Self) i64 {
        return Currency.convertToCopper(self.currency) *% self.count;
    }

    pub fn addSameCurrency(self: *const Self, a: CurrencyValue) StdErr!Self {
        if (self.currency != a.currency) {
            return StdErr.InvalidParameter;
        }
        return .{ .currency = self.currency, .count = self.count +% a.count };
    }

    pub fn convert(self: *const Self, currency: Currency) struct { amount: Self, remainder: Self } {
        var return_val: struct { amount: Self, remainder: Self } = .{
            .amount = .{ .currency = currency, .count = 0 },
            .remainder = .{ .currency = self.currency, .count = 0 },
        };
        if (Currency.convertToCopper(self.currency) >= Currency.convertToCopper(currency)) {
            const product: i64 = self.count *% (@divTrunc(Currency.convertToCopper(self.currency), Currency.convertToCopper(currency)));
            return_val.amount.count = product;
        } else {
            const quotient: i64 = @divTrunc(Currency.convertToCopper(currency), Currency.convertToCopper(self.currency));
            const amount: i64 = @divTrunc(self.count, quotient);
            const remainder: i64 = self.count -% amount *% quotient;
            return_val.amount.count = amount;
            return_val.remainder.count = remainder;
        }

        return return_val;
    }
};

pub const CurrencyTable = struct {
    platinum: CurrencyValue,
    gold: CurrencyValue,
    electrum: CurrencyValue,
    silver: CurrencyValue,
    copper: CurrencyValue,
    const Self = @This();

    pub fn convert(self: *const Self) CurrencyValue {
        var sum: i64 = 0;
        sum +%= self.platinum.convertToCopper();
        sum +%= self.gold.convertToCopper();
        sum +%= self.electrum.convertToCopper();
        sum +%= self.silver.convertToCopper();
        sum +%= self.copper.convertToCopper();
        return .{ .currency = Currency.copper, .count = sum };
    }

    pub fn addToTable(self: *const Self, a: CurrencyValue) Self {
        var dup: Self = self.clone();
        switch (a.currency) {
            .platinum => {
                dup.platinum.count +%= a.count;
            },
            .gold => {
                dup.gold.count +%= a.count;
            },
            .electrum => {
                dup.electrum.count +%= a.count;
            },
            .silver => {
                dup.silver.count +%= a.count;
            },
            .copper => {
                dup.copper.count +%= a.count;
            },
        }
        return dup;
    }

    pub fn subtractFromTable(self: *const Self, a: CurrencyValue) Self {
        var dup: Self = self.clone();
        switch (a.currency) {
            .platinum => {
                dup.platinum.count -%= a.count;
            },
            .gold => {
                dup.gold.count -%= a.count;
            },
            .electrum => {
                dup.electrum.count -%= a.count;
            },
            .silver => {
                dup.silver.count -%= a.count;
            },
            .copper => {
                dup.copper.count -%= a.count;
            },
        }
        return dup;
    }

    pub fn clone(self: *const Self) Self {
        return .{
            .platinum = self.platinum,
            .gold = self.gold,
            .electrum = self.electrum,
            .silver = self.silver,
            .copper = self.copper,
        };
    }

    pub fn consolidate(self: *Self) void {
        self.* = copperToTable(self.convert().count);
    }
};

pub fn copperToTable(amount: i64) CurrencyTable {
    var sum = amount;
    const platinum = @divTrunc(sum, @intFromEnum(Currency.platinum));
    sum -%= platinum *% @intFromEnum(Currency.platinum);
    const gold = @divTrunc(sum, @intFromEnum(Currency.gold));
    sum -%= gold *% @intFromEnum(Currency.gold);
    const electrum = @divTrunc(sum, @intFromEnum(Currency.electrum));
    sum -%= electrum *% @intFromEnum(Currency.electrum);
    const silver = @divTrunc(sum, @intFromEnum(Currency.silver));
    sum -%= silver *% @intFromEnum(Currency.silver);
    const copper = sum;
    return .{
        .platinum = .{ .currency = .platinum, .count = platinum },
        .gold = .{ .currency = .gold, .count = gold },
        .electrum = .{ .currency = .electrum, .count = electrum },
        .silver = .{ .currency = .silver, .count = silver },
        .copper = .{ .currency = .copper, .count = copper },
    };
}

pub fn addCurrency(a: CurrencyValue, b: CurrencyValue) CurrencyTable {
    const sum: i64 = a.convertToCopper() +% b.convertToCopper();
    return copperToTable(sum);
}

pub fn subtractCurrency(a: CurrencyValue, b: CurrencyValue) CurrencyTable {
    const sum: i64 = a.convertToCopper() -% b.convertToCopper();
    return copperToTable(sum);
}

pub fn multiplyCurrency(a: CurrencyValue, b: i64) CurrencyTable {
    const product = a.convertToCopper() *% b;
    return copperToTable(product);
}

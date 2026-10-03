pub const Currency = enum(i64) {
    copper = 1,
    silver = 10,
    electrum = 50,
    gold = 100,
    platinum = 1000,
};

pub const CurrencyAmount = struct {
    currency: Currency,
    amount: i64,
};

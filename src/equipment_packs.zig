const shop = @import("shop.zig");
const EquipmentPack = shop.EquipmentPack;
const gear = @import("adventuring_gear.zig");
const tools = @import("tools.zig");

// Equipment packs use the underlying item ShopEntry when one exists.
// Thus one ball_bearing entry means one shop bundle (1,000 bearings),
// while ordinary single-item entries use their listed count directly.

pub const burglars_pack: EquipmentPack = EquipmentPack.compInit(
    "Burglar's Pack",
    .phb14,
    .{ .currency = .gold, .count = 16 },
    &.{
        .{ .count = 1, .item = gear.backpack.hash },
        .{ .count = 1, .item = gear.ball_bearing.hash },
        .{ .count = 1, .item = gear.string_10_ft.hash },
        .{ .count = 1, .item = gear.bell.hash },
        .{ .count = 5, .item = gear.candle.hash },
        .{ .count = 1, .item = gear.crowbar.hash },
        .{ .count = 1, .item = gear.hammer.hash },
        .{ .count = 10, .item = gear.piton.hash },
        .{ .count = 1, .item = gear.hooded_lantern.hash },
        .{ .count = 2, .item = gear.oil.hash },
        .{ .count = 5, .item = gear.ration.hash },
        .{ .count = 1, .item = gear.tinderbox.hash },
        .{ .count = 1, .item = gear.waterskin.hash },
        .{ .count = 1, .item = gear.hempen_rope_50_ft.hash },
    },
);

pub const diplomats_pack: EquipmentPack = EquipmentPack.compInit(
    "Diplomat's Pack",
    .phb14,
    .{ .currency = .gold, .count = 39 },
    &.{
        .{ .count = 1, .item = gear.chest.hash },
        .{ .count = 2, .item = gear.map_scroll_case.hash },
        .{ .count = 1, .item = gear.fine_clothes.hash },
        .{ .count = 1, .item = gear.ink.hash },
        .{ .count = 1, .item = gear.ink_pen.hash },
        .{ .count = 1, .item = gear.lamp.hash },
        .{ .count = 2, .item = gear.oil.hash },
        .{ .count = 5, .item = gear.paper.hash },
        .{ .count = 1, .item = gear.perfume.hash },
        .{ .count = 1, .item = gear.sealing_wax.hash },
        .{ .count = 1, .item = gear.soap.hash },
    },
);

pub const dungeoneers_pack: EquipmentPack = EquipmentPack.compInit(
    "Dungeoneer's Pack",
    .phb14,
    .{ .currency = .gold, .count = 12 },
    &.{
        .{ .count = 1, .item = gear.backpack.hash },
        .{ .count = 1, .item = gear.crowbar.hash },
        .{ .count = 1, .item = gear.hammer.hash },
        .{ .count = 10, .item = gear.piton.hash },
        .{ .count = 10, .item = gear.torch.hash },
        .{ .count = 1, .item = gear.tinderbox.hash },
        .{ .count = 10, .item = gear.ration.hash },
        .{ .count = 1, .item = gear.waterskin.hash },
        .{ .count = 1, .item = gear.hempen_rope_50_ft.hash },
    },
);

pub const entertainers_pack: EquipmentPack = EquipmentPack.compInit(
    "Entertainer's Pack",
    .phb14,
    .{ .currency = .gold, .count = 40 },
    &.{
        .{ .count = 1, .item = gear.backpack.hash },
        .{ .count = 1, .item = gear.bedroll.hash },
        .{ .count = 2, .item = gear.costume.hash },
        .{ .count = 5, .item = gear.candle.hash },
        .{ .count = 5, .item = gear.ration.hash },
        .{ .count = 1, .item = gear.waterskin.hash },
        .{ .count = 1, .item = tools.disguise_kit.hash },
    },
);

pub const explorers_pack: EquipmentPack = EquipmentPack.compInit(
    "Explorer's Pack",
    .phb14,
    .{ .currency = .gold, .count = 10 },
    &.{
        .{ .count = 1, .item = gear.backpack.hash },
        .{ .count = 1, .item = gear.bedroll.hash },
        .{ .count = 1, .item = gear.mess_kit.hash },
        .{ .count = 1, .item = gear.tinderbox.hash },
        .{ .count = 10, .item = gear.torch.hash },
        .{ .count = 10, .item = gear.ration.hash },
        .{ .count = 1, .item = gear.waterskin.hash },
        .{ .count = 1, .item = gear.hempen_rope_50_ft.hash },
    },
);

pub const priests_pack: EquipmentPack = EquipmentPack.compInit(
    "Priest's Pack",
    .phb14,
    .{ .currency = .gold, .count = 19 },
    &.{
        .{ .count = 1, .item = gear.backpack.hash },
        .{ .count = 1, .item = gear.blanket.hash },
        .{ .count = 10, .item = gear.candle.hash },
        .{ .count = 1, .item = gear.tinderbox.hash },
        .{ .count = 1, .item = gear.alms_box.hash },
        .{ .count = 2, .item = gear.incense_block.hash },
        .{ .count = 1, .item = gear.censer.hash },
        .{ .count = 1, .item = gear.vestments.hash },
        .{ .count = 2, .item = gear.ration.hash },
        .{ .count = 1, .item = gear.waterskin.hash },
    },
);

pub const scholars_pack: EquipmentPack = EquipmentPack.compInit(
    "Scholar's Pack",
    .phb14,
    .{ .currency = .gold, .count = 40 },
    &.{
        .{ .count = 1, .item = gear.backpack.hash },
        .{ .count = 1, .item = gear.book.hash },
        .{ .count = 1, .item = gear.ink.hash },
        .{ .count = 1, .item = gear.ink_pen.hash },
        .{ .count = 10, .item = gear.parchment.hash },
        .{ .count = 1, .item = gear.small_bag_of_sand.hash },
        .{ .count = 1, .item = gear.small_knife.hash },
    },
);

pub const equipment_pack_arr = [_]EquipmentPack{
    burglars_pack,
    diplomats_pack,
    dungeoneers_pack,
    entertainers_pack,
    explorers_pack,
    priests_pack,
    scholars_pack,
};

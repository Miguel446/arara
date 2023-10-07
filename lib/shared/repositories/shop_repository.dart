import '../extensions.dart';
import '../mocks/mock_shops.dart';
import '../models/shop.dart';

export '../models/shop.dart';

class ShopRepository {
  Future<List<Shop>> getShops({String? name, ShopType? type}) async {
    await Future.delayed(const Duration(milliseconds: 300));

    List<Shop> shops = [...mockPhysicalShops, ...mockVirtualShops];

    if (name != null) {
      shops = shops
          .where((shop) => shop.name
              .toLowerCaseWithNoDiacritics()
              .contains(name.toLowerCaseWithNoDiacritics()))
          .toList();
    }

    if (type != null) {
      shops = shops.where((shop) => shop.type == type).toList();
    }

    return shops;
  }

  Future<Shop> getShopById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final shop = [...mockPhysicalShops, ...mockVirtualShops]
        .firstWhere((shop) => shop.id == id);

    return shop;
  }
}

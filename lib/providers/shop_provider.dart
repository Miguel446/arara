import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../repositories/shop_repository.dart';

final shopProvider =
    FutureProvider.autoDispose.family<Shop, String>((ref, shopId) {
  return GetIt.I<ShopRepository>().getShopById(shopId);
});

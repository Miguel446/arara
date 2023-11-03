import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/shop_repository.dart';

final shopProvider =
    FutureProvider.autoDispose.family<Shop, String>((ref, shopId) {
  return ref.watch(shopRepositoryProvider).getShopById(shopId);
});

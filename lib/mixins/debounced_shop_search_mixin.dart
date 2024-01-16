import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/shop_repository.dart';
import '../utils/debouncer.dart';

mixin DebouncedShopSearchMixin<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  List<Shop> shops = [];
  bool isLoading = false;

  late final debouncedGetShops = Debouncer(
    milliseconds: 500,
    action: () => getShops(name: shopName, type: shopType),
  );

  String? get shopName;
  ShopType? get shopType;

  Future<void> getShops({String? name, ShopType? type}) async {
    setState(() => isLoading = true);

    try {
      shops = await ref.read(shopRepositoryProvider).getShops(
            type: type,
            name: name,
          );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    getShops(name: shopName, type: shopType);
  }
}

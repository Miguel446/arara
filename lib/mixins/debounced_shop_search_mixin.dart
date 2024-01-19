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

  /// The name which will be used to filter the shops. Override this getter
  /// to change the default value.
  String? get shopName => null;

  /// The type which will be used to filter the shops. Override this getter
  /// to change the default value.
  ShopType? get shopType => null;

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

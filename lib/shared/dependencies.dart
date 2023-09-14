import 'package:get_it/get_it.dart';

import 'repositories/shop_repository.dart';

void registerDependencies() {
  GetIt.I.registerSingleton(ShopRepository());
}

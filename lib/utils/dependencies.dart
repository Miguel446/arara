import 'package:get_it/get_it.dart';

import '../repositories/auth_repository.dart';
import '../repositories/shop_repository.dart';

void registerDependencies() {
  GetIt.I.registerSingleton(AuthRepository());
  GetIt.I.registerSingleton(ShopRepository());
}

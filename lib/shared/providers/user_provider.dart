import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<User?> {
  UserNotifier()
      : super(
          isUserSet ? User.fromJson(GetStorage().read(userKey)) : null,
        );

  static const userKey = 'user';
  static bool get isUserSet => GetStorage().hasData(userKey);

  set user(User? user) {
    state = user;
  }

  void storeUser() {
    GetStorage().write(userKey, state?.toJson());
  }

  void unsetUser() {
    state = null;

    GetStorage().remove(userKey);
  }
}

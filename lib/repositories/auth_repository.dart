import '../mocks/mock_users.dart';
import '../models/user.dart';

class AuthRepository {
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    return mockUsers[0];
  }
}

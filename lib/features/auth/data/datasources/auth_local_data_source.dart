import 'package:nabd/core/services/local_storage_service.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';

class UserLocalStorage extends LocalStorageService<UserModel> {
  UserLocalStorage() : super('userBox');

  Future<void> saveUser(UserModel user) async {
    await save('currentUser', user);
  }

  UserModel? getUser() {
    return get('currentUser');
  }

  Future<void> clearUser() async {
    await delete('currentUser');
  }
}

import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/data/services/UserService.dart';

class Userrepository {
  final _userService = UserService();

  Future<String> login(String username, String password) async {
    return await _userService.login(username, password);
  }

  Future<bool> register(Usermodel user) async {
    return await _userService.register(user);
  }
}

import 'package:fastfoodapp/data/models/ResponeLoginModel.dart';
import 'package:fastfoodapp/data/models/ShopModel.dart';
import 'package:fastfoodapp/data/models/User.dart';
import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/data/services/UserService.dart';

class Userrepository {
  final UserService _userService;

  Userrepository(this._userService);

  Future<Responeloginmodel?> login(String username, String password) async {
    var response = await _userService.login(username, password);
    if (response['userId'] == null ||
        response['userId'] == 0 ||
        response['token'].toString().isEmpty) return null;
    return Responeloginmodel(
        userId: response['userId'], token: response['token']);
  }

  Future<User?> getUser() async {
    var response = await _userService.getUser();
    User? user = User.fromJson(
        response as Map<String, dynamic>); // chuyển từ json sang đối tượng

    return user;
  }

  Future<int?> getShopByUserId() async {
    final response = await _userService.getShopByUserId();
    if (response['success'] == true) {
      Shopmodel shop = Shopmodel.fromJSON(response['data']);
      return shop.shopId;
    } else {
      return null;
    }
  }

  Future<String> getNameUserByUserId(int userId) async {
    final response = await _userService.getNameUserByUserId(userId);
    User? user = User.fromJson(response); // chuyển từ json sang đối tượng

    return user.fullName; //???
  }

  Future<String> register(Usermodel user) async {
    final response = await _userService.register(user);
    if (response['success'] == false) {
      return response['message'];
    }
    return "ok";
  }

  Future<String> updateInfoUser(
      String name, String phone, String email, int userId) async {
    final response =
        await _userService.updateInfoUser(name, email, phone, userId);
    if (response['success'] == true) {
      return response['message'];
    }
    return response['message'];
  }

  Future<String> changePassword(
      String oldPassword, String newPassword, int userId) async {
    final response =
        await _userService.changePassword(oldPassword, newPassword, userId);
    if (response['success'] == true) {
      return response['message'];
    }
    return response['message'];
  }

  Future<String> getPhoneUserByUserId(int userId) async {
    final response = await _userService.getNameUserByUserId(userId);
    User? user = User.fromJson(response); // chuyển từ json sang đối tượng

    return user.phone;
  }
}

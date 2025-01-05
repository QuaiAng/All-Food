import 'package:fastfoodapp/data/models/ResponeLoginModel.dart';
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
    // if(response != null){
    //   if (response['fullName'] == ) {

    //   } // kiểm tra
    // }
  
    User user = User.fromJson(
        response as Map<String, dynamic>); // chuyển từ json sang đối tượng

    return user;
  }

  Future<bool> register(Usermodel user) async {
    return await _userService.register(user);
  }
}

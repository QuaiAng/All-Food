import 'package:fastfoodapp/presentation/pages/cartscreen.dart';
import 'package:fastfoodapp/presentation/pages/detailistproduct.dart';
import 'package:fastfoodapp/presentation/pages/detailvoucherscreen.dart';
import 'package:fastfoodapp/presentation/pages/editinfoscreen.dart';
import 'package:fastfoodapp/presentation/pages/loginscreen.dart';
import 'package:fastfoodapp/presentation/pages/mainscreen.dart';
import 'package:fastfoodapp/presentation/pages/paymentscreen.dart';
import 'package:fastfoodapp/presentation/pages/registerscreen.dart';
import 'package:fastfoodapp/presentation/pages/searchscreen.dart';
import 'package:fastfoodapp/presentation/pages/detailsearchscreen.dart';
import 'package:fastfoodapp/presentation/pages/splashscreen.dart';
import 'package:fastfoodapp/presentation/pages/verifyotpscreen.dart';
import 'package:fastfoodapp/presentation/pages/voucherscreen.dart';
import 'package:fastfoodapp/presentation/widgets/itemincart.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String homeScreen = "/home";
  static const String cartScreen = "/cart";
  static const String detailScreen = "/detail";
  static const String verifyotpScreen = "/verifyotp";
  static const String detaiListProductScreen = "/detaillistproduct";
  static const String paymentScreen = "/payment";
  static const String voucherScreen = "/vouchers";
  static const String mainScreen = "/main";
  static const String detailsearchScreen = "/detailsearch";
  static const String splashScreen = "";
  static const String searchScreen = "/search";
  static const String detailvoucherScreen = "/detailvoucher";
  static const String editinfoScreen = "/editinfo";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //  case '/login':
      //   // Expecting an argument for login screen
      //   final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
      //   return MaterialPageRoute(
      //     builder: (_) => Loginscreen(
      //       username: args?['username'] ?? '',
      //     ),
      //   );

      //Màn hình chờ
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      //Màn hình chính dùng để điều hướng đến các màn hình khác
      case RouteName.mainScreen:
        return MaterialPageRoute(builder: (_) => const Mainscreen());
      //Màn hình xem chi tiết danh sách sản phẩm
      case RouteName.detaiListProductScreen:
        return MaterialPageRoute(builder: (_) => const Detailistproduct());
      //Màn hình thanh toán
      case RouteName.paymentScreen:
        return MaterialPageRoute(builder: (_) => const Paymentscreen());
      //Màn hình đăng nhập
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      //Màn hình đăng ký
      case RouteName.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const Registerscreen(),
        );
      //Màn hình xác thực mã OTP
      case RouteName.verifyotpScreen:
        return MaterialPageRoute(
          builder: (_) => const Verifyotpscreen(),
        );
      //Màn hình danh sách vouchers
      case RouteName.voucherScreen:
        return MaterialPageRoute(builder: (_) => const Voucherscreen());
      //Màn hình chi tiết voucher
      case RouteName.detailvoucherScreen:
        return MaterialPageRoute(builder: (_) => VoucherDetailScreen());
      //Màn hình ...
      case RouteName.searchScreen:
        return MaterialPageRoute(builder: (_) => const Searchscreen());
      //Màn hình tìm kiếm món ăn
      case RouteName.detailsearchScreen:
        return MaterialPageRoute(builder: (_) => const Detailsearchscreen());
      case RouteName.cartScreen:
        return MaterialPageRoute(builder: (_) => const Cartscreen());
      case RouteName.editinfoScreen:
        return MaterialPageRoute(builder: (_) => const Editinfoscreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }
  }
}

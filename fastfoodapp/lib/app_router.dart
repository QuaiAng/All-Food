import 'package:fastfoodapp/presentation/pages/detailistproduct.dart';
import 'package:fastfoodapp/presentation/pages/loginscreen.dart';
import 'package:fastfoodapp/presentation/pages/paymentscreen.dart';
import 'package:fastfoodapp/presentation/pages/registerscreen.dart';
import 'package:fastfoodapp/presentation/pages/detailsearchscreen.dart';
import 'package:fastfoodapp/presentation/pages/splashscreen.dart';
import 'package:fastfoodapp/presentation/pages/verifyotpscreen.dart';
import 'package:fastfoodapp/presentation/pages/voucherscreen.dart';
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
  static const String voucherScreen = "/voucher";
  static const String detailsearchScreen = "/search";
  static const String splashScreen = "";
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
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      case RouteName.detaiListProductScreen:
        return MaterialPageRoute(builder: (_) => const Detailistproduct());
      case RouteName.paymentScreen:
        return MaterialPageRoute(builder: (_) => const Paymentscreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const Loginscreen());
      case RouteName.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const Registerscreen(),
        );
      case RouteName.verifyotpScreen:
        return MaterialPageRoute(
          builder: (_) => const Verifyotpscreen(),
        );
      case RouteName.voucherScreen:
        return MaterialPageRoute(builder: (_) => const Voucherscreen());
      case RouteName.detailsearchScreen:
        return MaterialPageRoute(builder: (_) => const Detailsearchscreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Not Found')),
          ),
        );
    }
  }
}

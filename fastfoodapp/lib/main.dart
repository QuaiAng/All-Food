import 'dart:io';

import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';
import 'package:fastfoodapp/data/repositories/ProductRepository.dart';
import 'package:fastfoodapp/data/repositories/ShopRepository.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:fastfoodapp/data/services/AddressService.dart';
import 'package:fastfoodapp/data/services/ProductService.dart';
import 'package:fastfoodapp/data/services/ShopService.dart';
import 'package:fastfoodapp/data/services/UserService.dart';
import 'package:fastfoodapp/presentation/pages/detailproductscreen.dart';
import 'package:fastfoodapp/presentation/pages/detailsearchscreen.dart';
import 'package:fastfoodapp/presentation/states/addressviewmodel.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/changepasswordviewmodel.dart';
import 'package:fastfoodapp/presentation/states/detailproductscreenviewmodel.dart';
import 'package:fastfoodapp/presentation/states/detailsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/editinfoviewmodel.dart';
import 'package:fastfoodapp/presentation/states/forgotpasswordviewmodel.dart';
import 'package:fastfoodapp/presentation/states/loginviewmodel.dart';
import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/presentation/states/paymentviewmodel.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/states/registerviewmodel.dart';
import 'package:fastfoodapp/presentation/states/resultsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/settingviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';
import 'package:fastfoodapp/presentation/states/verifyotpviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(
    providers: [
      // Cung cấp UserService
      Provider(create: (_) => UserService()),
      Provider(create: (_) => Addressservice()),
      Provider(create: (_) => Productservice()),
      Provider(create: (_) => Shopservice()),

      // Cung cấp UserRepository (phụ thuộc vào UserService)
      ProxyProvider<UserService, Userrepository>(
        update: (context, userService, _) => Userrepository(userService),
      ),

      ProxyProvider<Addressservice, Addressrepository>(
          update: (context, addressService, _) =>
              Addressrepository(addressService)),
      ProxyProvider<Productservice, Productrepository>(
          update: (context, productService, _) =>
              Productrepository(productService)),
      ProxyProvider<Shopservice, Shoprepository>(
          update: (context, shopService, _) => Shoprepository(shopService)),

      ChangeNotifierProvider(create: (_) => AppProvier()),
      ChangeNotifierProvider(create: (_) => Cartviewmodel()),
      ChangeNotifierProvider(create: (_) => Changepasswordviewmodel()),
      ChangeNotifierProvider(create: (_) => Detailsearchviewmodel()),
      ChangeNotifierProvider(
          create: (context) =>
              Editinfoviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(create: (_) => Forgotpasswordviewmodel()),
      ChangeNotifierProvider(
          create: (context) => Loginviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(create: (_) => OrderStatusViewModel()),
      ChangeNotifierProvider(
          create: (context) =>
              Registerviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(create: (_) => Verifyotpviewmodel()),
      ChangeNotifierProvider(
          create: (context) =>
              Settingviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(
          create: (context) =>
              Addressviewmodel(context.read<Addressrepository>())),
      ChangeNotifierProvider(
          create: (context) => Shopviewmodel(context.read<Shoprepository>())),
      ChangeNotifierProvider(
          create: (context) =>
              Resultsearchviewmodel(context.read<Productrepository>())),
      ChangeNotifierProvider(create: (_) => Paymentviewmodel()),
      ChangeNotifierProvider(create: (_) => Detailproductscreenviewmodel())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        initialRoute: RouteName.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        // home: Detailproductscreen(
        //   imageShop: "assets/images/anhchandung.jpg",
        //   ratingShop: 4.3,
        //   nameShop: "Quán Bà Tám Quận 8",
        //   image: "assets/images/anhdai.jpeg",
        //   nameFood: "Bánh Kẹp Kem",
        //   categoryFoodName: "Bánh ngọt",
        //   comment:
        //       "Shortbread, chocolate turtle cookies, and red velret. 8 ounces cream cheese, softened",
        //   rating: 4.3,
        //   quantity: 273,
        // ),
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

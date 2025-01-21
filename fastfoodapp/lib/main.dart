import 'dart:io';

import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';

import 'package:fastfoodapp/data/repositories/CartRepository.dart';

import 'package:fastfoodapp/data/repositories/CategoryRepository.dart';
import 'package:fastfoodapp/data/repositories/OrderRepository.dart';

import 'package:fastfoodapp/data/repositories/ProductRepository.dart';
import 'package:fastfoodapp/data/repositories/ReviewRepository.dart';
import 'package:fastfoodapp/data/repositories/ShopRepository.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:fastfoodapp/data/repositories/VoucherRepository.dart';
import 'package:fastfoodapp/data/services/AddressService.dart';

import 'package:fastfoodapp/data/services/CartService.dart';

import 'package:fastfoodapp/data/services/CategoryService.dart';
import 'package:fastfoodapp/data/services/OrderService.dart';

import 'package:fastfoodapp/data/services/ProductService.dart';
import 'package:fastfoodapp/data/services/ReviewService.dart';
import 'package:fastfoodapp/data/services/ShopService.dart';
import 'package:fastfoodapp/data/services/UserService.dart';

import 'package:fastfoodapp/data/services/VoucherService.dart';

import 'package:fastfoodapp/presentation/states/addressviewmodel.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/categoryviewmodel.dart';
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
import 'package:fastfoodapp/presentation/states/reviewviewmodel.dart';
import 'package:fastfoodapp/presentation/states/settingviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';
import 'package:fastfoodapp/presentation/states/verifyotpviewmodel.dart';
import 'package:fastfoodapp/presentation/states/filterrevenueviewmodel.dart';
import 'package:fastfoodapp/presentation/states/voucherviewmodel.dart';
import 'package:fastfoodapp/presentation/pages/detailordershopscreen.dart';
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
      Provider(create: (_) => Voucherservice()),
      Provider(create: (_) => Shopservice()),
      Provider(create: (_) => Orderservice()),

      Provider(create: (_) => Cartservice()),

      Provider(create: (_) => Categoryservice()),
      Provider(create: (_) => Reviewservice()),

      // Cung cấp UserRepository (phụ thuộc vào UserService)
      ProxyProvider<UserService, Userrepository>(
        update: (context, userService, _) => Userrepository(userService),
      ),
      ProxyProvider<Cartservice, CartRepository>(
        update: (context, cartService, _) => CartRepository(cartService),
      ),
      ProxyProvider<Orderservice, Orderrepository>(
          update: (context, orderService, _) => Orderrepository(orderService)),

      ProxyProvider<Addressservice, Addressrepository>(
          update: (context, addressService, _) =>
              Addressrepository(addressService)),
      ProxyProvider<Productservice, Productrepository>(
          update: (context, productService, _) =>
              Productrepository(productService)),
      ProxyProvider<Voucherservice, Voucherrepository>(
          update: (context, voucherService, _) =>
              Voucherrepository(voucherService)),

      ProxyProvider<Shopservice, Shoprepository>(
          update: (context, shopService, _) => Shoprepository(shopService)),
      ProxyProvider<Categoryservice, Categoryrepository>(
          update: (context, categoryService, _) =>
              Categoryrepository(categoryService)),

      ProxyProvider<Reviewservice, Reviewrepository>(
          update: (context, reviewService, _) =>
              Reviewrepository(reviewService)),

      ProxyProvider<Addressservice, Addressrepository>(
          update: (context, addressService, _) =>
              Addressrepository(addressService)),
      ProxyProvider<Productservice, Productrepository>(
          update: (context, productService, _) =>
              Productrepository(productService)),

      ChangeNotifierProvider(create: (_) => AppProvier()),
      ChangeNotifierProvider(
          create: (context) => Cartviewmodel(context.read<CartRepository>())),
      ChangeNotifierProvider(
          create: (context) =>
              Changepasswordviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(create: (_) => Detailsearchviewmodel()),
      ChangeNotifierProvider(
          create: (context) =>
              Editinfoviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(create: (_) => Forgotpasswordviewmodel()),
      ChangeNotifierProvider(
          create: (context) => Loginviewmodel(context.read<Userrepository>())),
      ChangeNotifierProvider(
          create: (context) =>
              OrderStatusViewModel(context.read<Orderrepository>())),
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
      ChangeNotifierProvider(
          create: (context) =>
              Paymentviewmodel(context.read<Userrepository>())),

      ChangeNotifierProvider(create: (_) => Filterrevenueviewmodel()),
      ChangeNotifierProvider(
          create: (context) =>
              Voucherviewmodel(context.read<Voucherrepository>())),

      ChangeNotifierProvider(create: (_) => Detailproductscreenviewmodel()),

      // ChangeNotifierProvider(create: (_) => Addvoucherviewmodel())

      ChangeNotifierProvider(
          create: (context) =>
              Categoryviewmodel(context.read<Categoryrepository>())),

      ChangeNotifierProvider(
          create: (context) =>
              Reviewviewmodel(context.read<Reviewrepository>())),
    ],
    child: const MainApp(),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        initialRoute: RouteName.mainScreen,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        // home: Detailordershop(),
      );
    });
  }
}

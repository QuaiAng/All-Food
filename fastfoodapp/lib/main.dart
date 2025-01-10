import 'dart:io';

import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/repositories/AddressRepository.dart';
import 'package:fastfoodapp/data/repositories/ProductRepository.dart';
import 'package:fastfoodapp/data/repositories/UserRepository.dart';
import 'package:fastfoodapp/data/repositories/VoucherRepository.dart';
import 'package:fastfoodapp/data/services/AddressService.dart';
import 'package:fastfoodapp/data/services/ProductService.dart';
import 'package:fastfoodapp/data/services/UserService.dart';
import 'package:fastfoodapp/data/services/VoucherService.dart';
import 'package:fastfoodapp/presentation/states/addressviewmodel.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/changepasswordviewmodel.dart';
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
import 'package:fastfoodapp/presentation/states/verifyotpviewmodel.dart';
import 'package:fastfoodapp/presentation/states/filterrevenueviewmodel.dart';
import 'package:fastfoodapp/presentation/states/voucherviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(
    providers: [
      // Cung cấp UserService
      Provider(create: (_) => UserService()),
      Provider(create: (_) => Addressservice()),
      Provider(create: (_) => Productservice()),
      Provider(create: (_) => Voucherservice()),

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
      ProxyProvider<Voucherservice, Voucherrepository>(
          update: (context, voucherService, _) =>
              Voucherrepository(voucherService)),

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
          create: (context) =>
              Resultsearchviewmodel(context.read<Productrepository>())),
      ChangeNotifierProvider(create: (_) => Paymentviewmodel()),
      ChangeNotifierProvider(create: (_) => Filterrevenueviewmodel()),
      ChangeNotifierProvider(
          create: (context) =>
              Voucherviewmodel(context.read<Voucherrepository>()))
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        initialRoute: RouteName.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

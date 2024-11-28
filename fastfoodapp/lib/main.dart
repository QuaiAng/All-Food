import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/pages/forgotpassword.dart';
import 'package:fastfoodapp/presentation/states/addressviewmodel.dart';
import 'package:fastfoodapp/presentation/states/cartviewmodel.dart';
import 'package:fastfoodapp/presentation/states/changepasswordviewmodel.dart';
import 'package:fastfoodapp/presentation/states/detailsearchviewmodel.dart';
import 'package:fastfoodapp/presentation/states/editinfoviewmodel.dart';
import 'package:fastfoodapp/presentation/states/forgotpasswordviewmodel.dart';
import 'package:fastfoodapp/presentation/states/loginviewmodel.dart';
import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/states/registerviewmodel.dart';
import 'package:fastfoodapp/presentation/states/settingviewmodel.dart';
import 'package:fastfoodapp/presentation/states/verifyotpviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvier()),
        ChangeNotifierProvider(create: (_) => Cartviewmodel()),
        ChangeNotifierProvider(create: (_) => Changepasswordviewmodel()),
        ChangeNotifierProvider(create: (_) => Detailsearchviewmodel()),
        ChangeNotifierProvider(create: (_) => Editinfoviewmodel()),
        ChangeNotifierProvider(create: (_) => Forgotpasswordviewmodel()),
        ChangeNotifierProvider(create: (_) => Loginviewmodel()),
        ChangeNotifierProvider(create: (_) => OrderStatusViewModel()),
        ChangeNotifierProvider(create: (_) => Registerviewmodel()),
        ChangeNotifierProvider(create: (_) => Verifyotpviewmodel()),
        ChangeNotifierProvider(create: (_) => Verifyotpviewmodel()),
        ChangeNotifierProvider(create: (_) => Settingviewmodel()),
        ChangeNotifierProvider(create: (_) => Addressviewmodel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        initialRoute: RouteName.mainScreen,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

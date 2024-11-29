import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/dataprovider.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvier()),
        ChangeNotifierProvider(create: (_) => Dataprovider()),
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
      return MaterialApp(
        initialRoute: RouteName.ShopManagementScreen,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

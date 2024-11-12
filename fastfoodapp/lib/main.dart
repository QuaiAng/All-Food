import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/pages/settingScreen.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvier(),
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
        home: Settingscreen(),
        // initialRoute: RouteName.sectionFood,
        // onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

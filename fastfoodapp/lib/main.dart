import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fastfoodapp/presentation/widgets/restaurant.dart';

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
          // initialRoute: RouteName.splashScreen,
          // onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          // home: Scaffold(
          //   body: Restaurant(
          //       name_restaurant: "McDonal's",
          //       images: [
          //         "assets/images/big.png",
          //         "assets/images/anhga.png",
          //         "assets/images/anhga.png"
          //       ],
          //       price: "10k-99k",
          //       category_food: "BURGERS",
          //       rating: "4.3",
          //       comment: "200+ Đánh giá",
          //       time: "25 min",
          //       delivery: "Free"),
          ));
    });
  }
}

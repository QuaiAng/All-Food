import 'package:fastfoodapp/presentation/pages/cartscreen.dart';
import 'package:fastfoodapp/presentation/pages/homescreen.dart';
import 'package:fastfoodapp/presentation/pages/loginscreen.dart';
import 'package:fastfoodapp/presentation/pages/searchscreen.dart';
import 'package:fastfoodapp/presentation/pages/settingscreen.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/presentation/widgets/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvier>(context);
    return Scaffold(
      bottomNavigationBar: const Bottomappbar(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: provider.pageController,
        onPageChanged: (index) {
          Provider.of<AppProvier>(context, listen: false)
              .setCurrentIndexPage(index);
        },
        children: const [
          Homescreen(
            address:
                "749 Huynh Tan Phat, Phu Thua, Quan 7, Thanh Pho Ho Chi Minh",
          ),
          Searchscreen(),
          Cartscreen(),
          SettingScreen(
            imagePath: "assets/images/icon.png",
          )
        ],
      ),
    );
  }
}

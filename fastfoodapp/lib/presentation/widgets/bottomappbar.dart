import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Bottomappbar extends StatelessWidget {
  const Bottomappbar({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvier>(context);
    return BottomNavigationBar(
        onTap: (index) {
          Provider.of<AppProvier>(context, listen: false)
              .setCurrentIndexPage(index);
          Provider.of<AppProvier>(context, listen: false).moveToPage(index);
          print("Chuyển sang index ${provider.currentIndexPage}");
        },
        currentIndex: provider.currentIndexPage,
        iconSize: 20.sp,
        selectedItemColor: AppColors.primaryColor,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.gray,
        selectedFontSize: SizeOfWidget.sizeOfH4,
        unselectedFontSize: SizeOfWidget.sizeOfH4,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Trang chủ"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Tìm kiếm"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_sharp,
              ),
              label: "Giỏ hàng"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Cá nhân"),
        ]);
  }
}

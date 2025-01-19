import 'package:fastfoodapp/presentation/widgets/ordercompletedlist.dart';
import 'package:fastfoodapp/presentation/widgets/orderlist.dart';
import 'package:fastfoodapp/presentation/widgets/orderlistcanceled.dart';
import 'package:fastfoodapp/presentation/widgets/orderpreparing.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';

class Ordermanagementscreen extends StatelessWidget {
  final bool role;
  const Ordermanagementscreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Danh sách các tab
    final List<Tab> tabs = [
      const Tab(text: 'Chờ duyệt'),
      const Tab(text: 'Đang chuẩn bị'),
      const Tab(text: 'Đã hoàn thành'),
      const Tab(text: 'Đã hủy'),
    ];

    // Danh sách các Widget tương ứng với từng tab
    final List<Widget> tabViews = [
      OrderList(role: role),
      Orderpreparing(role: role),
      OrderCompletedList(role: role),
      Orderlistcanceled(role: role),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: AppColors.backgroundColor,
          shadowColor: Colors.grey,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.primaryColor,
              size: 20,
            ),
          ),
          title: Text(
            "QUẢN LÝ ĐƠN HÀNG",
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs,
            labelPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 4.0, // Độ dày của line
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        body: TabBarView(
          children: tabViews,
        ),
      ),
    );
  }
}

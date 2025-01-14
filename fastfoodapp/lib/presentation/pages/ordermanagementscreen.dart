import 'package:fastfoodapp/presentation/states/ordermanagementviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/ordercompletedlist.dart';
import 'package:fastfoodapp/presentation/widgets/orderlist.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Ordermanagementscreen extends StatelessWidget {
  const Ordermanagementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Ordermanagementviewmodel>(context);
    return Scaffold(
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
      ),
      body: Column(
        children: [
          // Thanh chọn tab
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => viewModel.toggleTab(true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            'Chờ duyệt',
                            style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH2,
                              fw: FontWeight.w500,
                              clr: viewModel.isPendingTab
                                  ? AppColors.primaryColor
                                  : AppColors.gray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => viewModel.toggleTab(false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Text(
                            'Đã hoàn thành',
                            style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH2,
                              fw: FontWeight.w500,
                              clr: !viewModel.isPendingTab
                                  ? AppColors.primaryColor
                                  : AppColors.gray,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Line chuyển động
              Positioned(
                bottom: 0, // Dòng ở dưới cùng
                left: viewModel.isPendingTab
                    ? 0
                    : MediaQuery.of(context).size.width / 2,
                child: AnimatedContainer(
                  duration:
                      const Duration(milliseconds: 300), // Hiệu ứng chuyển động
                  curve: Curves.easeInOut, // Độ mượt
                  width: MediaQuery.of(context).size.width /
                      2, // Chiều rộng mỗi tab
                  height: 4, // Độ dày của line
                  color: AppColors.primaryColor, // Màu sắc line
                ),
              ),
            ],
          ),
          Expanded(
            // Hiển thị danh sách đơn hàng
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: viewModel.isPendingTab
                  ? OrderList(key: const ValueKey('Pending'), isPending: true)
                  : OrderCompletedList(
                      key: const ValueKey('Completed'), isPending: false),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget danh sách đơn hàng


// Widget danh sách đơn hàng


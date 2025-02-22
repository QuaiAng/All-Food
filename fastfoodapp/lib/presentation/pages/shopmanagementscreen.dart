import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/pages/ordermanagementscreen.dart';
import 'package:fastfoodapp/presentation/states/loginviewmodel.dart';
import 'package:fastfoodapp/presentation/states/shopviewmodel.dart';

import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/strings.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Shopmanagementscreen extends StatelessWidget {
  const Shopmanagementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopId = ModalRoute.of(context)?.settings.arguments as int;
    final shopInfo = Provider.of<Shopviewmodel>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SHOP CỦA TÔI",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH3, fw: FontWeight.w700),
        ),
        backgroundColor: AppColors.backgroundColor,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.sp),
          child: Column(
            children: [
              FutureBuilder(
                future: shopInfo.getShopByShopID(shopId),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return ListTile(
                      leading: snapshot.data!.imageURL.toString().isEmpty
                          ? Container(
                              width: 35.sp, // Đường kính hình tròn
                              height: 35.sp, // Đường kính hình tròn
                              decoration: const BoxDecoration(
                                color: Colors.blue, // Màu xanh
                                shape: BoxShape.circle, // Tạo hình tròn
                              ),
                              child: Center(
                                child: Text(
                                    snapshot.data!.shopName[0], // Chữ hiển thị
                                    style: StylesOfWidgets.textStyle1(
                                        fs: SizeOfWidget.sizeOfH1,
                                        fw: FontWeight.w600,
                                        clr: Colors.white)),
                              ),
                            )
                          : Container(
                              height: 35.sp,
                              width: 35.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${AppStrings.urlAPI}/${snapshot.data!.imageURL}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      title: Text(
                        snapshot.data!.shopName,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3, fw: FontWeight.w600),
                      ),
                      subtitle: Text(
                        snapshot.data!.phone,
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH3,
                            fw: FontWeight.w400,
                            clr: AppColors.lightGray),
                      ),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sửa",
                          style: StylesOfWidgets.textStyle1(
                              fs: SizeOfWidget.sizeOfH3,
                              fw: FontWeight.w400,
                              clr: AppColors.primaryColor),
                        ),
                      ),
                    );
                  } else {
                    return Text("Không tìm thấy dữ liệu");
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: const Divider(),
              ),
              SizedBox(height: 14.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildGridItem(
                      Icons.inbox_outlined,
                      'Đơn hàng chờ duyệt',
                      () {
                        Navigator.pushNamed(
                            context, RouteName.waitingForApprovalScreen);
                      },
                    ),
                    _buildGridItem(
                      Icons.text_snippet_outlined,
                      'Lịch sử đơn hàng',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Ordermanagementscreen(role: false),
                          ),
                        );
                      },
                    ),
                    _buildGridItem(
                      Icons.inventory_2_outlined,
                      'Quản lý sản phẩm',
                      () {},
                    ),
                    _buildGridItem(
                      Icons.menu,
                      'Quản lý danh mục',
                      () {},
                    ),
                    _buildGridItem(
                      Icons.local_offer_outlined,
                      'Quản lý ưu đãi',
                      () {
                        Navigator.pushNamed(context, RouteName.voucherScreen);
                      },
                    ),
                    _buildGridItem(
                      Icons.attach_money_outlined,
                      'Thống kê doanh thu',
                      () {},
                    )
                  ],
                ),
              ),
              SizedBox(height: 14.sp),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Màu của bóng
              blurRadius: 4, // Độ mờ của bóng
              offset: const Offset(0, 2), // Độ dịch chuyển của bóng (x, y)
            ),
          ],
        ),
        padding: EdgeInsets.all(12.sp), // Khoảng cách bên trong Container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon trong vùng tròn trắng
            Container(
              width: 30.sp,
              height: 30.sp,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 25.sp, color: Colors.black, weight: 0.5),
            ),
            const SizedBox(height: 8),
            // Tiêu đề giới hạn diện tích
            SizedBox(
              width: 37.sp,
              child: Text(title,
                  maxLines: 2, // Tối đa 2 dòng
                  overflow: TextOverflow.ellipsis, // Cắt bớt nếu quá dài
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3, fw: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/data/models/User.dart';
import 'package:fastfoodapp/data/models/UserModel.dart';
import 'package:fastfoodapp/presentation/states/settingviewmodel.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatelessWidget {
  final String imagePath;
  const SettingScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final settingViewModel = Provider.of<Settingviewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: ListView(
            padding: EdgeInsets.all(16.sp),
            children: [
              Row(
                children: [
                  Container(
                    height: 35.sp,
                    width: 35.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
<<<<<<< HEAD
                ),
                SizedBox(width: 15.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH1, fw: FontWeight.w500),
                    ),
                    Text(
                      email,
                      style: StylesOfWidgets.textStyle1(
                          clr: AppColors.placeholderColor,
                          fs: SizeOfWidget.sizeOfH2),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    print('Chỉnh sửa thông tin cá nhân');
                    Navigator.pushNamed(context, RouteName.editinfoScreen);
                  },
                  child: Text(
                    'Sửa',
                    style: StylesOfWidgets.textStyle1(
                        clr: AppColors.primaryColor, fs: SizeOfWidget.sizeOfH2),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.sp)),
            ListTile(
              leading: Icon(
                Icons.shopping_cart_outlined,
                size: 20.sp,
                color: AppColors.primaryColor,
              ),
              title: Text(
                'Shop của tôi',
                style: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH2, clr: AppColors.primaryColor),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                // print("Shop của tôi được nhấn");
                Navigator.pushNamed(context, RouteName.shopManagementScreen);
              },
            ),
            const Divider(
              indent: 50,
            ),
            ListTile(
              leading: Icon(Icons.insert_drive_file, size: 20.sp),
              title: Text(
                'Lịch sử đơn hàng',
                style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                print("Shop của tôi được nhấn");
              },
            ),
            const Divider(
              indent: 50,
            ),
            // ListTile(
            //   leading: Icon(Icons.card_giftcard_rounded, size: 20.sp),
            //   title: Text(
            //     'Kho voucher của tôi',
            //     style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
            //   ),
            //   trailing: const Icon(Icons.chevron_right),
            //   onTap: () {
            //     print("Ưu đãi của tôi được nhấn");
            //     Navigator.pushNamed(context, RouteName.voucherScreen);
            //   },
            // ),
            // const Divider(
            //   indent: 50,
            // ),
            ListTile(
              leading: Icon(Icons.credit_card, size: 20.sp),
              title: Text(
                'Phương thức thanh toán',
                style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // print("Phương thức thanh toán được nhấn");
                Navigator.pushNamed(context, RouteName.paymentmethodScreen);
              },
            ),
            const Divider(
              indent: 50,
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                size: 20.sp,
              ),
              title: Text(
                'Địa chỉ của tôi',
                style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // print("Địa chỉ của tôi được nhấn");
                Navigator.pushNamed(context, RouteName.addressScreen);
              },
            ),
            const Divider(
              indent: 50,
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                size: 20.sp,
              ),
              title: Text(
                'Bảo mật',
                style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // print("Bảo mật được nhấn");
              },
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ngôn ngữ',
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                Container(
                  // height: 25.sp,
                  // width: 42.sp,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: settingViewModel.selectedLanguage,
                    underline: const SizedBox(),
                    items: ['Vietnam', 'English']
                        .map((String language) => DropdownMenuItem<String>(
                              value: language,
                              child: Text(
                                language,
=======
                  SizedBox(width: 15.sp),
                  FutureBuilder(
                      future: settingViewModel.getUser(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else if (snapshot.hasData) {
                          if (snapshot.data == null) {
                            return Text("Dữ liệu bị null");
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.fullName,
>>>>>>> origin/BranchOfCan
                                style: StylesOfWidgets.textStyle1(
                                    fs: SizeOfWidget.sizeOfH1,
                                    fw: FontWeight.w500),
                              ),
                              Text(
                                snapshot.data!.email,
                                style: StylesOfWidgets.textStyle1(
                                    clr: AppColors.placeholderColor,
                                    fs: SizeOfWidget.sizeOfH2),
                              ),
                            ],
                          );
                        } else {
                          return Text("Dữ liệu không tìm thấy");
                        }
                      }),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      print('Chỉnh sửa thông tin cá nhân');
                      Navigator.pushNamed(context, RouteName.editinfoScreen);
                    },
                    child: Text(
                      'Sửa',
                      style: StylesOfWidgets.textStyle1(
                          clr: AppColors.primaryColor,
                          fs: SizeOfWidget.sizeOfH2),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.sp)),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  size: 20.sp,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  'Shop của tôi',
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH2, clr: AppColors.primaryColor),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColors.primaryColor,
                ),
                onTap: () {
                  // print("Shop của tôi được nhấn");
                  Navigator.pushNamed(context, RouteName.shopManagementScreen);
                },
              ),
              const Divider(
                indent: 50,
              ),
              ListTile(
                leading: Icon(Icons.insert_drive_file, size: 20.sp),
                title: Text(
                  'Lịch sử đơn hàng',
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  print("Shop của tôi được nhấn");
                },
              ),
              const Divider(
                indent: 50,
              ),
              // ListTile(
              //   leading: Icon(Icons.card_giftcard_rounded, size: 20.sp),
              //   title: Text(
              //     'Kho voucher của tôi',
              //     style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
              //   ),
              //   trailing: const Icon(Icons.chevron_right),
              //   onTap: () {
              //     print("Ưu đãi của tôi được nhấn");
              //     Navigator.pushNamed(context, RouteName.voucherScreen);
              //   },
              // ),
              // const Divider(
              //   indent: 50,
              // ),
              ListTile(
                leading: Icon(Icons.credit_card, size: 20.sp),
                title: Text(
                  'Phương thức thanh toán',
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  print("Phương thức thanh toán được nhấn");
                  Navigator.pushNamed(context, RouteName.paymentmethodScreen);
                },
              ),
              const Divider(
                indent: 50,
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  size: 20.sp,
                ),
                title: Text(
                  'Địa chỉ của tôi',
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  print("Địa chỉ của tôi được nhấn");
                  Navigator.pushNamed(context, RouteName.addressScreen);
                },
              ),
              const Divider(
                indent: 50,
              ),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  size: 20.sp,
                ),
                title: Text(
                  'Bảo mật',
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  print("Bảo mật được nhấn");
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ngôn ngữ',
                    style:
                        StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                  ),
                  Container(
                    // height: 25.sp,
                    // width: 42.sp,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: settingViewModel.selectedLanguage,
                      underline: const SizedBox(),
                      items: ['Vietnam', 'English']
                          .map((String language) => DropdownMenuItem<String>(
                                value: language,
                                child: Text(
                                  language,
                                  style: StylesOfWidgets.textStyle1(
                                      clr: Colors.black,
                                      fs: SizeOfWidget.sizeOfH2),
                                ),
                              ))
                          .toList(),
                      onChanged: (String? newLanguage) {
                        settingViewModel.selectedLanguage = newLanguage!;
                      },
                      style:
                          StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 30.sp,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.sp),
                    child: Icon(
                      Icons.notifications,
                      size: 20.sp,
                    ),
                  ),
                  // SizedBox(width: 20.sp),
                  Expanded(
                    child: SwitchListTile(
                      title: Text(
                        'Âm thanh thông báo',
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2),
                      ),
                      value: settingViewModel.notificationSound,
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.primaryColor,
                      thumbColor: const WidgetStatePropertyAll(Colors.white),
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 222, 222, 222),
                      onChanged: (bool value) {
                        settingViewModel.notificationSound = value;
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 30.sp,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.sp),
                    child: Icon(
                      Icons.notifications,
                      size: 20.sp,
                    ),
                  ),
                  // SizedBox(width: 10.sp),
                  Expanded(
                    child: SwitchListTile(
                      title: Text(
                        'Âm thanh trong ứng dụng',
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2),
                      ),
                      value: settingViewModel.sound,
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.primaryColor,
                      thumbColor: const WidgetStatePropertyAll(Colors.white),
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 222, 222, 222),
                      onChanged: (bool value) {
                        settingViewModel.sound = value;
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                indent: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.sp),
                    child: Icon(
                      Icons.notifications,
                      size: 20.sp,
                    ),
                  ),
                  // SizedBox(width: 10),
                  Expanded(
                    child: SwitchListTile(
                      title: Text(
                        'Thông báo cập nhật',
                        style: StylesOfWidgets.textStyle1(
                            fs: SizeOfWidget.sizeOfH2),
                      ),
                      value: settingViewModel.updateNotification,
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.primaryColor,
                      thumbColor: const WidgetStatePropertyAll(Colors.white),
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 222, 222, 222),
                      onChanged: (bool value) {
                        settingViewModel.updateNotification = value;
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                indent: 50,
              ),
              ListTile(
                leading: Icon(Icons.info_outline, size: 20.sp),
                title: Text(
                  'Thông tin ứng dụng',
                  style: StylesOfWidgets.textStyle1(fs: SizeOfWidget.sizeOfH2),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  print("Ưu đãi của tôi được nhấn");
                },
              ),
              SizedBox(
                height: 20.sp,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side:
                      const BorderSide(color: AppColors.primaryColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.sp),
                ),
                onPressed: () {
                  print("Đăng xuất");
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.loginScreen,
                    (route) => false, // Xóa tất cả các route trước đó
                  );
                },
                child: Text(
                  'ĐĂNG XUẤT',
                  style: StylesOfWidgets.textStyle1(
                      fs: SizeOfWidget.sizeOfH3,
                      clr: AppColors.primaryColor,
                      fw: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

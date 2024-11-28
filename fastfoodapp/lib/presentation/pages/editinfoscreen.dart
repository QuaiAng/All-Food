import 'package:fastfoodapp/presentation/states/editinfoviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/infofield.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';

class Editinfoscreen extends StatelessWidget {
  const Editinfoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editInfoViewModel = Provider.of<Editinfoviewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
          "CHỈNH SỬA THÔNG TIN",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH3, fw: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 18.sp),
          child: Form(
            key: editInfoViewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ẢNH",
                    style: StylesOfWidgets.textStyle1(
                        fs: SizeOfWidget.sizeOfH4, fw: FontWeight.w700)),
                SizedBox(height: 5.sp),
                Center(
                  child: Stack(children: [
                    Container(
                      width: 50.sp, // Kích thước đường kính hình ảnh
                      height: 50.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor, // Màu viền vàng
                          width: 1, // Độ dày của viền
                        ),
                      ),
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTapDown: (details) {
                              _showPopupMenu(context, details.globalPosition);
                            },
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5), // Lớp phủ tối
                                BlendMode.darken, // Chế độ blend
                              ),
                              child: Image.asset(
                                Imagepath.burger,
                                width: 50.sp, // Đường kính của hình tròn
                                height: 50.sp,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30.sp,
                      right: 30.sp,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 10.sp),
                Infofield(
                  label: 'HỌ TÊN',
                  value: editInfoViewModel.nameController,
                  isPassword: false,
                  isAddress: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Họ tên không được bỏ trống.';
                    }
                    return null;
                  },
                ),
                Infofield(
                  label: 'EMAIL',
                  value: editInfoViewModel.emailController,
                  isPassword: false,
                  isAddress: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email.';
                    }
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'); // Regex kiểm tra email
                    if (!emailRegex.hasMatch(value)) {
                      return 'Email không hợp lệ.';
                    }
                    if (value.length < 5) {
                      return 'Email phải có độ dài it nhất 5 kí tự';
                    }
                    return null;
                  },
                ),
                Infofield(
                  label: 'ĐIỆN THOẠI',
                  value: editInfoViewModel.phoneController,
                  isPassword: false,
                  isAddress: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại.';
                    }
                    final phoneRegex = RegExp(
                        r'^(03|05|07|08|09)\d{8}$'); // Regex kiểm tra số điện thoại
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Số điện thoại không hợp lệ.';
                    }
                    return null;
                  },
                ),
                Infofield(
                  label: 'MẬT KHẨU',
                  value: editInfoViewModel.passwordController,
                  isPassword: true,
                  isAddress: false,
                ),
                Infofield(
                  label: 'ĐỊA CHỈ',
                  value: editInfoViewModel.addressController,
                  isPassword: false,
                  isAddress: true,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
          child: SizedBox(
            child: Center(
              child: Buttonlogin(
                  onClick: () {
                    if (editInfoViewModel.validateForm()) {
                      // Xử lý lưu thông tin khi dữ liệu hợp lệ
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Thông tin đã được lưu!'),
                        ),
                      );
                    }
                  },
                  text: "HOÀN THÀNH"),
            ),
          ),
        ),
      ),
    );
  }

  // Hàm hiển thị menu khi bấm vào ảnh
  void _showPopupMenu(BuildContext context, Offset position) async {
    //final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    await showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
      items: <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'view',
          child: Row(
            children: [
              const Icon(Icons.image_outlined),
              SizedBox(width: 10.sp),
              Text(
                'Xem ảnh đại diện',
                style: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w500),
              ),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          height: 0,
          enabled: false, // Không cho phép chọn
          child: Divider(
            height: 1,
            color: Colors.grey,
            thickness: 0.5, // Độ dày của divider
          ),
        ),
        // Padding(padding: EdgeInsets.symmetric(horizontal: 20.sp) child: ,)
        PopupMenuItem<String>(
          value: 'upload',
          child: Row(
            children: [
              const Icon(Icons.file_upload_outlined),
              SizedBox(width: 10.sp),
              Text(
                'Tải lên từ thư viện',
                style: StylesOfWidgets.textStyle1(
                    fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        if (value == 'view') {
          //xem ảnh đại diện
        } else if (value == 'upload') {
          //tải ảnh lên
        }
      }
    });
  }
}

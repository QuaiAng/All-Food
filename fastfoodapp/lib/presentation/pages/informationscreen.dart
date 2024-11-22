import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pelaicons/pelaicons.dart';

class Informationscreen extends StatefulWidget {
  final String name;
  final String email; 
  final String imagePath;

  const Informationscreen({super.key, required this.name, required this.email, required this.imagePath});

  @override
  State<StatefulWidget> createState() => _Informationscreen();
}

class _Informationscreen extends State<Informationscreen> {
  bool notificationSound = true;
  bool sound = false;
  bool updateNotification = true;
  String selectedLanguage = "Vietnam";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeOfWidget.sizeOfH2),
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  print('Chỉnh sửa thông tin cá nhân');
                },
                child: Text(
                  'Edit',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: SizeOfWidget.sizeOfH2),
                ),
              ),
            ],  
          ),
          Padding(padding: EdgeInsets.only(top: 10.sp)),
          ListTile(
            leading: Icon(Pelaicons.cart_2_light_outline, size: SizeOfWidget.icon),
            title: Text(
              'Shop của tôi',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Shop của tôi được nhấn");
            },
          ),
          Divider(indent: 50,),
          ListTile(
            leading: Icon(Icons.insert_drive_file, size: SizeOfWidget.icon),
            title: Text(
              'Lịch sử đơn hàng',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Shop của tôi được nhấn");
            },
          ),
          Divider(indent: 50,),
          ListTile(
            leading: Icon(Icons.discount_outlined, size: SizeOfWidget.icon),
            title: Text(
              'Ưu đãi của tôi',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Ưu đãi của tôi được nhấn");
            },
          ),
          Divider(indent: 50,),
          ListTile(
            leading: Icon(Icons.credit_card, size: SizeOfWidget.icon),
            title: Text(
              'Phương thức thanh toán',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Phương thức thanh toán được nhấn");
            },
          ),
          Divider(indent: 50,),
          ListTile(
            leading: Icon(Icons.location_on, size: SizeOfWidget.icon,),
            title: Text(
              'Địa chỉ của tôi',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Địa chỉ của tôi được nhấn");
            },
          ),
          Divider(indent: 50,),
          ListTile(
            leading: Icon(Icons.lock, size: SizeOfWidget.icon,),
            title: Text(
              'Bảo mật',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Bảo mật được nhấn");
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ngôn ngữ',
                  style: TextStyle(fontSize: SizeOfWidget.sizeOfH3),
                ),
                Container(
                  height: 36,
                  width: 123,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: DropdownButton<String>(
                    value: selectedLanguage,
                    underline: SizedBox(),
                    items: ['Vietnam', 'English', 'Spanish']
                        .map((String language) => DropdownMenuItem<String>(
                              value: language,
                              child: Text(language),
                            ))
                        .toList(),
                    onChanged: (String? newLanguage) {
                      setState(() {
                        selectedLanguage = newLanguage!;
                        print("Ngôn ngữ được chọn: $selectedLanguage");
                      });
                    },
                    style: TextStyle(
                      fontSize: SizeOfWidget.sizeOfH3
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(indent: 50,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.sp),
                child: Icon(
                  Icons.notifications, size: SizeOfWidget.icon,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SwitchListTile(
                  title: Text(
                    'Âm thanh thông báo',
                    style: TextStyle(
                      fontSize: SizeOfWidget.sizeOfH3
                    ),
                  ),
                  value: notificationSound,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primaryColor,
                  inactiveThumbColor: AppColors.primaryColor,
                  inactiveTrackColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      notificationSound = value;
                      print("Âm thanh thông báo: $value");
                    });
                  },
                ),
              ),
            ],
          ),
          Divider(indent: 50.sp,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.sp),
                child: Icon(
                  Icons.notifications, size: SizeOfWidget.icon,
                ),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: SwitchListTile(
                  title: Text(
                    'Âm thanh trông ứng dụng',
                    style: TextStyle(
                      fontSize: SizeOfWidget.sizeOfH3
                    ),
                  ),
                  value: notificationSound,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primaryColor,
                  inactiveThumbColor: AppColors.primaryColor,
                  inactiveTrackColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      notificationSound = value;
                      print("Âm thanh trong ứng dụng: $value");
                    });
                  },
                ),
              ),
            ],
          ),
          Divider(indent: 50,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.sp),
                child: Icon(
                  Icons.notifications, size: SizeOfWidget.icon,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SwitchListTile(
                  title: Text(
                    'Thông báo cập nhật',
                    style: TextStyle(
                      fontSize: SizeOfWidget.sizeOfH3
                    ),
                  ),
                  value: notificationSound,
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primaryColor,
                  inactiveThumbColor: AppColors.primaryColor,
                  inactiveTrackColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      notificationSound = value;
                      print("Thông báo câp nhật: $value");
                    });
                  },
                ),
              ),
            ],
          ),
          Divider(indent: 50,),
          ListTile(
            title: Text(
              'Thông tin ứng dụng',
              style: TextStyle(
                fontSize: SizeOfWidget.sizeOfH3
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Thông tin ứng dụng được nhấn");
            },
          ),
          Padding(padding: EdgeInsets.only(top: 30.sp)),
          Center(
            child: SizedBox(
              width: 800.sp,
              height: 26.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  side: BorderSide(color: Colors.orange, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                onPressed: () {
                  print("Đăng xuất");
                },
                child: Text(
                  'ĐĂNG XUẤT',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: SizeOfWidget.sizeOfH3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

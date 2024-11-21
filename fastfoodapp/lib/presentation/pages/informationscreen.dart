import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/images.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.imagePath),
              radius: 25,
            ),
            title: Text(
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.email),
            trailing: TextButton(
              onPressed: () {
                print('Chỉnh sửa thông tin cá nhân');
              },
              child: const Text(
                'Edit',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.sp)),
          ListTile(
            leading: Icon(Icons.store, size: SizeOfWidget.icon),
            title: Text('Shop của tôi'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Shop của tôi được nhấn");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.card_giftcard, size: SizeOfWidget.icon),
            title: Text('Ưu đãi của tôi'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Ưu đãi của tôi được nhấn");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, size: SizeOfWidget.icon),
            title: Text('Phương thức thanh toán'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Phương thức thanh toán được nhấn");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on, size: SizeOfWidget.icon,),
            title: Text('Địa chỉ của tôi'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Địa chỉ của tôi được nhấn");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock, size: SizeOfWidget.icon,),
            title: Text('Bảo mật'),
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
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SwitchListTile(
            title: Text('Âm thanh thông báo'),
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
          SwitchListTile(
            title: Text('Âm thanh'),
            value: sound,
            activeColor: Colors.white,
            activeTrackColor: AppColors.primaryColor,
            inactiveThumbColor: AppColors.primaryColor,
            inactiveTrackColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                sound = value;
                print("Âm thanh: $value");
              });
            },
          ),
          SwitchListTile(
            title: Text('Thông báo cập nhật'),
            value: updateNotification,
            activeColor: Colors.white,
            activeTrackColor: AppColors.primaryColor,
            inactiveThumbColor: AppColors.primaryColor,
            inactiveTrackColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                updateNotification = value;
                print("Thông báo cập nhật: $value");
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text('About App'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print("Thông tin ứng dụng được nhấn");
            },
          ),
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

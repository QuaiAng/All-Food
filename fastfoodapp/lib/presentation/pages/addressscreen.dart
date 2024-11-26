import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sizer/sizer.dart';

class Addressscreen extends StatefulWidget {
  const Addressscreen({super.key});
  @override
  State<Addressscreen> createState() => _Addressscreen();
}

class _Addressscreen extends State<Addressscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "DANH SÁCH ĐỊA CHỈ",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeOfWidget.sizeOfH1),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.detailsearchScreen);
                },
                child: Container(
                  height: 30.sp,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 240, 240),
                    border: Border.all(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.sp, right: 20.sp),
                        child: Icon(
                          Icons.location_on,
                          size: 20.sp,
                          color: AppColors.gray,
                        ),
                      ),
                      Text(
                        "Địa chỉ mới",
                        style: StylesOfWidgets.textStyle1(
                          fs: SizeOfWidget.sizeOfH3,
                          clr: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Text(
                "ĐỊA CHỈ HIỆN TẠI",
                style: StylesOfWidgets.textStyle1(
                    clr: Colors.black,
                    fw: FontWeight.w500,
                    fs: SizeOfWidget.sizeOfH2),
              ),
              SizedBox(height: 15.sp),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  size: 20.sp,
                ),
                title: Text(
                  "Địa chỉ hiện tại",
                  style: StylesOfWidgets.textStyle1(
                      clr: Colors.black,
                      fw: FontWeight.w400,
                      fs: SizeOfWidget.sizeOfH2),
                ),
                subtitle: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "748 Huynh Tan Phat, Phu Nhuan, Quan 10, Thành Phố Hồ Chí Minh",
                  style: StylesOfWidgets.textStyle1(
                      clr: Colors.grey,
                      fw: FontWeight.w400,
                      fs: SizeOfWidget.sizeOfH3),
                ),
              ),
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ĐỊA CHỈ ĐÃ LƯU",
                    style: StylesOfWidgets.textStyle1(
                        clr: Colors.black,
                        fw: FontWeight.w500,
                        fs: SizeOfWidget.sizeOfH2),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "XÓA",
                        style: StylesOfWidgets.textStyle1(
                            clr: Colors.black,
                            fw: FontWeight.w300,
                            fs: SizeOfWidget.sizeOfH4),
                      ))
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Slidable(
                          endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                    backgroundColor: Colors.red,
                                    label: "Xóa",
                                    onPressed: (context) {
                                      // items.removeAt(index);
                                      const snackBar = SnackBar(
                                        content: Text(
                                          "Đã xóa",
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    })
                              ]),
                          child: ListTile(
                            leading: Icon(
                              Icons.location_on,
                              size: 20.sp,
                            ),
                            title: Text(
                              "Địa chỉ ${index + 1}",
                              style: StylesOfWidgets.textStyle1(
                                  clr: Colors.black,
                                  fw: FontWeight.w400,
                                  fs: SizeOfWidget.sizeOfH2),
                            ),
                            subtitle: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "748 Huynh Tan Phat, Phu Nhuan, Quan 10, Thành Phố Hồ Chí Minh",
                              style: StylesOfWidgets.textStyle1(
                                  clr: Colors.grey,
                                  fw: FontWeight.w400,
                                  fs: SizeOfWidget.sizeOfH3),
                            ),
                          ),
                        ),
                        if (index < 4)
                          const Divider(
                            indent: 50,
                          )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 4.sp),
            child: Center(child: Buttonlogin(onClick: () {}, text: "LƯU")),
          )),
    );
  }
}

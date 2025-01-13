import 'package:fastfoodapp/app_router.dart';
import 'package:fastfoodapp/presentation/states/addressviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Addressscreen extends StatelessWidget {
  const Addressscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressViewModel = Provider.of<Addressviewmodel>(context);
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
                subtitle: FutureBuilder(
                  future: addressViewModel.getAddressCurrent(),
                  builder: (BuildContext context, snapshot) {
                    // String currentAddress = snapshot.data == null
                    //     ? 'Chưa có địa chỉ hiện tại'
                    //     : snapshot.data!;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        snapshot.data!,
                        style: StylesOfWidgets.textStyle1(
                            clr: Colors.grey,
                            fw: FontWeight.w400,
                            fs: SizeOfWidget.sizeOfH3),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 20.sp),
              Text(
                "ĐỊA CHỈ ĐÃ LƯU",
                style: StylesOfWidgets.textStyle1(
                    clr: Colors.black,
                    fw: FontWeight.w500,
                    fs: SizeOfWidget.sizeOfH2),
              ),
              FutureBuilder(
                future: addressViewModel.getAddress(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: addressViewModel.listAddressUser.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CupertinoContextMenu(
                                      actions: [
                                        CupertinoContextMenuAction(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  "Chọn làm địa chỉ hiện tại  "),
                                              Icon(
                                                Icons.location_on,
                                                size: 18.sp,
                                              )
                                            ],
                                          ),
                                          onPressed: () async {
                                            final result =
                                                await addressViewModel
                                                    .saveAddressByIdCurrent(
                                                        addressViewModel
                                                            .listAddressUser[
                                                                index]
                                                            .addressId);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        CupertinoContextMenuAction(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                  "Xóa địa chỉ tại danh sách "),
                                              Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 18.sp,
                                              )
                                            ],
                                          ),
                                          onPressed: () async {
                                            final result =
                                                await addressViewModel
                                                    .deleteAddressById(
                                                        addressViewModel
                                                            .listAddressUser[
                                                                index]
                                                            .addressId);
                                            Navigator.pop(context);

                                            if (result == true) {
                                              return showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          "Thông báo"),
                                                      content: const Text(
                                                          "Đã xóa thành công"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context,
                                                                  true);
                                                            },
                                                            child: const Text("OK"))
                                                      ],
                                                    );
                                                  });
                                            }
                                          },
                                        ),
                                      ],
                                      child: Material(
                                        color: AppColors.backgroundColor,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
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
                                                fs: SizeOfWidget.sizeOfH2,
                                              ),
                                            ),
                                            subtitle: Text(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              addressViewModel
                                                  .listAddressUser[index]
                                                  .address,
                                              style: StylesOfWidgets.textStyle1(
                                                clr: Colors.grey,
                                                fw: FontWeight.w400,
                                                fs: SizeOfWidget.sizeOfH3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (index < 4)
                                const Divider(
                                  indent: 50,
                                )
                            ],
                          );
                        });
                  }
                },
              )
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

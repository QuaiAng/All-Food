import 'package:fastfoodapp/main.dart';
import 'package:fastfoodapp/presentation/states/addressviewmodel.dart';
import 'package:fastfoodapp/presentation/states/addvoucherviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Addvoucherscreen extends StatelessWidget {
  const Addvoucherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var addVoucherViewModel = Provider.of<Addvoucherviewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "THÊM VOUCHER",
          style: StylesOfWidgets.textStyle1(
              fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //Chọn ngày bắt đầu voucher
                Expanded(
                  child: GestureDetector(
                    onTap: () => addVoucherViewModel.selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Ngày bắt đầu",
                            style: StylesOfWidgets.textStyle1(
                              fs: 14.sp,
                              fw: FontWeight.w500,
                              clr: const Color.fromRGBO(177, 174, 174, 1),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: const Color.fromRGBO(177, 174, 174, 1),
                          ),
                          border: StylesOfWidgets.textboxStyle,
                          focusedBorder: StylesOfWidgets.textboxStyle,
                          enabledBorder: StylesOfWidgets.textboxStyle,
                        ),
                        controller: addVoucherViewModel.startDate,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.sp),

                //Chọn ngày kết thúc voucher
                Expanded(
                  child: GestureDetector(
                    onTap: () => addVoucherViewModel.selectDate(context, false),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(
                            "Ngày kết thúc",
                            style: StylesOfWidgets.textStyle1(
                              fs: 14.sp,
                              fw: FontWeight.w500,
                              clr: const Color.fromRGBO(177, 174, 174, 1),
                            ),
                          ),
                          prefixIcon: Icon(Icons.calendar_today,
                              color: const Color.fromRGBO(177, 174, 174, 1)),
                          border: StylesOfWidgets.textboxStyle,
                          focusedBorder: StylesOfWidgets.textboxStyle,
                          enabledBorder: StylesOfWidgets.textboxStyle,
                        ),
                        controller: addVoucherViewModel.endDate,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  "Ưu đãi",
                  style: StylesOfWidgets.textStyle1(
                    fs: 15.sp,
                    fw: FontWeight.w500,
                    clr: const Color.fromRGBO(177, 174, 174, 1),
                  ),
                ),
                //floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixText: "%",
                border: StylesOfWidgets.textboxStyle,
                focusedBorder: StylesOfWidgets.textboxStyle,
                enabledBorder: StylesOfWidgets.textboxStyle,
              ),
              keyboardType: TextInputType.number,
              controller: addVoucherViewModel.discount,
              onChanged: (value) {
                addVoucherViewModel.updateDiscount(value);
                
              },
            ),
            SizedBox(height: 20.sp),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                label: Text(
                  "Điều kiện áp dụng",
                  style: StylesOfWidgets.textStyle1(
                    fs: 15.sp,
                    fw: FontWeight.w500,
                    clr: const Color.fromRGBO(177, 174, 174, 1),
                  ),
                ),
                border: StylesOfWidgets.textboxStyle,
                focusedBorder: StylesOfWidgets.textboxStyle,
                enabledBorder: StylesOfWidgets.textboxStyle,
              ),
              items: ["Condition 1", "Condition 2", "Condition 3"]
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) =>
                  {addVoucherViewModel.updateCondition(value!)},
            ),
            SizedBox(height: 20.sp),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                label: Text(
                  "Phương thức áp dụng",
                  style: StylesOfWidgets.textStyle1(
                    fs: 15.sp,
                    fw: FontWeight.w500,
                    clr: const Color.fromRGBO(177, 174, 174, 1),
                  ),
                ),
                border: StylesOfWidgets.textboxStyle,
                focusedBorder: StylesOfWidgets.textboxStyle,
                enabledBorder: StylesOfWidgets.textboxStyle,
              ),
              items: ["Method 1", "Method 2", "Method 3"]
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) => {addVoucherViewModel.updateMethod(value!)},
            ),
            SizedBox(height: 20.sp),
            Buttonlogin(onClick: () {
              addVoucherViewModel.validateDiscount(context);
            }, text: "THÊM")
          ],
        ),
      ),
    );
  }
}

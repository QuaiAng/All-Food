import 'package:fastfoodapp/data/models/VoucherModel.dart';
import 'package:fastfoodapp/presentation/states/voucherviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/vouchercard.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/size.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Voucherscreen extends StatelessWidget {
  const Voucherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var voucherViewModel = Provider.of<Voucherviewmodel>(context, listen: true);

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
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
          title: Text(
            "VOUCHER",
            style: StylesOfWidgets.textStyle1(
                fs: SizeOfWidget.sizeOfH2, fw: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Vouchermodel>>(
            future: voucherViewModel.getVoucher(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Value'));
              } else {
                var vouchers = snapshot.data!;
                return ListView.builder(
                  itemCount: vouchers.length,
                  itemBuilder: (context, index) {
                    var voucher = vouchers[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 30, right: 30),
                      child: Vouchercard(
                        name: voucher.Title,
                        description: voucher.Description,
                        turn: voucher.Quantity,
                      ),
                    );
                  },
                );
              }
            }));
  }
}

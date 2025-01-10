import 'package:fastfoodapp/presentation/states/filterrevenueviewmodel.dart';
import 'package:fastfoodapp/presentation/widgets/buttonLogin.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:fastfoodapp/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filterrevenuescreen extends StatelessWidget {
  const Filterrevenuescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var filterviewmodel = Provider.of<Filterrevenueviewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
        title: const Text(
          "LỌC DOANH THU",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'CHỌN NGÀY LỌC',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => filterviewmodel.selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: const Text(
                            'Ngày bắt đầu',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                          border: StylesOfWidgets.textboxStyle,
                          focusedBorder: StylesOfWidgets.textboxStyle,
                          enabledBorder: StylesOfWidgets.textboxStyle,
                        ),
                      ),
                    ),
                  )
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => filterviewmodel.selectDate(context, false),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: const Text(
                            'Ngày kết thúc',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                          border: StylesOfWidgets.textboxStyle,
                          focusedBorder: StylesOfWidgets.textboxStyle,
                          enabledBorder: StylesOfWidgets.textboxStyle,
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'DOANH THU CỦA BẠN TRONG NGÀY QUA:',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                '1.270.000 đ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Buttonlogin(
              onClick: () {}, 
              text: 'LỌC'
            )
          ],
        ),
      ),
    );
  }
}
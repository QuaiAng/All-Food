import 'package:fastfoodapp/presentation/states/orderstatusviewmodel.dart';
import 'package:fastfoodapp/presentation/states/provider.dart';
import 'package:fastfoodapp/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  TimelineState createState() => TimelineState();
}

class TimelineState extends State<Timeline> {
  // Danh sách lưu trạng thái kích hoạt
  Map<String, bool> mapTimeLine = {
    'Xác nhận': false,
    'Chuẩn bị': false,
    'Đã gửi': false,
    'Đang giao': false,
    'Đã giao': false,
  };

  List<IconData> icons = [
    Icons.check,
    Icons.view_compact_alt_outlined,
    Icons.send_outlined,
    Icons.local_shipping_outlined,
    Icons.shopping_bag_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.red,
      height: 45.sp,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Các phần tử giãn đều
        children: List.generate(
          mapTimeLine.length,
          (index) => Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              isFirst: index == 0, // Sự kiện đầu tiên
              isLast: index == mapTimeLine.length - 1, // Sự kiện cuối
              indicatorStyle: IndicatorStyle(
                indicator: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mapTimeLine.values.toList()[index]
                        ? Colors.green
                        : AppColors.lightGray, // Màu theo trạng thái
                  ),
                  child: Icon(
                    icons[index], // Thay bằng icon phù hợp
                    color: Colors.white,
                    size: 20.sp, // Kích thước icon
                  ),
                ),
                width: 25.sp,
                height: 25.sp,
              ),
              beforeLineStyle: LineStyle(
                color: mapTimeLine.values.toList()[index]
                    ? Colors.green
                    : AppColors.lightGray,
                thickness: 10.sp,
              ),
              afterLineStyle: LineStyle(
                color: mapTimeLine.values.toList()[index]
                    ? Colors.green
                    : AppColors.lightGray,
                thickness: 10.sp,
              ),
              endChild: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      mapTimeLine.keys.toList()[index],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: mapTimeLine.values.toList()[index]
                            ? Colors.green
                            : AppColors.lightGray,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            mapTimeLine[mapTimeLine.keys.toList()[index]] =
                                !mapTimeLine[mapTimeLine.keys.toList()[index]]!;
                            var provider = Provider.of<OrderStatusViewModel>(
                                context,
                                listen: false);
                            provider.updateOrderStatus(index + 1);
                            print("Trạng thái đơn hàng: ${index + 1}");
                          });
                        },
                        child: const Text(""))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

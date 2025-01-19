import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Addvoucherviewmodel extends ChangeNotifier {
  TextEditingController _startDate = TextEditingController(text: "");
  TextEditingController _endDate = TextEditingController(text: "");
  TextEditingController _discount = TextEditingController(text: "");
  String _condition = "";
  String _method = "";

  TextEditingController get startDate => _startDate;
  TextEditingController get endDate => _endDate;
  TextEditingController get discount => _discount;
  String get condition => _condition;
  String get method => _method;

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime? firstDate = DateTime(2000);
    DateTime? lastDate = DateTime(2100);

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    if (isStartDate) {
      // Ngày bắt đầu
      if (startDate.text.isNotEmpty) {
        try {
          initialDate = dateFormat.parse(startDate.text);
        } catch (e) {
          initialDate = DateTime.now();
        }
      }
      // Giới hạn ngày bắt đầu là ngày hôm nay trở đi
      firstDate = DateTime.now();
    } else {
      // Ngày kết thúc
      if (startDate.text.isNotEmpty) {
        try {
          firstDate = dateFormat.parse(startDate.text);
        } catch (e) {
          firstDate = DateTime.now();
        }
      }
      if (endDate.text.isNotEmpty) {
        try {
          initialDate = dateFormat.parse(endDate.text);
        } catch (e) {
          initialDate = DateTime.now();
        }
      }
    }

    // Đảm bảo rằng initialDate không trước firstDate
    if (initialDate.isBefore(firstDate!)) {
      initialDate = firstDate;
    }

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      String formattedDate = dateFormat.format(picked);

      if (isStartDate) {
        // Cập nhật ngày bắt đầu
        startDate.text = formattedDate;

        // Nếu ngày bắt đầu sau ngày kết thúc, cập nhật ngày kết thúc
        if (endDate.text.isNotEmpty) {
          try {
            DateTime end = dateFormat.parse(endDate.text);
            if (picked.isAfter(end)) {
              //endDate.text = formattedDate;
              startDate.text = endDate.text;
              // showSnackBar(context,
              //     'Ngày bắt đầu lớn hơn ngày kết thúc. Ngày kết thúc đã được cập nhật.');
            }
          } catch (e) {
            // Nếu có lỗi trong xử lý ngày kết thúc
          }
        }
      } 
      else {
        // Cập nhật ngày kết thúc
        endDate.text = formattedDate;
        //startDate.text = endDate.text;

        // Nếu ngày kết thúc trước ngày bắt đầu, thông báo lỗi
        // try {
        //   DateTime start = dateFormat.parse(startDate.text);
        //   if (picked.isBefore(start)) {
        //     endDate.text = dateFormat.format(start.add(Duration(days: 1)));

        //     showSnackBar(context,
        //         'Ngày kết thúc nhỏ hơn ngày bắt đầu. Ngày kết thúc đã được điều chỉnh.');
        //   }
        // } catch (e) {
        //   // Nếu có lỗi trong xử lý ngày bắt đầu
        // }
      }

      notifyListeners();
    }
  }

  //Kiểm tra ưu đãi
  void validateDiscount(BuildContext context) {
    if (discount.text.isNotEmpty) {
      try {
        int discountValue = int.parse(discount.text);
        if (discountValue < 1 || discountValue > 100) {
          // Hiển thị SnackBar nếu giá trị không hợp lệ
          showSnackBar(context, 'Discount phải nằm trong khoảng từ 1 đến 100');
        }
      } catch (e) {
        // Hiển thị SnackBar nếu giá trị không phải là số
        showSnackBar(context, 'Giá trị Discount không hợp lệ');
      }
    } else {
      // Hiển thị SnackBar nếu để trống
      showSnackBar(context, 'Discount không được để trống');
    }
  }

  void updateDiscount(String value) {
    _discount.text = value;
    notifyListeners();
  }

  void updateCondition(String value) {
    _condition = value;
    notifyListeners();
  }

  void updateMethod(String value) {
    _method = value;
    notifyListeners();
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _startDate.dispose;
    _endDate.dispose;
    _discount.dispose;
    super.dispose();
  }
}

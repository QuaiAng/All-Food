import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Filterrevenueviewmodel extends ChangeNotifier{
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  TextEditingController get getStartDateController => _startDateController;
  TextEditingController get getEndDateController => _endDateController;

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime? firstDay = DateTime(2000);
    DateTime? lastDay = DateTime(2100);

    DateFormat formatter = DateFormat('dd/MM/yyyy');

    if(isStartDate) {
      //ngày bắt đầu
      if(getStartDateController.text.isNotEmpty){
        initialDate = formatter.parse(getStartDateController.text);
      }
    }else {
      //ngày kết thúc
      if(getEndDateController.text.isNotEmpty){
        initialDate = formatter.parse(getEndDateController.text);
      }
    }

    //đảm bào không qua ngày
    if(initialDate.isBefore(firstDay)){
      initialDate = firstDay;
    }else if(initialDate.isAfter(lastDay)){
      initialDate = lastDay;
    }

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDay,
      lastDate: lastDay,
    );

    if(picked != null){
      if(isStartDate){
        _startDateController.text = formatter.format(picked);
      }else{
        _endDateController.text = formatter.format(picked);
      }
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }
}


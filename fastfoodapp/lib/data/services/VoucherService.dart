import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fastfoodapp/res/strings.dart';

class Voucherservice {
  Future<List<dynamic>> getVoucher() async {
  final _response = await http.get(
    Uri.parse("${AppStrings.urlAPI}/voucher")
  );

  if (_response.statusCode == 200) {
    var data = jsonDecode(_response.body)['data'];
    print(data); // Thêm log để kiểm tra dữ liệu
    return data;
  } else {
    print('Error: ${_response.body}'); // Thêm log để kiểm tra lỗi
    return jsonDecode(_response.body);
  }
}
}
import 'package:fastfoodapp/data/models/VoucherModel.dart';
import 'package:fastfoodapp/data/services/VoucherService.dart';

class Voucherrepository {
  const Voucherrepository(this._voucherservice);
  final Voucherservice _voucherservice;

  Future<List<Vouchermodel>> getVoucher() async {
    List<dynamic> _response = await _voucherservice.getVoucher();
    List<Vouchermodel> _list = 
        _response.map((voucher) => Vouchermodel.fromJSON(voucher)).toList();
    return _list;
  }
}
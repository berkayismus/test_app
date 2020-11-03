import 'package:http/http.dart' as http;
import 'package:test_app/services/constants.dart';

class WareHouseApi {
  static Future getWareHouses() async {
    var response = await http.get('$kBaseUrl/WarehouseList');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ('get ware house api error');
    }
  }

  static Future getWareHouseDetails(String id) async {
    var response = await http.get('$kBaseUrl/WarehouseList/$id');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ('get warehouse details api error');
    }
  }
}

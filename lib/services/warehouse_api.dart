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

  static Future updateWareHouse(
      String wareHouseId, String wareHouseName, String wareHouseStatus) async {
    Map postBody = {
      'id': wareHouseId,
      'warehouse_name': wareHouseName,
      'status': wareHouseStatus
    };
    var response =
        await http.post('$kBaseUrl/WarehouseList/$wareHouseId', body: postBody);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ('update warehouse api error');
    }
  }
}

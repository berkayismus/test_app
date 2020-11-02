import 'package:http/http.dart' as http;
import 'package:test_app/services/constants.dart';

class ProductApi {
  static Future getProductList() async {
    var response = await http.get('$kBaseUrl/ProductList');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ('get product list api error');
    }
  }
}

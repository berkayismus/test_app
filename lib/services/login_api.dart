import 'package:http/http.dart' as http;
import 'constants.dart';

class LoginApi {
  static Future userLogin(String userName, String userPassword) async {
    Map postData = {'username': userName, 'password': userPassword};
    var response = await http.post('$kBaseUrl/Login', body: postData);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ('user login service error');
    }
  }
}

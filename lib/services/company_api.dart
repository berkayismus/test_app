import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/models/Company.dart';
import 'package:test_app/services/constants.dart';

class CompanyApi {
  static Future getCompanyInfo() async {
    var response = await http.get('$kBaseUrl/CompanyInfo');
    if (response.statusCode == 200) {
      // return response;
      Map responseBody = jsonDecode(response.body);
      Company company = Company.toJSON(responseBody);
      return company;
    } else {
      throw ('get company info api error');
    }
  }
}

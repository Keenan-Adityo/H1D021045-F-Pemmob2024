import 'dart:convert';

import 'package:labmobile4_keenan_f/helpers/api.dart';
import 'package:labmobile4_keenan_f/helpers/api_url.dart';
import 'package:labmobile4_keenan_f/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;
    var body = {"nama": nama, "email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}

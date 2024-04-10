import '../model/datamodel/register_model.dart';
import 'dio.dart';
import 'package:get_it/get_it.dart';

import '../constants/app_strings.dart';

class ApiService {
  final _client = GetIt.I<Client>().init();

  Future<bool> registerUser(RegisterModel userRegisterData) async {
    var path = "${Appstrings.baseUrl}${Appstrings.userRegister}";
    var jsonPostData = registerModelToJson(userRegisterData);
    final response = await _client.post(path, data: jsonPostData);
    if (response.data != null) {
      var returnData = registerModelFromJson(response.data);
    }
    return true;
  }
}

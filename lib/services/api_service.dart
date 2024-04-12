import 'package:get_it/get_it.dart';

import '../constants/app_strings.dart';
import '../model/datamodel/SignupSuccessModel.dart';
import '../model/datamodel/register_model.dart';
import 'dio.dart';

class ApiService {
  final _client = GetIt.I<Client>().init();

  Future<SignupSuccessModel?> registerUser(
      RegisterModel userRegisterData) async {
    SignupSuccessModel? success;
    var path = "${Appstrings.baseUrl}${Appstrings.userRegister}";
    var jsonPostData = registerModelToJson(userRegisterData);
    final response = await _client.post(path, data: jsonPostData);
    if (response.data != null) {
      success = signupSuccessModelFromJson(response.data);
    }
    return success;
  }
}

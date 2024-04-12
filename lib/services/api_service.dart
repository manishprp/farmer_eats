import 'package:dio/dio.dart';
import 'package:farmer_eats/model/datamodel/login_model.dart';
import 'package:farmer_eats/services/secure_storage.dart';
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

  Future<SignupSuccessModel?> loginUser(LoginModel userLoginModel) async {
    SignupSuccessModel? success;
    var path = "${Appstrings.baseUrl}${Appstrings.userLogin}";
    var jsonPostData = loginModelToJson(userLoginModel);
    var token = await GetIt.I<Store>().retrieveToken(Appstrings.tokenKey);
    final response = await _client.post(
      path,
      data: jsonPostData,
      // options: Options(headers: {"Authorization": "Bearer $token"}
      // )
    );
    if (response.data != null) {
      success = signupSuccessModelFromJson(response.data);
    }
    return success;
  }

  // return await _dio.post(
  //       url,
  //       data: data,
  //       options: Options(
  //         responseType: isResponseTypeBytes ? ResponseType.bytes : null,
  //         contentType: (isFormData != null && isFormData)
  //             ? ApiServiceConstants.contentType
  //             : null,
  //         headers: {
  //           ApiServiceConstants.authorization:
  //               '${ApiServiceConstants.bearer} $token',
  //         },
  //       ),
  //     );
}

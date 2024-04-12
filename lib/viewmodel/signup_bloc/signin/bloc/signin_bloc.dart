import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../constants/app_strings.dart';
import '../../../../model/datamodel/login_model.dart';
import '../../../../services/api_service.dart';
import '../../../../services/secure_storage.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  LoginModel login = LoginModel();
  var store = GetIt.I<Store>();
  SigninBloc() : super(SigninInitial()) {
    on<OnSignIn>((event, emit) async {
      var apiService = GetIt.I<ApiService>();
      emit(SigninLoading());
      try {
        var ans = await apiService.loginUser(login);
        if (ans != null) {
          store.storeToken(Appstrings.tokenKey, ans.token ?? "");
          emit(SigninSuccessful());
        }
      } catch (e) {
        emit(SigninFailed());
      } finally {
        emit(SigninInitial());
      }
    });
  }
  LoginModel get loginData => login;
}

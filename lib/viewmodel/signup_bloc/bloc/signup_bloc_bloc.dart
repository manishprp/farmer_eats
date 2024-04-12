import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/app_strings.dart';
import '../../../model/datamodel/register_model.dart';
import '../../../services/api_service.dart';
import '../../../services/secure_storage.dart';
part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBlocBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  RegisterModel user = RegisterModel();
  var store = GetIt.I<Store>();
  SignupBlocBloc() : super(SignupBlocInitial(user: RegisterModel())) {
    on<SignupBlocEvent>((event, emit) async {
      var apiService = GetIt.I<ApiService>();
      emit(SignupLoading());
      try {
        var ans = await apiService.registerUser(user);
        if (ans != null) {
          store.storeToken(Appstrings.tokenKey, ans.token ?? "");
          emit(SignupSuccess(token: ans.token ?? ""));
        }
      } catch (e) {
        emit(SignupFailed());
      } finally {
        emit(SignupBlocInitial(user: RegisterModel()));
      }
    });
  }
  RegisterModel get sharedObject => user;
}

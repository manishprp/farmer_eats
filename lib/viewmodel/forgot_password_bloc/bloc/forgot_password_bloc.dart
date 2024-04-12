import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../model/datamodel/forgot_password_model.dart';
import '../../../services/api_service.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordModel forrgotPassModel = ForgotPasswordModel();
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordSendCodeEvent>((event, emit) async {
      var apiService = GetIt.I<ApiService>();
      emit(ForgotPasswordLoading());
      try {
        var ans = await apiService.forgotPassword(forrgotPassModel);
        if (ans != null) {
          // store.storeToken(Appstrings.tokenKey, ans.token ?? "");
          emit(ForgotPasswordSuccess());
        }
      } catch (e) {
        emit(ForgotPasswordFailure());
      } finally {
        emit(ForgotPasswordInitial());
      }
    });
  }

  ForgotPasswordModel get forgotModel => forrgotPassModel;
}

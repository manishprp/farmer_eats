import 'package:equatable/equatable.dart';
import 'package:farmer_eats/model/datamodel/verify_otp_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../services/api_service.dart';

part 'OTP_verify_event.dart';
part 'OTP_verify_state.dart';

class OTPVerifyBLoc extends Bloc<OTPVerifyEvent, OTPVerifyState> {
  VerifyOtpModel otpVerifyModel = VerifyOtpModel();
  OTPVerifyBLoc() : super(OTPVerifyInitial()) {
    on<OTPVerifySendEvent>((event, emit) async {
      var apiService = GetIt.I<ApiService>();
      emit(OTPVerifyLoading());
      try {
        var ans = await apiService.verifyOtp(otpVerifyModel);
        if (ans != null) {
          // store.storeToken(Appstrings.tokenKey, ans.token ?? "");
          emit(OTPVerifySuccess());
        }
      } catch (e) {
        emit(OTPVerifydFailure());
      } finally {
        emit(OTPVerifyInitial());
      }
    });
  }

  VerifyOtpModel get otpVerifyModelShare => otpVerifyModel;
}

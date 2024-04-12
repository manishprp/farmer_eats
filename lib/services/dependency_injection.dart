import 'package:farmer_eats/services/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../model/repositories/forgotpassrepo/forgot_password_repo.dart';
import '../model/repositories/forgotpassrepo/i_forgot_password_repo.dart';
import '../model/repositories/signinuserrepo/i_sign_in_user_repo.dart';
import '../model/repositories/signinuserrepo/sign_in_user_repo.dart';
import '../model/repositories/signupuserrepo/i_signup_user_repo.dart';
import '../model/repositories/signupuserrepo/signup_user_repo.dart';
import '../viewmodel/signup_bloc/bloc/signup_bloc_bloc.dart';
import 'api_service.dart';
import 'file_picker.dart';
import 'secure_storage.dart';

import 'dart:async';
import 'package:cooking_recipes/features/auth/domain/use_case/get_user_by_id_use_case.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/app_font_weights.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/use_case/auth_use_case.dart';

part 'auth_state.dart';

enum AuthLoading {
  register,
  login,
  updatingInfo,
  forgetPassword,
  newPassword,
  resetPassword,
  updateBookmark,
  deleteAccount,
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._registerUserUseCase,
    this._updateUserFavouritesUseCase,
    this._deleteUserAccountUseCase,
    this._updateUserInfoUseCase,
    this._forgetPasswordUseCase,
    this._newPasswordUseCase,
    this._setLastLoginUseCase,
    this._setRememberMeUseCase,
    this._getRememberMeUseCase,
    this._getLastLoginUseCase,
    this._getLastUidUseCase,
    this._userNameAvailabilityUseCase,
    this._loginUseCase,
    this._getUserUseCase,
  ) : super(AuthInitial());
  final UpdateUserFavouritesUseCase _updateUserFavouritesUseCase;
  final UpdateUserInfoUseCase _updateUserInfoUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final NewPasswordUseCase _newPasswordUseCase;
  final SetLastLoginUseCase _setLastLoginUseCase;
  RegisterUserUseCase _registerUserUseCase;
  LoginUseCase _loginUseCase;
  GetUserByIdUseCase _getUserUseCase;
  final SetRememberMeUseCase _setRememberMeUseCase;
  final GetRememberMeUseCase _getRememberMeUseCase;
  final GetLastLoginUseCase _getLastLoginUseCase;
  final DeleteUserAccountUseCase _deleteUserAccountUseCase;
  final GetLastUidUseCase _getLastUidUseCase;
  final CheckUserNameAvailabilityUseCase _userNameAvailabilityUseCase;
  late UserEntity currentUser;
  int get userId => currentUser.id;
  String get userFavCountry => currentUser.area;
  String get userFavFoodType => currentUser.favFoodType;
  UserEntity get userData => currentUser;

  static AuthCubit get(context) => BlocProvider.of(context);
  signOut() async {
    emit(AuthInitial());
    try {
      await _setRememberMeUseCase.call(false);
    } catch (e) {}
  }

  saveRememberMeVal(bool rememberMe) async {
    try {
      await _setRememberMeUseCase.call(rememberMe);
    } catch (e) {}
  }

  Future<bool> get rememberMeVal async {
    bool remember = false;
    final res = await _getRememberMeUseCase.call(const NoParameters());
    res.fold((l) {
      remember = false;
    }, (r) {
      remember = true;
    });
    return remember;
  }

  setLastLoggedUID(int uid) async {
    try {
      await _setLastLoginUseCase.call(uid);
    } catch (e) {}
  }

  Future<int> get lastLoggedUID async {
    int loggedUID = -1;
    final res = await _getLastLoginUseCase.call(const NoParameters());
    res.fold((l) {
      loggedUID = -1;
    }, (r) {
      loggedUID = r;
    });
    return loggedUID;
  }

  Future<int> get lastUID async {
    int lastUID = -1;
    final res = await _getLastUidUseCase.call(const NoParameters());
    res.fold((l) {
      lastUID = -1;
    }, (r) {
      lastUID = r;
    });
    return lastUID;
  }

  loginUser() async {
    int loggedId = await lastLoggedUID;
    final res = await _getUserUseCase
        .call(GetUserParameter(byUID: true, uid: loggedId));
    res.fold((l) {
      saveRememberMeVal(false);
      emit(const AuthErrorState('Can\'t retrieve logged user info'));
    }, (r) {
      currentUser = r;
      emit(AuthCompletedState(currentUser));
    });
  }

  register({
    required String fullName,
    required String userName,
    required String password,
    required String recommendedCountry,
    required String favFoodType,
  }) async {
    emit(AuthLoadingState(loading: AuthLoading.register));

    int lastId = await lastUID;
    UserEntity newUser = UserEntity(
      area: recommendedCountry,
      name: fullName,
      username: userName,
      password: password,
      favFoodType: favFoodType,
      id: lastId + 1,
    );
    final res = await _registerUserUseCase.call(newUser);
    res.fold((l) {
      emit(AuthErrorState(l.message));
    }, (r) {
      currentUser = r;
      emit(AuthCompletedState(currentUser));
    });
  }

  login({required String username, required String password}) async {
    emit(AuthLoadingState(loading: AuthLoading.login));
    final res = await _loginUseCase
        .call(AuthParam(username: username, password: password));
    res.fold((l) {
      emit(AuthErrorState(l.message));
    }, (r) {
      currentUser = r;
      emit(AuthCompletedState(currentUser));
    });
  }

  static bool authForgetPasswordSuccess = false;
  forgetPassword({
    required String username,
    required String fullName,
  }) async {
    emit(AuthLoadingState(loading: AuthLoading.forgetPassword));
    final res = await _forgetPasswordUseCase
        .call(ForgetPasswordParameter(username: username, fullname: fullName));
    res.fold((l) => emit(AuthErrorState(l.toString())), (r) {
      authForgetPasswordSuccess = true;
      emit(AuthInitial());
    });
  }

  newPassword(
      {required String newPassword,
      required String fullName,
      required String username}) async {
    emit(AuthLoadingState(loading: AuthLoading.newPassword));
    final res = await _newPasswordUseCase.call(
        NewPasswordParameter(newPassword: newPassword, username: username));
    res.fold((l) {
      emit(AuthErrorState(l.message));
      emit(AuthInitial());
    }, (r) async {
      currentUser = r;
      emit(AuthCompletedState(currentUser));
    });
  }

  resetPassword(
      {required String newPassword,
      required String confirmPassword,
      required String oldPassword}) async {
    try {
      emit(AuthLoadingState(loading: AuthLoading.resetPassword));

      if (currentUser.password == oldPassword) {
        final res = await _newPasswordUseCase.call(NewPasswordParameter(
            username: currentUser.username, newPassword: newPassword));
        res.fold((l) {
          emit(AuthErrorState(l.message));
          emit(AuthCompletedState(currentUser));
        }, (r) async {
          currentUser.password = newPassword;

          emit(AuthPasswordResetSuccessState());
          emit(AuthCompletedState(currentUser));
        });
      } else {
        Fluttertoast.showToast(msg: 'Current password isn\'t correct');
      }
      emit(AuthCompletedState(currentUser));
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(), toastLength: Toast.LENGTH_SHORT);
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(), toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future editProfileInfo({
    required String fullName,
    required String userName,
    required String recommendedCountry,
    required String favFoodType,
  }) async {
    try {
      emit(AuthLoadingState(loading: AuthLoading.updatingInfo));

      final res = await _updateUserInfoUseCase.call(UserEntity(
        id: currentUser.id,
        favFoodType: favFoodType,
        area: recommendedCountry,
        name: fullName,
        username: userName,
        password: '',
      ));
      res.fold((error) {
        emit(AuthErrorState(error.message));
        emit(AuthCompletedState(currentUser));
      }, (user) async {
        currentUser = user;
        emit(AuthUserInfoUpdateSuccessState());
        emit(AuthCompletedState(currentUser));
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT, // length
      );
      emit(AuthCompletedState(currentUser));
    }
  }

  Future deleteUserInfo() async {
    emit(AuthLoadingState(loading: AuthLoading.deleteAccount));

    try {
      final res = await _deleteUserAccountUseCase.call(
          DeleteUserAccountParameter(
              username: currentUser.username,
              uid: currentUser.id,
              password: currentUser.password));
      res.fold((l) {
        emit(AuthErrorState(l.message));
        emit(AuthCompletedState(currentUser));
      }, (r) {
        emit(AuthUserDeletedSuccessState());
      });
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      emit(AuthCompletedState(currentUser));
    }
  }

  String? validateFullName(String? name) {
    if (name!.isEmpty) {
      return AppStrings.fullNameEmptyValidation;
    } else {
      return null;
    }
  }

  String? validatePreferredCountry(String? name) {
    if (name!.isEmpty) {
      return AppStrings.preferredEmptyValidation;
    } else {
      return null;
    }
  }

  String? validateUsername(String? username, bool fromLogin, bool? fromUpdate) {
    if (username!.isEmpty) {
      return AppStrings.usernameEmptyValidation;
    } else if (username.length < 6) {
      return AppStrings.usernameLengthValidation;
    } else {
      String? validationVal;
      if (!fromLogin) {
        if (fromUpdate == true && username == currentUser.username) {
        } else {
          final res = _userNameAvailabilityUseCase.call(username);

          res.fold((l) {
            validationVal = l.message;
          }, (r) {
            validationVal =
                r == true ? null : AppStrings.usernameNotAvailableValidation;
          });
        }
      }

      return validationVal;
    }
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return AppStrings.passwordEmptyValidation;
    } else if (password.length < 8) {
      return AppStrings.passwordLengthValidation;
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return AppStrings.confirmPasswordEmptyValidation;
    } else if (confirmPassword.length < 8) {
      return AppStrings.passwordLengthValidation;
    } else if (confirmPassword != password) {
      return AppStrings.passwordMatchValidation;
    } else {
      return null;
    }
  }
}

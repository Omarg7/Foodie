part of 'auth_cubit.dart';

abstract class AuthState  {
  const AuthState();
}

class AuthInitial extends AuthState {

}
class AuthFormChangingState extends AuthState {

}
class AuthFormChangedState extends AuthState {

}
class AuthUserDeletedSuccessState extends AuthState {

}
class AuthLoadingState extends AuthState {
final AuthLoading loading;
 AuthLoadingState({required this.loading});
}
class AuthUserBannedState extends AuthState {

}

class AuthCompletedState extends AuthState {
  final UserEntity currentUser;
  const AuthCompletedState(this.currentUser);

}
class AuthForgetPasswordSuccessState extends AuthState {


}
class AuthPasswordResetSuccessState extends AuthState {


}
class AuthUserInfoUpdateSuccessState extends AuthState {


}
class AuthErrorState extends AuthState {
  final String error;
  const AuthErrorState(this.error);

}


import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';




class LoginUseCase extends BaseFutureUseCase<UserEntity, AuthParam> {
  final IAuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(AuthParam parameters) async
  => await _authRepository.login(parameters);

}
class AuthParam{
  final String username;
  final String password;
  AuthParam({
    required this.username,
    required this.password,
});
}

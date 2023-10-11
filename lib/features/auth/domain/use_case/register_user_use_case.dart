import 'package:cooking_recipes/features/auth/data/model/user_model.dart';
import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

import '../repository/base_auth_repository.dart';

class RegisterUserUseCase extends BaseFutureUseCase<UserEntity, UserEntity> {
  final IAuthRepository _authRepository;

  RegisterUserUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity parameters) async
  => await _authRepository.registerUser(parameters);

}
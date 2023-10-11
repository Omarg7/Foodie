import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

import '../repository/base_auth_repository.dart';

class CheckUserNameAvailabilityUseCase extends BaseUseCase<bool, String> {
  final IAuthRepository _authRepository;

  CheckUserNameAvailabilityUseCase(this._authRepository);

  @override
  Either<Failure, bool> call(String parameters)
  =>  _authRepository.checkUsernameAvailability(parameters);

}
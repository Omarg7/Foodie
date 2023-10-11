import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class UpdateUserInfoUseCase extends BaseFutureUseCase<UserEntity, UserEntity> {
  final IAuthRepository baseAuthRepository;

  UpdateUserInfoUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity parameters) async {

    return await baseAuthRepository.updateUserInfo(parameters);
  }
}


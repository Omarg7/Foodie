import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class SetRememberMeUseCase extends BaseFutureUseCase<bool, bool> {
  final IAuthRepository baseAuthRepository;

  SetRememberMeUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, bool>> call(bool parameters) async {
    return await baseAuthRepository.setRememberMe(parameters);
  }
}


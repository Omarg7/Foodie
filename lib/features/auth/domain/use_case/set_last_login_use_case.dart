import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class SetLastLoginUseCase extends BaseFutureUseCase<bool, int> {
  final IAuthRepository baseAuthRepository;

  SetLastLoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, bool>> call(int parameters) async {
    return await baseAuthRepository.setLastLoginUid(parameters);
  }
}

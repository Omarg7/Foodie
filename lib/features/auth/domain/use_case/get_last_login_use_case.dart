import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class GetLastLoginUseCase extends BaseFutureUseCase<int, NoParameters> {
  final IAuthRepository baseAuthRepository;

  GetLastLoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, int>> call(NoParameters parameters) async {
    return await baseAuthRepository.getLastLoginUid();
  }
}



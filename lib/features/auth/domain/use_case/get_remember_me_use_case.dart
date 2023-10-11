import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class GetRememberMeUseCase extends BaseFutureUseCase<bool, NoParameters> {
  final IAuthRepository baseAuthRepository;

  GetRememberMeUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await baseAuthRepository.getRememberMe();
  }
}


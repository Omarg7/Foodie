import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class ForgetPasswordUseCase extends BaseFutureUseCase<bool, ForgetPasswordParameter> {
  final IAuthRepository baseAuthRepository;

  ForgetPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, bool>> call(ForgetPasswordParameter parameters) async {
    return await baseAuthRepository.forgetPassword(parameters);
  }
}

class ForgetPasswordParameter extends Equatable {
  final String username;
  final String fullname;
  const ForgetPasswordParameter({required this.username,required this.fullname});

  @override
  List<Object?> get props => [username,fullname];
}
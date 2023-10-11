import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class DeleteUserAccountUseCase extends BaseFutureUseCase<bool, DeleteUserAccountParameter> {
  final IAuthRepository baseAuthRepository;

  DeleteUserAccountUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteUserAccountParameter parameters) async {
    return await baseAuthRepository.deleteUserAccount(parameters);
  }
}

class DeleteUserAccountParameter extends Equatable {
  final String username;
  final String password;
  final int uid;
  const DeleteUserAccountParameter({required this.username,required this.uid,required this.password});

  @override
  List<Object?> get props => [username,uid];
}
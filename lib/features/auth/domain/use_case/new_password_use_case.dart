import 'package:cooking_recipes/features/auth/data/model/user_model.dart';
import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class NewPasswordUseCase extends BaseFutureUseCase<UserEntity, NewPasswordParameter> {
  final IAuthRepository baseAuthRepository;

  NewPasswordUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NewPasswordParameter parameters) async {
    return await baseAuthRepository.newPassword(parameters);
  }
}

class NewPasswordParameter extends Equatable {
  final String newPassword;
  final String  username;
  const NewPasswordParameter({required this.newPassword,required this.username});

  @override
  List<Object?> get props => [username,newPassword];
}
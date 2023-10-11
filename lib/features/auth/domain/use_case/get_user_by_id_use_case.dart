import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class GetUserByIdUseCase extends BaseFutureUseCase<UserEntity, GetUserParameter> {
  final IAuthRepository baseAuthRepository;

  GetUserByIdUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParameter parameters) async {
    return await baseAuthRepository.getUserInfo(parameters);
  }
}
class GetUserParameter{
  String? username;
  String? fullName;
  int? uid;
  bool byUID;
  GetUserParameter({required this.byUID, this.uid,this.username,this.fullName});
}

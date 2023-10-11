import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repository/base_auth_repository.dart';

class UpdateUserFavouritesUseCase extends BaseFutureUseCase<bool, UpdateUserFavouritesParameter> {
  final IAuthRepository baseAuthRepository;

  UpdateUserFavouritesUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, bool>> call(UpdateUserFavouritesParameter parameters) async {
    return await baseAuthRepository.updateUserFavourites(parameters);
  }
}

class UpdateUserFavouritesParameter extends Equatable {
  final List<int> favourites;
  final int uid;


  const UpdateUserFavouritesParameter({
    required this.favourites,

    required this.uid,

  });

  @override
  List<Object?> get props => [uid,];
}
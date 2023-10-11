import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../failure/failure.dart';

abstract class BaseFutureUseCase<T , Parameters>{
  Future<Either<Failure, T>> call(Parameters parameters);
}
abstract class StreamBaseUseCase<T , Parameters>{
  Stream<Either<Failure, T>> call(Parameters parameters);
}
abstract class BaseUseCase<T , Parameters>{
  Either<Failure, T> call(Parameters parameters);
}
class NoParameters extends Equatable{
  const NoParameters();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
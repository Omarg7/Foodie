import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';


abstract class IThemeRepository {
  Future<Either<Failure, bool>> changeTheme({required String theme});

  Future<Either<Failure, String>> getSavedTheme();
}
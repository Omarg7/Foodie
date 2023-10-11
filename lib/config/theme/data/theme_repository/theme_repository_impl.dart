import 'package:dartz/dartz.dart';


import '../../../../../core/failure/exceptions.dart';
import '../../../../../core/failure/failure.dart';

import '../../domain/theme_repository/base_theme_repository.dart';

import '../theme_cache/theme_cache.dart';

class ThemeRepositoryImpl implements IThemeRepository {
  final ThemeCacheImpl themeLocalDataSource;

  ThemeRepositoryImpl({required this.themeLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeTheme({required String theme}) async {
    try {
      final themeChanged =
      await themeLocalDataSource.changeTheme(theme: theme);
      return Right(themeChanged);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedTheme() async {
    try {
      final langCode = await themeLocalDataSource.getSavedTheme();
      return Right(langCode);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }


}
import 'package:cooking_recipes/config/theme/data/theme_repository/theme_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/use_case/base_use_case.dart';

import '../theme_repository/base_theme_repository.dart';

class ChangeThemeUseCase implements BaseFutureUseCase<bool, String> {
  final ThemeRepositoryImpl themeRepository;

  ChangeThemeUseCase({required this.themeRepository});

  @override
  Future<Either<Failure, bool>> call(String theme) async =>
      await themeRepository.changeTheme(theme: theme);
}
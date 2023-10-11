import 'package:cooking_recipes/config/theme/data/theme_repository/theme_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/use_case/base_use_case.dart';
import '../theme_repository/base_theme_repository.dart';
class GetSavedThemeUseCase implements BaseFutureUseCase<String, NoParameters> {
  final ThemeRepositoryImpl themeRepository;

  GetSavedThemeUseCase({required this.themeRepository});

  @override
  Future<Either<Failure, String>> call(NoParameters params) async =>
      await themeRepository.getSavedTheme();
}
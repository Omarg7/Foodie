import 'package:cooking_recipes/config/localization/localization.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/use_case/base_use_case.dart';
import '../repository/base_lang_repository.dart';

class ChangeLangUseCase implements BaseFutureUseCase<bool, String> {
  final LangRepositoryImpl langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}
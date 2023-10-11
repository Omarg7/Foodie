import 'package:cooking_recipes/config/localization/localization.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/use_case/base_use_case.dart';
import '../repository/base_lang_repository.dart';
class GetSavedLangUseCase implements BaseFutureUseCase<String, NoParameters> {
  final LangRepositoryImpl langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParameters params) async =>
      await langRepository.getSavedLang();
}
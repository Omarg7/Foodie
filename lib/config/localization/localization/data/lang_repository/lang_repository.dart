import 'package:dartz/dartz.dart';


import '../../../../../core/failure/exceptions.dart';
import '../../../../../core/failure/failure.dart';
import '../../domain/repository/base_lang_repository.dart';
import '../lang_cache/lang_cache.dart';

class LangRepositoryImpl implements ILangRepository {
  final LangCacheImpl langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
      await langLocalDataSource.changeLang(langCode: langCode);

      return Right(langIsChanged);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on ServiceExceptions catch(failure){
      return Left(ServiceFailure(failure.errorMessageModel.message));
    }
  }
}
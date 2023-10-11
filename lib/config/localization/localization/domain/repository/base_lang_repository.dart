import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';


abstract class ILangRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});

  Future<Either<Failure, String>> getSavedLang();
}
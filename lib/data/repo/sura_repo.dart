import 'package:dartz/dartz.dart';
import 'package:quran/data/models/surah.dart';
import 'package:quran/core/error/failure.dart';

abstract class SuraRepo {
  Future<Either<Failure, SurahModel>> getDetailSurah({required int noSurat});
}

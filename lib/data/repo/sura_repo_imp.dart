import 'package:dartz/dartz.dart';
import 'package:quran/data/models/surah.dart';
import 'package:quran/core/error/failure.dart';
import 'package:quran/data/repo/sura_repo.dart';
import 'package:quran/data/web_services/sura_services.dart';

class SuraRepoImp extends SuraRepo {
  final SuraWevServices suraWevServices;

  SuraRepoImp(this.suraWevServices);

  @override
  Future<Either<Failure, SurahModel>> getDetailSurah(
      {required int noSurat}) async {
    try {
      SurahModel surahModel = await suraWevServices.getSura(noSurat: noSurat);
      return Right(surahModel);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:equatable/equatable.dart';
import 'package:quran/data/models/surah.dart';
import 'package:quran/data/repo/sura_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  final SuraRepo suraRepo;
  SurahCubit(
    this.suraRepo,
  ) : super(SurahInitial());
  

  Future<void> getDetailSurah({required int noSurat}) async {
    emit(SuraLoading());
    final result = await suraRepo.getDetailSurah(noSurat: noSurat);
    result.fold(
      (failure) => emit(SuraFailure(failure.errMessage)),
      (surahModel) => emit(SuraLoaded(surahModel)),
    );
  }

  // Future<List<SurahModel>> getSurahList() async {
  //   String data = await rootBundle.loadString('assets/json/list-surah.json');

  //   return surahFromJson(data);
  // }

  Future<void> loadSurahData() async {
    try {
      String data = await rootBundle.loadString('assets/json/list-surah.json');
      List<SurahModel> surahList = surahFromJson(data);
      emit(SuraLoadedData(surahList));
    } catch (e) {
      emit(SuraFailure("Failed to load data: $e"));
    }
  }
}

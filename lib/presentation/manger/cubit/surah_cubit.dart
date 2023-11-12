import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:equatable/equatable.dart';
import 'package:quran/data/models/surah.dart';
import 'package:quran/data/repo/sura_repo.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  void searchCharacters(String query, List<SurahModel> allCharacters) {
    List<SurahModel> searchedCharacters = allCharacters
        .where((surahname) =>
            surahname.name.startsWith(query) ||
            surahname.name.toUpperCase().startsWith(query))
        .toList();
    emit(CharactersState(searchedCharacters: searchedCharacters));
  }

  Future<void> loadSurahData() async {
    try {
      String data = await rootBundle.loadString('assets/json/list-surah.json');
      List<SurahModel> surahList = surahFromJson(data);
      emit(SuraLoadedData(surahList));
    } catch (e) {
      emit(SuraFailure("Failed to load data: $e"));
    }
  }

  // Future<void> loadAyat() async {
  //   try {
  //       String data = await rootBundle.loadString('assets/json/list-surah.json');
  //     List<SurahModel> ayatList = surahFromJson(data);
  //     emit(AyaLoaded(ayatList.cast<Ayat>()));
  //   } catch (e) {
  //     emit(const AyaError('Failed to load Ayat.'));
  //   }
  // }
}

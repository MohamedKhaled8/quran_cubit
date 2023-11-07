// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'surah_cubit.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahInitial extends SurahState {}

class SuraLoading extends SurahState {}

class SuraLoaded extends SurahState {
  final SurahModel surahModel;

  const SuraLoaded(this.surahModel);
}

final class SuraFailure extends SurahState {
  final String errMessage;

  const SuraFailure(this.errMessage);
}

final class SuraLoadedData extends SurahState {
  final List<SurahModel> surahList;

  const SuraLoadedData(this.surahList);
}

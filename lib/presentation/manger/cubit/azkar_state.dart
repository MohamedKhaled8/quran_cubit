part of 'azkar_cubit.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}

class AzkarLoaded extends AzkarState {
  final List<SectionModel> sections;

  const AzkarLoaded(this.sections);
}

class AzkarError extends AzkarState {
  final String message;

  const AzkarError(this.message);
}

class AzkarSectionDetailLoaded extends AzkarState {
  final List<SectionDetailModel> sectionDetails;

  const AzkarSectionDetailLoaded(this.sectionDetails);
}

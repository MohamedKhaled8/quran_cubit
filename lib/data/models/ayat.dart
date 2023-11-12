import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Ayat extends Equatable {
  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
    this.isBookmarked,
  });

  final int id;
  final int surah;
  final int nomor;
  final String ar;
  final String tr;
  final String idn;
  bool? isBookmarked;
  @override
  List<Object?> get props => [id, surah, nomor, ar, tr, idn, isBookmarked];

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
        isBookmarked: json["isBookmarked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
        "isBookmarked": isBookmarked,
      };
}

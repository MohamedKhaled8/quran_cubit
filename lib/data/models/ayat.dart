import 'package:equatable/equatable.dart';

class Ayat extends Equatable {
  const Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  final int id;
  final int surah;
  final int nomor;
  final String ar;
  final String tr;
  final String idn;

  @override
  List<Object?> get props => [id, surah, nomor, ar, tr, idn];

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

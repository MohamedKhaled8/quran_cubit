import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:quran/data/models/ayat.dart';

List<SurahModel> surahFromJson(String str) =>
    List<SurahModel>.from(json.decode(str).map((x) => SurahModel.fromJson(x)));

String surahToJson(List<SurahModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahModel extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final TempatTurun tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;
  final List<Ayat>? ayat;

  const SurahModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    this.ayat,
  });

  @override
  List<Object?> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
        tempatTurun,
        arti,
        deskripsi,
        audio,
        ayat,
      ];

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: tempatTurunValues.map[json["tempat_turun"]]!,
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        ayat: json.containsKey('ayat')
            ? List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "ayat": ayat != null
            ? List<dynamic>.from(ayat!.map((e) => e.toJson()))
            : [],
      };
}

// ignore: constant_identifier_names
enum TempatTurun { MEKAH, MADINAH }

final tempatTurunValues =
    EnumValues({"madinah": TempatTurun.MADINAH, "mekah": TempatTurun.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap;
  }
}

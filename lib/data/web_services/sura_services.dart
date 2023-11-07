import 'package:dio/dio.dart';
import 'package:quran/data/models/surah.dart';
import 'package:quran/core/services/api_services.dart';

class SuraWevServices {
  final ApiService apiService;

  SuraWevServices(this.apiService);

  Future<SurahModel> getSura({required int noSurat}) async {
    Response response =
        await apiService.get(url: "https://equran.id/api/surat/$noSurat");
    var suraModel = SurahModel.fromJson(response.data);
    return suraModel;
  }
  
}
//    var suraModel = SurahModel.fromJson(json.decode(response.toString()));


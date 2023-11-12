import 'package:get_it/get_it.dart';
import 'package:quran/data/repo/sura_repo_imp.dart';
import 'package:quran/core/services/api_services.dart';
import 'package:quran/data/web_services/sura_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<SuraWevServices>(SuraWevServices(ApiService()));
  getIt.registerSingleton<SuraRepoImp>(
      SuraRepoImp(getIt.get<SuraWevServices>()));
}

import 'package:flutter/material.dart';
import '../../manger/cubit/surah_cubit.dart';
import 'package:quran/data/models/surah.dart';
import '../../../data/repo/sura_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/api_services.dart';
import '../../../data/web_services/sura_services.dart';
import 'package:quran/presentation/view/detail_view/detail_screen.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_text_aya_display.dart';

class CustomSuraItem extends StatelessWidget {
  final SurahModel surah;
  const CustomSuraItem({
    Key? key,
    required this.surah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      SurahCubit(SuraRepoImp(SuraWevServices(ApiService()))),
                  child: DetailScreen(
                    noSurat: surah.nomor,
                    errorMessage: '',
                  ),
                )));
      },
      child: CustomTextAyaDisplay(
        surah: surah,
      ),
    );
  }
}

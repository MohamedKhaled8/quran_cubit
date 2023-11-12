import 'package:flutter/material.dart';
import 'package:quran/data/models/surah.dart';
import '../../../data/repo/sura_repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/manger/cubit/surah_cubit.dart';
import 'package:quran/core/helper/db_injection/db-inject_services_locate.dart';
import 'package:quran/presentation/widgets/detail_screen_widgets/custom_aya_items.dart';
import 'package:quran/presentation/widgets/detail_screen_widgets/custom_detailes_sura.dart';

class CustomSuccesState extends StatelessWidget {
  final SurahModel surah;
  final int noSurat;

  const CustomSuccesState({
    Key? key,
    required this.surah,
    required this.noSurat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: CustomDetailesSura(surah: surah),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        child: ListView.separated(
          itemBuilder: (context, index) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SurahCubit(
                  getIt.get<SuraRepoImp>(),
                ),
              ),
            ],
            child: CustomAyaItems(
              ayat: surah.ayat!.elementAt(index + (noSurat == 1 ? 1 : 0)),
            ),
          ),
          itemCount: surah.jumlahAyat + (noSurat == 1 ? -1 : 0),
          separatorBuilder: (context, index) => Container(),
        ),
      ),
    );
  }
}

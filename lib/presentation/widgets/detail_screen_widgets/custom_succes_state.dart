import 'package:flutter/material.dart';
import 'package:quran/data/models/surah.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.separated(
          itemBuilder: (context, index) => CustomAyaItems(
            ayat: surah.ayat!.elementAt(index + (noSurat == 1 ? 1 : 0)),
          ),
          itemCount: surah.jumlahAyat + (noSurat == 1 ? -1 : 0),
          separatorBuilder: (context, index) => Container(),
        ),
      ),
    );
  }
}

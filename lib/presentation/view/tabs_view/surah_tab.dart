import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/presentation/manger/cubit/surah_cubit.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_sura_items.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SurahCubit>(context).loadSurahData();
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SuraLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuraLoadedData) {
          return ListView.separated(
            itemBuilder: (context, index) => CustomSuraItem(
              surah: state.surahList[index],
            ),
            separatorBuilder: (context, index) =>
                Divider(color: const Color(0xFF7B80AD).withOpacity(.35)),
            itemCount: state.surahList.length,
          );
        } else if (state is SuraFailure) {
          return Center(child: Text('Error: ${state.errMessage}'));
        } else {
          return const Center(child: Text('Unexpected State'));
        }
      },
    );
  }
}

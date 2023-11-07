import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/core/function/app_bar.dart';
import 'package:quran/presentation/manger/cubit/surah_cubit.dart';
import 'package:quran/presentation/widgets/detail_screen_widgets/custom_loading.dart';
import 'package:quran/presentation/widgets/detail_screen_widgets/custom_error_state.dart';
import 'package:quran/presentation/widgets/detail_screen_widgets/custom_succes_state.dart';

class DetailScreen extends StatelessWidget {
  final int noSurat;
  final String errorMessage;
  const DetailScreen({
    super.key,
    required this.noSurat,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SurahCubit>(context).getDetailSurah(noSurat: noSurat);
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBarr.buildAppBar(),
      body: BlocBuilder<SurahCubit, SurahState>(
        builder: (context, state) {
          if (state is SuraLoading) {
            return const CustomLoading();
          } else if (state is SuraLoaded) {
            return CustomSuccesState(
              noSurat: noSurat,
              surah: state.surahModel,
            );
          } else if (state is SuraFailure) {
            return CustomErrorState(
              errorMessage: errorMessage,
            );
          } else {
            return const CustomErrorState(
              errorMessage: 'Unexpected State',
            );
          }
        },
      ),
    );
  }
}

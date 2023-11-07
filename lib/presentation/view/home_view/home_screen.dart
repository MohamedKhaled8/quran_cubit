import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/core/function/app_bar.dart';
import 'package:quran/data/repo/sura_repo_imp.dart';
import 'package:quran/core/services/api_services.dart';
import 'package:quran/data/web_services/sura_services.dart';
import 'package:quran/presentation/manger/cubit/surah_cubit.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_drower.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final advencedDroweController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SurahCubit(SuraRepoImp(SuraWevServices(ApiService()))),
      child: AdvancedDrawer(
        openRatio: 0.50,
        // openScale: 0.25,
        animationCurve: Curves.easeInOut,
        controller: advencedDroweController,
        backdropColor: ColorsApp.background,
        drawer: const CustomDrower(),
        child: Scaffold(
          appBar: AppBarr.buildAppBar(
              advencedDroweController: advencedDroweController),
          backgroundColor: ColorsApp.background,
          body: const CustomHomeScreenBody(),
        ),
      ),
    );
  }
}

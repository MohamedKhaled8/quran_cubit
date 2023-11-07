import 'package:flutter/material.dart';
import '../../view/tabs_view/page_tab.dart';
import '../../view/tabs_view/para_tab.dart';
import '../../view/tabs_view/surah_tab.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/view/tabs_view/hijb_tab.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_greting.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_tab_bar.dart';

class CustomHomeScreenBody extends StatelessWidget {
  const CustomHomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverToBoxAdapter(
                    child: CustomGreeting(),
                  ),
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    backgroundColor: ColorsApp.background,
                    automaticallyImplyLeading: false,
                    shape: Border(
                        bottom: BorderSide(
                            width: 3.w,
                            color: const Color(0xFFAAAAAA).withOpacity(.1))),
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: CustomTapBar(),
                    ),
                  )
                ],
            body: const TabBarView(
                children: [SurahTab(), ParaTab(), PageTab(), HijbTab()])),
      ),
    );
  }
}

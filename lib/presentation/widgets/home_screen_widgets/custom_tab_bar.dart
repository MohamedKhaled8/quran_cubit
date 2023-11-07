import 'package:flutter/material.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_tab_irems.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        unselectedLabelColor: ColorsApp.text,
        labelColor: Colors.white,
        indicatorColor: ColorsApp.primary,
        indicatorWeight: 3,
        tabs: const [
          CustomTabItems(label: "Surah"),
          CustomTabItems(label: "Para"),
          CustomTabItems(label: "Page"),
          CustomTabItems(label: "Hijb"),
        ]);
  }
}

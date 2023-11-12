import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/manger/cubit/azkar_cubit.dart';
import 'package:quran/presentation/widgets/azqr_screen_widgets/custom_azkar_body.dart';

class AzqarSceeen extends StatelessWidget {
  const AzqarSceeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ColorsApp.background,
        centerTitle: true,
        title: Container(
          width: 200.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorsApp.primary)),
          child: Center(
            child: Text(
              "أَذْكَارُ اَلْمُسْلِمِ",
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AzkarCubit()..loadSections(context),
        child: const CustomAzkarBody(),
      ),
    );
  }
}

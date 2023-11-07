import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/widgets/splash_screen_widgets/custom_botton_splash_view.dart';

class CustomStackBody extends StatelessWidget {
  const CustomStackBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 400.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: const Color(0xFF672CBC)),
          child: SvgPicture.asset('assets/svgs/splash.svg'),
        ),
        const CustomButtonSplashView()
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/widgets/splash_screen_widgets/custom_stack_body.dart';

class CustomSplashScreenBody extends StatelessWidget {
  const CustomSplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).r,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Quran App',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Learn Quran and\nRecite once everyday',
                style:
                    GoogleFonts.poppins(fontSize: 18.sp, color: ColorsApp.text),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 48.h,
              ),
              const CustomStackBody()
            ]),
      ),
    );
  }
}

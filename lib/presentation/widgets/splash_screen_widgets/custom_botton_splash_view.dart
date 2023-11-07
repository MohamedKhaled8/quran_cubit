import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/widgets/bottom_nav_bar_widgets/custom_bottom_nav_bar.dart';

class CustomButtonSplashView extends StatelessWidget {
  const CustomButtonSplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.w,
      bottom: -23.h,
      right: 0.w,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CustomBottomNavBar(),
            ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16).r,
            decoration: BoxDecoration(
                color: ColorsApp.orange,
                borderRadius: BorderRadius.circular(30).r),
            child: Text(
              'Get Started',
              style: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

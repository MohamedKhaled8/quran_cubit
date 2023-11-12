import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/widgets/home_screen_widgets/custom_last_read.dart';

class CustomGreeting extends StatelessWidget {
  const CustomGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'اٌلِـسُلِـاٌمِـ عٍلِـيٌـكُمِـ وِرُحٍمِـةُ اٌلِـلِـهٌ وِبّـرُكُاٌتْهٌ',
            style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: ColorsApp.text),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        const CustomLastRead(),
      ],
    );
  }
}

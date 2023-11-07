import 'package:flutter/material.dart';
import 'package:quran/data/models/ayat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAyaItems extends StatelessWidget {
  final Ayat ayat;
  const CustomAyaItems({
    Key? key,
    required this.ayat,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10).r,
            decoration: BoxDecoration(
                color: ColorsApp.gray,
                borderRadius: BorderRadius.circular(10).r),
            child: Row(
              children: [
                Container(
                  width: 27.w,
                  height: 27.h,
                  decoration: BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius: BorderRadius.circular(27 / 2).r),
                  child: Center(
                      child: Text(
                    '${ayat.nomor}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
                ),
                const Spacer(),
                const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16.w,
                ),
                const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16.w,
                ),
                const Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            ayat.ar,
            style: GoogleFonts.amiri(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            ayat.idn,
            style: GoogleFonts.poppins(color: ColorsApp.text, fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}

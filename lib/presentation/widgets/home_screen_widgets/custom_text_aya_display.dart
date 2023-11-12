import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/data/models/surah.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/core/constant/font_size_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextAyaDisplay extends StatelessWidget {
  const CustomTextAyaDisplay({
    Key? key,
    required this.surah,
  }) : super(key: key);

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16).r,
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset('assets/svgs/nomor-surah.svg'),
              SizedBox(
                height: 36,
                width: 36,
                child: Center(
                    child: Text(
                  "${surah.nomor}",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
              )
            ],
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surah.namaLatin,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Text(
                    surah.tempatTurun.name,
                    style: GoogleFonts.poppins(
                        color: ColorsApp.text,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: 4.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: ColorsApp.text),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${surah.jumlahAyat} Ayat",
                    style: GoogleFonts.poppins(
                        color: ColorsApp.text,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp),
                  ),
                ],
              )
            ],
          )),
          Text(
            surah.name,
            style: GoogleFonts.amiri(
                color: ColorsApp.primary,
                fontSize: FontSizeApp.arabicFontSize,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

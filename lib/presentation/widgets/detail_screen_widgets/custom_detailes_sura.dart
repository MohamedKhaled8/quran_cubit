import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/data/models/surah.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDetailesSura extends StatelessWidget {
  final SurahModel surah;
  const CustomDetailesSura({
    Key? key,
    required this.surah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).r,
      child: Stack(children: [
        Container(
          height: 257.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).r,
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    .6,
                    1
                  ],
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFFB070FD),
                    Color(0xFF9055FF)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
                opacity: .2,
                child: SvgPicture.asset(
                  'assets/svgs/quran.svg',
                  width: 324 - 55.w,
                ))),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28).r,
          child: Column(
            children: [
              Text(
                surah.namaLatin,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 26.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                surah.arti,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp),
              ),
              Divider(
                color: Colors.white.withOpacity(.35),
                thickness: 2,
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surah.tempatTurun.name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Container(
                    width: 4.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2).r,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${surah.jumlahAyat} Ayat",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              SvgPicture.asset('assets/svgs/bismillah.svg')
            ],
          ),
        )
      ]),
    );
  }
}

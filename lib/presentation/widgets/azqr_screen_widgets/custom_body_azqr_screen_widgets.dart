import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/data/models/start_screen_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBodyAzqrScreen extends StatelessWidget {
  const CustomBodyAzqrScreen({Key? key}) : super(key: key);

  String getHijriDate() {
    final HijriCalendar _today = HijriCalendar.now();
    final String hijriDate = '${_today.hYear}-${_today.hMonth}-${_today.hDay}';
    return hijriDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Container(
            width: 330.w,
            height: 60.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorsApp.primary)),
            child: Center(
              child: Text(
                'التاريخ الهجري: ه${getHijriDate()} ',
                style: TextStyle(fontSize: 22.sp, color: Colors.white),
              ),
            )),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(16).w,
                padding: const EdgeInsets.symmetric(horizontal: 10).w,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0, .6, 1],
                    colors: [
                      Color(0xFFDF98FA),
                      Color(0xFFB070FD),
                      Color(0xFF9055FF)
                    ],
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300.w,
                height: 60.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      startScreenModel[index].name,
                      style: TextStyle(fontSize: 26.sp, color: Colors.black),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

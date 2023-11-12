import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/core/constant/font_size_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/helper/db_helper/shard_prefs.dart';
import 'package:quran/presentation/view/home_view/home_screen.dart';
import 'package:quran/presentation/widgets/slider_widgets/custom_slider.dart';
import 'package:quran/presentation/widgets/slider_widgets/custom_buttom_repet_slider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: ColorsApp.background,
        appBar: AppBar(
          title: const Text(
            "Settings",
          ),
          backgroundColor: ColorsApp.background,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Arabic Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  CustomSlider(
                    max: 40,
                    min: 20,
                    onChanged: (value) {
                      setState(() {
                        FontSizeApp.arabicFontSize = value;
                      });
                    },
                    value: FontSizeApp.arabicFontSize,
                  ),
                  Text(
                    'اٌلِـسُلِـاٌمِـ عٍلِـيٌـكُمِـ وِرُحٍمِـةُ اٌلِـلِـهٌ وِبّـرُكُاٌتْهٌ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      fontSize: FontSizeApp.arabicFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: const Divider(),
                  ),
                  Text(
                    'Mushaf Mode Font Size:',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  CustomSlider(
                    max: 50,
                    min: 20,
                    onChanged: (value) {
                      setState(() {
                        FontSizeApp.mushafFontSize = value;
                      });
                    },
                    value: FontSizeApp.mushafFontSize,
                  ),
                  Text(
                    'اٌلِـسُلِـاٌمِـ عٍلِـيٌـكُمِـ وِرُحٍمِـةُ اٌلِـلِـهٌ وِبّـرُكُاٌتْهٌ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      fontSize: FontSizeApp.mushafFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButtonReperSlider(
                        height: 40,
                        text: 'Reset',
                        width: 150,
                        onPressed: () {
                          setState(() {
                            FontSizeApp.arabicFontSize = 22;
                            FontSizeApp.mushafFontSize = 22;
                          });
                          DBHelper.saveSettings();
                        },
                      ),
                      CustomButtonReperSlider(
                        height: 40,
                        text: 'Save',
                        width: 150,
                        onPressed: () {
                          DBHelper.saveSettings();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//40 //150

import 'package:flutter/material.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonReperSlider extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final void Function()? onPressed;
  const CustomButtonReperSlider({
    Key? key,
    required this.height,
    required this.onPressed,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsApp.primary,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.white,
            ),
          )),
    );
  }
}

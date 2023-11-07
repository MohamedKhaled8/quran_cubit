import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomTabItems extends StatelessWidget {
  final String label;
  const CustomTabItems({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style:
            GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}

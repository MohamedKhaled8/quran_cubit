import 'package:flutter/material.dart';
import 'package:quran/data/models/section_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/view/azrq_view/section_detailed_screen.dart';

class CustomSectionItems extends StatelessWidget {
  final SectionModel model;
  const CustomSectionItems({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionDetailScreen(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0).r,
        width: double.infinity,
        height: 70.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFDF98FA),
                  Color(0xFFB070FD),
                  Color(0xFF9055FF)
                ])),
        child: Center(
            child: Text(
          "${model.name}",
          style: TextStyle(
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}

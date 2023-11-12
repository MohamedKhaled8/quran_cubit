import 'package:flutter/material.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/presentation/widgets/azqr_screen_widgets/custom_section_detail_screen_body_widget.dart';

class SectionDetailScreen extends StatelessWidget {
  final int id;
  final String title;
  const SectionDetailScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: ColorsApp.background,
        title: Text(title),
      ),
      body: CustomSectionDetailScreenBody(id: id),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/manger/cubit/azkar_cubit.dart';
import 'package:quran/presentation/widgets/azqr_screen_widgets/custom_section_items.dart';
import 'package:quran/presentation/widgets/custom_circular_progressIndicator_widgets/custom_circular_progressIndicator.dart';

class CustomAzkarBody extends StatelessWidget {
  const CustomAzkarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is AzkarLoaded) {
          return Padding(
            padding: const EdgeInsets.all(12.0).r,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  CustomSectionItems(model: state.sections[index]),
              itemCount: state.sections.length,
            ),
          );
        } else if (state is AzkarError) {
          return Center(
            child: Text(
              "Error loading sections: ${state.message}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          // Loading state or initial state
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}

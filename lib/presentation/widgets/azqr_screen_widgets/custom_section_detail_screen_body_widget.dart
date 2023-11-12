import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/manger/cubit/azkar_cubit.dart';
import 'package:quran/presentation/widgets/custom_circular_progressIndicator_widgets/custom_circular_progressIndicator.dart';

class CustomSectionDetailScreenBody extends StatelessWidget {
  const CustomSectionDetailScreenBody({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(),
      child: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if (state is AzkarSectionDetailLoaded) {
            return Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorsApp.primary),
                      ),
                      child: ListTile(
                        title: Text(
                          "${state.sectionDetails[index].reference}",
                          textDirection: TextDirection.rtl,
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.white),
                        ),
                        subtitle: Text(
                          "${state.sectionDetails[index].content}",
                          textDirection: TextDirection.rtl,
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.white),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1.h,
                    endIndent: 10.w,
                    indent: 10.w,
                    color: Colors.grey.withOpacity(.8),
                  ),
                  itemCount: state.sectionDetails.length,
                ),
              ),
            );
          } else {
            BlocProvider.of<AzkarCubit>(context).loadSectionDetail(context, id);
            return const CustomCircularProgressIndicator();
          }
        },
      ),
    );
  }
}

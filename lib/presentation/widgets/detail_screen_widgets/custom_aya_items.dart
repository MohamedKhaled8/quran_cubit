import 'package:flutter/material.dart';
import 'package:quran/data/models/ayat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/core/constant/font_size_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAyaItems extends StatefulWidget {
  final Ayat? ayat;

  const CustomAyaItems({
    Key? key,
    required this.ayat,
  }) : super(key: key);

  @override
  State<CustomAyaItems> createState() => _CustomAyaItemsState();
}

class _CustomAyaItemsState extends State<CustomAyaItems> {
  late SharedPreferences _prefs;
  // late BookMarkCubit bookmarkCubit;
  bool isBookmarked = false;

  @override
  void initState() {
    // bookmarkCubit = BlocProvider.of<BookMarkCubit>(context);
    // if (widget.ayat != null) {
    //   bookmarkCubit.checkBookmarked(widget.ayat!);
    // }
    super.initState();
  }

  Future<void> _toggleBookmark() async {
    String bookmarkKey =
        'isBookmarked${widget.ayat!.surah}-${widget.ayat!.nomor}';
    bool newBookmarkValue = !(_prefs.getBool(bookmarkKey) ?? false);

    // await bookmarkCubit.updateBookmark(widget.ayat!, newBookmarkValue);

    setState(() {
      isBookmarked = newBookmarkValue;
      _prefs.setBool(bookmarkKey, newBookmarkValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final appProvider = Provider.of<AppProvider>(context);
    // final bookmarkCubit = BookMarkCubit.cubit(context);

    return Padding(
      padding: const EdgeInsets.only(top: 24).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10).r,
            decoration: BoxDecoration(
              color: ColorsApp.gray,
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Row(
              children: [
                Container(
                  width: 27.w,
                  height: 27.h,
                  decoration: BoxDecoration(
                    color: ColorsApp.primary,
                    borderRadius: BorderRadius.circular(27 / 2).r,
                  ),
                  child: Center(
                    child: Text(
                      '${widget.ayat!.nomor}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 16.w,
                ),
                // if (widget.ayat != null)
                //   BlocListener<BookMarkCubit, BookMarkState>(
                //     listener: (context, state) {
                //       setState(() {
                //         isBookmarked = state.isBookmarked ?? false;
                //       });
                //     },
                //     child: IconButton(
                //       onPressed: () {
                //         if (bookmarkCubit.state.isBookmarked!) {
                //           bookmarkCubit.updateBookmark(widget.ayat!, false);
                //         } else {
                //           bookmarkCubit.updateBookmark(widget.ayat!, true);
                //         }
                //         _toggleBookmark(); // If needed
                //       },
                //       icon: Icon(
                //         bookmarkCubit.state.isBookmarked!
                //             ? Icons.bookmark_added
                //             : Icons.bookmark_add_outlined,
                //         color: isBookmarked ? Colors.red : Colors.white,
                //         size: 22.h,
                //       ),
                //     ),
                //   ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            widget.ayat!.ar ?? '',
            style: GoogleFonts.amiri(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: FontSizeApp.arabicFontSize,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            widget.ayat!.idn ?? '',
            style: GoogleFonts.poppins(
              color: ColorsApp.text,
              fontSize: FontSizeApp.englishFontSize,
            ),
          ),
        ],
      ),
    );
  }
}

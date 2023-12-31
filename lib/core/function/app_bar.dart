import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/data/models/surah.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class AppBarr {
  static AppBar buildTwoAppBar(
          {required BuildContext context, required SurahModel surah}) =>
      AppBar(
        backgroundColor: ColorsApp.background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
              onPressed: (() => Navigator.of(context).pop()),
              icon: SvgPicture.asset('assets/svgs/back-icon.svg')),
          SizedBox(
            width: 24.w,
          ),
          Text(
            surah.namaLatin,
            style: GoogleFonts.poppins(
                fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
        ]),
      );
  static AppBar buildAppBar({
    final String? title,
    String query = '',
    bool isSearching = false,
    AdvancedDrawerController? advencedDroweController,
    required BuildContext context,
    required List<SurahModel> allCharacters,
  }) {
    return AppBar(
      backgroundColor: ColorsApp.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(children: [
        SizedBox(
          width: 40.w,
        ),
        Text(
          'Quran App',
          style:
              GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              // CustomSearchField(
              //   allCharacters: allCharacters,
              // );
            },
            icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
      ]),
      leading: IconButton(
        onPressed: () {
          drowerController(advencedDroweController: advencedDroweController!);
        },
        icon: SvgPicture.asset(
          'assets/svgs/menu-icon.svg',
          // ignore: deprecated_member_use
          color: Colors.white,
        ),
      ),
    );
  }
}

void drowerController(
    {required AdvancedDrawerController advencedDroweController}) {
  advencedDroweController.showDrawer();
}

// class CustomSearchField extends StatelessWidget {
//   List<SurahModel> allCharacters;
//   CustomSearchField({
//     Key? key,
//     required this.allCharacters,
//   }) : super(key: key);
//   final String query = '';

//   final _searchTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _searchTextController,
//       decoration: const InputDecoration(
//         hintText: 'Find a character...',
//         border: InputBorder.none,
//         hintStyle: TextStyle(fontSize: 18),
//       ),
//       style: const TextStyle(fontSize: 18),
//       onChanged: (searchedCharacter) {
//         BlocProvider.of<SurahCubit>(context)
//             .searchCharacters(query, allCharacters);
//       },
//     );
//   }
// }
// List<Widget> _buildAppBarActions() {
//     if (_isSearching) {
//       return [
//         IconButton(
//           onPressed: () {
//             _clearSearch();
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.clear, color: MyColors.myGrey),
//         ),
//       ];
//     } else {
//       return [
//         IconButton(
//           onPressed: _startSearch,
//           icon: const Icon(
//             Icons.search,
//             color: Colors.myGrey,
//           ),
//         ),
//       ];
//     }
//   }
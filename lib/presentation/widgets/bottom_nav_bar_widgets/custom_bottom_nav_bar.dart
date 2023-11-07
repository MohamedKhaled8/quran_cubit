import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/core/constant/colors.dart';
import 'package:quran/presentation/view/doa_view/doa_view.dart';
import 'package:quran/presentation/view/tips_view/tips_view.dart';
import 'package:quran/presentation/view/home_view/home_screen.dart';
import 'package:quran/presentation/view/prayer_view/prayer_view.dart';
import 'package:quran/presentation/view/book_mark_view/book_mark_view.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  List<Widget> pages = [
    const HomeScreen(),
    const DoaScreen(),
    const PrayerScreen(),
    const TipsScreen(),
    const BookmarkScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          if (value < pages.length) {
            setState(() {
              currentIndex = value;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsApp.gray,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
          _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
          _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
          _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
          _bottomBarItem(
              icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _bottomBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: ColorsApp.text,
      ),
      activeIcon: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: ColorsApp.primary,
      ),
      label: label,
    );

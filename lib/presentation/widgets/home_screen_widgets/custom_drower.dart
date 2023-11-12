import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quran/core/constant/my_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/presentation/view/home_view/home_screen.dart';
import 'package:quran/presentation/view/seeting_view/setting_view.dart';

class CustomDrower extends StatelessWidget {
  const CustomDrower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/png/quran.png',
                        height: 85.h,
                      ),
                      Text(
                        'Al Quran',
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SettingsScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share, color: Colors.white),
                  title: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Share.share(
                      '''*Quran app*\n
u can develop it from my github github.com/itsherifahmed ''',
                    );
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.rate_review, color: Colors.white),
                  title: const Text(
                    'Rate',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    if (!await launchUrl(quranAppurl,
                        mode: LaunchMode.externalApplication)) {
                      throw 'Could not launch $quranAppurl';
                    }
                  },
                ),
              ],
            )));
  }
}

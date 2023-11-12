import 'package:quran/core/constant/font_size_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
 static  Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', FontSizeApp.arabicFontSize.toInt());
  await prefs.setInt('mushafFontSize', FontSizeApp.mushafFontSize.toInt());
}

static Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    FontSizeApp.arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
    FontSizeApp.mushafFontSize = await prefs.getInt('mushafFontSize')!.toDouble();
  } catch (_) {
   FontSizeApp. arabicFontSize = 28;
   FontSizeApp. mushafFontSize = 40;
  }
}


}
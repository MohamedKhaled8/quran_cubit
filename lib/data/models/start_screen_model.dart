// ignore_for_file: public_member_api_docs, sort_constructors_first
class StartScreenModel {
  final String image;
  final String name;
  final void Function()? onTap;
  StartScreenModel({
    required this.image,
    required this.name,
    this.onTap,
  });
}

final List<StartScreenModel> startScreenModel = [
  StartScreenModel(
      image: "assets/png/pngwing.com.png", name: "مَوَاقِيت اَلصَّلَاةِ"),
  StartScreenModel(
      image: "assets/svgs/quran.svg", name: "اَلْقُرْآن اَلْكَرِيمِ"),
  StartScreenModel(
      image: "assets/png/—Pngtree—green rosary icon cartoon style_5268137.png",
      name: "اَلْمِسْبَحَةُ"),
  StartScreenModel(
      image: "assets/png/pngegg.png", name: "اَلْأَحَادِيث اَلنَّبَوِيَّةِ"),
  StartScreenModel(image: "assets/png/pngegg (1).png", name: "اَلْقُبْلَةُ"),
  StartScreenModel(
      image:
          "assets/png/png-clipart-computer-icons-praying-hands-quran-2012-prayer-quraan-karem-angle-leaf.png",
      name: "أَدْعِيَة وَأَذْكَارٍ" ,  
      onTap: () {
        
      },
      ),
];

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ayah extends StatelessWidget {
  const Ayah({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 25.0),
                child: Text(
                  'Ayat Kursi (Dibaca 1x)'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'اللّٰهُ لَاۤ اِلٰهَ اِلَّا هُوَ الْحَـيُّ الْقَيُّوْمُ ۚ لَا تَأْخُذُهٗ سِنَةٌ وَّلَا نَوْمٌ ۗ لَهٗ مَا فِى السَّمٰوٰتِ وَمَا فِى الْاَ رْضِ ۗ مَنْ ذَا الَّذِيْ يَشْفَعُ عِنْدَهٗۤ اِلَّا بِاِ ذْنِهٖ ۗ يَعْلَمُ مَا بَيْنَ اَيْدِيْهِمْ وَمَا خَلْفَهُمْ ۚ وَلَا يُحِيْطُوْنَ بِشَيْءٍ مِّنْ عِلْمِهٖۤ اِلَّا بِمَا شَآءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمٰوٰتِ وَا لْاَ رْضَ ۚ وَلَا يَــئُوْدُهٗ حِفْظُهُمَا ۚ وَ هُوَ الْعَلِيُّ الْعَظِيْمُ',
                textAlign: TextAlign.right,
                style: GoogleFonts.openSans(
                  fontSize: 26.0,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latin',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Allaahu laa ilaaha illaa huwal hayyul qayyuum, laa ta\' khudzuhuu sinatuw wa laa nauum, lahuu maa fis samaawaati wa maa fil ardh, man dzalladzii yasyfa\'u \'indahuu illaa bi idznih, ya\'lamu maa baina aidiihim wa maa khalfahum, wa laa yuhiithuuna bisyai im min \'ilmihii illaa bimaa syaa\', wasi\'a kursiyyuhus samaawaati wal ardh, wa laa ya uuduhuu hifdzuhumaa, wa huwal \'aliyyul \'azhiim',
                style: GoogleFonts.openSans(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terjemahan',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Allah tidak ada Ilah (yang berhak diibadahi) melainkan Dia Yang Hidup Kekal lagi terus menerus mengurus (makhluk-Nya); tidak mengantuk dan tidak tidur. Kepunyaan-Nya apa yang ada di langit dan di bumi. Tidak ada yang dapat memberi syafa’at di sisi Allah tanpa izin-Nya. Allah mengetahui apa-apa yang (berada) dihadapan mereka, dan dibelakang mereka dan mereka tidak mengetahui apa-apa dari Ilmu Allah melainkan apa yang dikehendaki-Nya. Kursi Allah meliputi langit dan bumi. Dan Allah tidak merasa berat memelihara keduanya, Allah Mahatinggi lagi Mahabesar.',
                style: GoogleFonts.openSans(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

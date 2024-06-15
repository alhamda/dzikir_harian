import 'package:dzikir_harian/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.green.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'فَاذْكُرُوْنِيْٓ اَذْكُرْكُمْ وَاشْكُرُوْا لِيْ وَلَا تَكْفُرُوْنِ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Maka, ingatlah kepada-Ku, Aku pun akan ingat kepadamu. Bersyukurlah kepada-Ku dan janganlah kamu ingkar kepada-Ku.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Q.S Al-Baqarah: 152',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50.0),
                const SizedBox(
                  height: 22.0,
                  width: 22.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

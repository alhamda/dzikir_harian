import 'package:dzikir_harian/data/dhikr_morning_data.dart';
import 'package:dzikir_harian/screens/dhikr/dhikr_screen.dart';
import 'package:dzikir_harian/screens/home/widgets/action_button_widget.dart';
import 'package:dzikir_harian/screens/home/widgets/version_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                Colors.green.shade50,
                Colors.green.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/mosque.png',
                  filterQuality: FilterQuality.high,
                  opacity: const AlwaysStoppedAnimation(0.05),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                        25.0,
                        25.0,
                        25.0,
                        50.0,
                      ),
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 60.0),
                          child: Text(
                            'Dzikir Pagi Petang',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 27.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ActionButtonWidget(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DhikrScreen(
                                title: 'Dzikir Pagi',
                                data: dhikrMorningData,
                              ),
                            ),
                          ),
                          title: 'Dzikir Pagi',
                          subtitle: 'Baca setelah shalat shubuh',
                          icon: Icons.wb_sunny_outlined,
                        ),
                        const SizedBox(height: 25.0),
                        ActionButtonWidget(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DhikrScreen(
                                title: 'Dzikir Petang',
                                data: dhikrMorningData,
                              ),
                            ),
                          ),
                          title: 'Dzikir Petang',
                          subtitle: 'Baca setelah shalat ashar',
                          icon: Icons.nights_stay_outlined,
                        ),
                      ],
                    ),
                  ),
                  const VersionWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

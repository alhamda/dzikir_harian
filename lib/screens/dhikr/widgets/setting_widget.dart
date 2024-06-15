import 'package:dzikir_harian/cubits/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingWidget extends StatelessWidget {
  final bool isVisible;
  const SettingWidget({super.key, this.isVisible = false});

  @override
  Widget build(BuildContext context) {
    final SettingCubit settingCubit = context.watch<SettingCubit>();

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ]),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        child: SizedBox(
          width: double.infinity,
          height: isVisible ? 330 : 0,
          child: isVisible
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Arab',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Slider(
                        value: settingCubit.state.arabicFontSize,
                        min: 12,
                        max: 50,
                        onChanged: (double value) {
                          settingCubit.changeArabicFontSize(value);
                        },
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Latin',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Slider(
                        value: settingCubit.state.latinFontSize,
                        min: 12,
                        max: 50,
                        onChanged: (double value) {
                          settingCubit.changeLatinFontSize(value);
                        },
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Terjemahan',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Slider(
                        value: settingCubit.state.translationFontSize,
                        min: 12,
                        max: 50,
                        onChanged: (double value) {
                          settingCubit.changeTranslationFontSize(value);
                        },
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Sumber',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Slider(
                        value: settingCubit.state.sourceFontSize,
                        min: 12,
                        max: 50,
                        onChanged: (double value) {
                          settingCubit.changeSourceFontSize(value);
                        },
                      ),
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

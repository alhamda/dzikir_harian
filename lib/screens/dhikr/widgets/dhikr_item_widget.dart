import 'package:dzikir_harian/cubits/setting_cubit.dart';
import 'package:dzikir_harian/models/dhikr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DhikrItemWidget extends StatelessWidget {
  final DhikrModel dhikr;
  const DhikrItemWidget({super.key, required this.dhikr});

  @override
  Widget build(BuildContext context) {
    final SettingCubit settingCubit = context.watch<SettingCubit>();

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 35.0),
                child: Column(
                  children: [
                    Text(
                      dhikr.title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      dhikr.description.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                dhikr.arabic,
                textAlign: TextAlign.right,
                style: GoogleFonts.openSans(
                  height: 1.5,
                  fontSize: settingCubit.state.arabFontSize,
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
                dhikr.latin,
                style: GoogleFonts.openSans(
                  fontSize: settingCubit.state.latinFontSize,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
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
                dhikr.translation,
                style: GoogleFonts.openSans(
                  fontSize: settingCubit.state.terjemahanFontSize,
                  height: 1.5,
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
                'Sumber',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dhikr.source.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15.0),
                itemBuilder: (context, index) {
                  return Text(
                    dhikr.source[index],
                    style: GoogleFonts.openSans(
                      height: 1.5,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

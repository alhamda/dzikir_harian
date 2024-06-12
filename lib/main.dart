import 'package:dzikir_harian/screens/dhikr_screen.dart';
import 'package:dzikir_harian/cubits/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => SettingCubit(),
      child: const DhikrApp(),
    ),
  );
}

class DhikrApp extends StatelessWidget {
  const DhikrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dzikir Pagi dan Petang',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade400,
          elevation: 0,
        ),
        sliderTheme: SliderThemeData(
          thumbColor: Colors.amber.shade400,
          activeTrackColor: Colors.amber.shade400,
          inactiveTrackColor: Colors.teal.shade500,
        ),
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      home: const DhikrScreen(),
    );
  }
}

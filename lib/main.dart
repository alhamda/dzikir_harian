import 'package:dzikir_harian/cubits/setting_cubit.dart';
import 'package:dzikir_harian/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    BlocProvider(
      create: (context) => SettingCubit()..init(),
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
      title: 'Dzikir Pagi Petang',
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          thumbColor: Colors.green.shade300,
          overlayColor: Colors.green.withOpacity(0.3),
          inactiveTrackColor: Colors.green.shade50,
          activeTrackColor: Colors.green.shade100,
        ),
        primarySwatch: Colors.green,
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}

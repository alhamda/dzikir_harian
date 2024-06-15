import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingState());

  void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(
      arabicFontSize: prefs.getDouble('arabicFontSize'),
      latinFontSize: prefs.getDouble('latinFontSize'),
      translationFontSize: prefs.getDouble('translationFontSize'),
      sourceFontSize: prefs.getDouble('sourceFontSize'),
    ));
  }

  void reset() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    emit(const SettingState());
  }

  void changeArabicFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('arabicFontSize', value);

    emit(state.copyWith(arabicFontSize: value));
  }

  void changeLatinFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('latinFontSize', value);

    emit(state.copyWith(latinFontSize: value));
  }

  void changeTranslationFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('translationFontSize', value);

    emit(state.copyWith(translationFontSize: value));
  }

  void changeSourceFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('sourceFontSize', value);

    emit(state.copyWith(sourceFontSize: value));
  }
}

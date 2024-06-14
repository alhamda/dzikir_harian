import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingState());

  void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(
      arabFontSize: prefs.getDouble('arabFontSize'),
      latinFontSize: prefs.getDouble('latinFontSize'),
      terjemahanFontSize: prefs.getDouble('terjemahanFontSize'),
    ));
  }

  void reset() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    emit(const SettingState());
  }

  void changeArabFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('arabFontSize', value);

    emit(state.copyWith(arabFontSize: value));
  }

  void changeLatinFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('latinFontSize', value);

    emit(state.copyWith(latinFontSize: value));
  }

  void changeTerjemahanFontSize(double value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('terjemahanFontSize', value);

    emit(state.copyWith(terjemahanFontSize: value));
  }
}

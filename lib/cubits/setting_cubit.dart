import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingState());

  void reset() {
    emit(const SettingState());
  }

  void changeArabFontSize(double value) {
    emit(state.copyWith(arabFontSize: value));
  }

  void changeLatinFontSize(double value) {
    emit(state.copyWith(latinFontSize: value));
  }

  void changeTerjemahanFontSize(double value) {
    emit(state.copyWith(terjemahanFontSize: value));
  }
}

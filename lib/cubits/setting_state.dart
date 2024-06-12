part of 'setting_cubit.dart';

final class SettingState extends Equatable {
  final double arabFontSize;
  final double latinFontSize;
  final double terjemahanFontSize;

  const SettingState({
    this.arabFontSize = 27.0,
    this.latinFontSize = 15.0,
    this.terjemahanFontSize = 15.0,
  });

  SettingState copyWith({
    double? arabFontSize,
    double? latinFontSize,
    double? terjemahanFontSize,
  }) {
    return SettingState(
      arabFontSize: arabFontSize ?? this.arabFontSize,
      latinFontSize: latinFontSize ?? this.latinFontSize,
      terjemahanFontSize: terjemahanFontSize ?? this.terjemahanFontSize,
    );
  }

  @override
  List<Object> get props => [arabFontSize, latinFontSize, terjemahanFontSize];
}

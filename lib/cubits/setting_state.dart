part of 'setting_cubit.dart';

final class SettingState extends Equatable {
  final double arabicFontSize;
  final double latinFontSize;
  final double translationFontSize;
  final double sourceFontSize;

  const SettingState({
    this.arabicFontSize = 27.0,
    this.latinFontSize = 15.0,
    this.translationFontSize = 15.0,
    this.sourceFontSize = 15.0,
  });

  SettingState copyWith({
    double? arabicFontSize,
    double? latinFontSize,
    double? translationFontSize,
    double? sourceFontSize,
  }) {
    return SettingState(
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      latinFontSize: latinFontSize ?? this.latinFontSize,
      translationFontSize: translationFontSize ?? this.translationFontSize,
      sourceFontSize: sourceFontSize ?? this.sourceFontSize,
    );
  }

  @override
  List<Object> get props => [
        arabicFontSize,
        latinFontSize,
        translationFontSize,
        sourceFontSize,
      ];
}

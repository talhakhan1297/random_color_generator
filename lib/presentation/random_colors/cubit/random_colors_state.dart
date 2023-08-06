part of 'random_colors_cubit.dart';

/// State of the color.
@immutable
abstract class RandomColorsState {
  /// Constructor of [RandomColorsState].
  const RandomColorsState();
}

/// Initial state of the color.
class RandomColorsInitial extends RandomColorsState {
  /// Constructor of [RandomColorsInitial].
  const RandomColorsInitial();
}

/// State of the color when it is changed.
class RandomColorChanged extends RandomColorsState with EquatableMixin {
  /// Color that is changed.
  final Color color;

  /// Luminance Threshold which helps selecting contrast color.
  @visibleForTesting
  static const luminanceThreshold = 0.5;

  /// Generates the contrast color based on the luminance of the given [color].
  Color get getContrastColor => color.computeLuminance() > luminanceThreshold
      ? Colors.black
      : Colors.white;

  @override
  List<Object?> get props => [color];

  /// Constructor of [RandomColorChanged].
  const RandomColorChanged(this.color);
}

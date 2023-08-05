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

  static const _luminanceThreshold = 0.5;

  /// Generates the contrast color based on the luminance of the given [color].
  Color get getContrastColor => color.computeLuminance() > _luminanceThreshold
      ? Colors.black
      : Colors.white;

  @override
  List<Object?> get props => [color];

  /// Constructor of [RandomColorChanged].
  const RandomColorChanged(this.color);
}

part of 'color_generator.dart';

/// A random color generator class.
class RandomColorGenerator implements ColorGenerator {
  /// An instance of [Random] class, user for generating random 8-bit integers.
  final Random _random;

  /// The maximum value of an 8-bit integer.
  @visibleForTesting
  static const int eightBitMaxValue = 256;

  /// The opacity of the generated color.
  @visibleForTesting
  static const double opacity = 1.0;

  /// Creates a new [RandomColorGenerator] instance.
  RandomColorGenerator({Random? random}) : _random = random ?? Random();

  /// Generates a random [Color] when you call this function.
  @override
  Color generateColor() {
    final red = generateRandomEightBit();
    final green = generateRandomEightBit();
    final blue = generateRandomEightBit();

    return Color.fromRGBO(red, green, blue, opacity);
  }

  /// Generates a random 8-bit integer.
  @visibleForTesting
  int generateRandomEightBit() => _random.nextInt(eightBitMaxValue);
}

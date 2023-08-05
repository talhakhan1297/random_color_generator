import 'dart:math';

import 'package:flutter/material.dart';

part 'random_color_generator.dart';

/// A Color Generator.
abstract class ColorGenerator {
  /// Generates a [Color].
  Color generateColor();
}

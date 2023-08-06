import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/presentation/random_colors/cubit/random_colors_cubit.dart';

// ignore: avoid_implementing_value_types
class MockColor extends Mock implements Color {}

void main() {
  group('RandomColorsInitial', () {
    RandomColorsInitial createState() => const RandomColorsInitial();

    test('is RandomColorsState', () {
      expect(createState(), isA<RandomColorsState>());
    });
  });

  group('RandomColorChanged', () {
    final color = MockColor();
    const luminanceThreshold = 0.5;
    const luminanceValue = 0.8;

    // ignore: prefer_const_constructors
    RandomColorChanged createState() => RandomColorChanged(color);

    test('is RandomColorsState', () {
      expect(createState(), isA<RandomColorsState>());
    });

    test('supports value comparisons', () {
      expect(createState(), createState());
    });

    test('is luminanceThreshold right', () {
      expect(RandomColorChanged.luminanceThreshold, luminanceThreshold);
    });

    test('getContrastColor()', () {
      when(() => color.computeLuminance()).thenReturn(luminanceValue);
      expect(createState().getContrastColor, Colors.black);
    });
  });
}

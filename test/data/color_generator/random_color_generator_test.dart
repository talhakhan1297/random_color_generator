import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/data/color_generator/color_generator.dart';

class MockRandom extends Mock implements Random {}

void main() {
  const eightBitMaxValue = 256;
  const opacity = 1.0;
  const mockRandomNumber = 15;
  const expectedColor = Color.fromRGBO(
    mockRandomNumber,
    mockRandomNumber,
    mockRandomNumber,
    opacity,
  );

  final Random random = MockRandom();

  group('RandomColorGenerator', () {
    RandomColorGenerator colorGenerator() =>
        RandomColorGenerator(random: random);

    test('is of type ColorGenerator', () {
      expect(colorGenerator(), isA<ColorGenerator>());
    });

    group('initializes', () {
      test('without parameters', () {
        final generator = RandomColorGenerator();
        expect(generator, isA<RandomColorGenerator>());
      });
      test('with parameters', () {
        final generator = RandomColorGenerator(random: random);
        expect(generator, isA<RandomColorGenerator>());
      });
    });

    group('Has right value: ', () {
      test('eightBitMaxValue', () {
        expect(RandomColorGenerator.eightBitMaxValue, eightBitMaxValue);
      });
      test('opacity', () {
        expect(RandomColorGenerator.opacity, opacity);
      });
    });

    group('generateRandomEightBit()', () {
      test("generates a random 8-bit integer", () {
        final Random mockRandom = MockRandom();
        when(() => mockRandom.nextInt(eightBitMaxValue))
            .thenReturn(mockRandomNumber);

        final value =
            RandomColorGenerator(random: mockRandom).generateRandomEightBit();

        expect(value, mockRandomNumber);

        verify(() => mockRandom.nextInt(eightBitMaxValue)).called(1);
      });
    });

    group('generateColor()', () {
      test('generates a Color', () {
        when(() => random.nextInt(any())).thenReturn(mockRandomNumber);
        final color = colorGenerator().generateColor();
        expect(color, isA<Color>());
      });

      test('generates expected Color when mock bits are generated', () {
        when(() => random.nextInt(any())).thenReturn(mockRandomNumber);
        final color = colorGenerator().generateColor();
        expect(color, expectedColor);
      });
    });
  });
}

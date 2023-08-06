import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/data/color_generator/color_generator.dart';
import 'package:random_color_generator/presentation/random_colors/cubit/random_colors_cubit.dart';

class MockColorGenerator extends Mock implements ColorGenerator {}

void main() {
  late ColorGenerator mockColorGenerator;
  const mockColor = Colors.red;

  setUp(() {
    mockColorGenerator = MockColorGenerator();
  });

  group('RandomColorsCubit', () {
    RandomColorsCubit createCubit() =>
        RandomColorsCubit(colorGenerator: mockColorGenerator);

    group('initial state', () {
      test('is RandomColorsInitial', () {
        expect(createCubit().state, const RandomColorsInitial());
      });
    });

    group('changeColor', () {
      blocTest<RandomColorsCubit, RandomColorsState>(
        'emits [RandomColorsState(color)] '
        'when ColorGenerator.generateColor is called',
        build: createCubit,
        setUp: () => when(() => mockColorGenerator.generateColor())
            .thenReturn(mockColor),
        act: (cubit) => cubit.generateRandomColor(),
        expect: () => [const RandomColorChanged(mockColor)],
        verify: (_) {
          verify(() => mockColorGenerator.generateColor()).called(1);
        },
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/presentation/random_colors/cubit/random_colors_cubit.dart';
import 'package:random_color_generator/presentation/random_colors/random_colors.dart';
import 'package:random_color_generator/presentation/random_colors/widget/widget.dart';

import '../../../helpers/helpers.dart';

class MockRandomColorsCubit extends MockCubit<RandomColorsState>
    implements RandomColorsCubit {}

void main() {
  late MockRandomColorsCubit mockRandomColorsCubit;
  const mockColor = Colors.red;
  const mockContrastColor = Colors.white;

  setUp(() {
    mockRandomColorsCubit = MockRandomColorsCubit();
  });

  group('RandomColorsView', () {
    group('renders', () {
      testWidgets('RandomColorsBuilder', (tester) async {
        await tester.pumpApp(const RandomColorsView());
      });
    });
  });

  group('RandomColorsBuilder', () {
    group('renders', () {
      testWidgets(
          'TappableColoredWidget with defaultBackgroundColor color '
          'when state is RandomColorsInitial', (tester) async {
        when(() => mockRandomColorsCubit.state)
            .thenReturn(const RandomColorsInitial());

        await tester.pumpAppWithCubit<RandomColorsCubit>(
          home: const RandomColorsBuilder(),
          cubit: mockRandomColorsCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(
          colorWidget.backgroundColor,
          TappableColoredWidget.defaultBackgroundColor,
        );
      });

      testWidgets(
          'TappableColoredWidget with defaultTextColor color '
          'when state is RandomColorsInitial', (tester) async {
        when(() => mockRandomColorsCubit.state)
            .thenReturn(const RandomColorsInitial());

        await tester.pumpAppWithCubit<RandomColorsCubit>(
          home: const RandomColorsBuilder(),
          cubit: mockRandomColorsCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(
          colorWidget.textColor,
          TappableColoredWidget.defaultTextColor,
        );
      });

      testWidgets(
          'properly with backgroundColor'
          'when state is RandomColorChanged(color)', (tester) async {
        when(() => mockRandomColorsCubit.state).thenReturn(
          const RandomColorChanged(mockColor),
        );

        await tester.pumpAppWithCubit<RandomColorsCubit>(
          home: const RandomColorsBuilder(),
          cubit: mockRandomColorsCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(colorWidget.backgroundColor, mockColor);
      });

      testWidgets(
          'properly with textColor'
          'when state is RandomColorChanged(color)', (tester) async {
        when(() => mockRandomColorsCubit.state).thenReturn(
          const RandomColorChanged(mockColor),
        );

        await tester.pumpAppWithCubit<RandomColorsCubit>(
          home: const RandomColorsBuilder(),
          cubit: mockRandomColorsCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(colorWidget.textColor, mockContrastColor);
      });
    });

    group('calls', () {
      testWidgets('changeColor when TappableColoredWidget is tapped',
          (tester) async {
        when(() => mockRandomColorsCubit.state).thenReturn(
          const RandomColorsInitial(),
        );

        await tester.pumpAppWithCubit<RandomColorsCubit>(
          home: const RandomColorsBuilder(),
          cubit: mockRandomColorsCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        await tester.tap(finder);
        verify(() => mockRandomColorsCubit.generateRandomColor()).called(1);
      });
    });
  });
}

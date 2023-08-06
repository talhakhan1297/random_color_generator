import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/presentation/random_colors/widget/widget.dart';

import '../../../helpers/helpers.dart';

void main() {
  const text = "Hello there! 👋";
  const mockBackgroundColor = Colors.red;
  const mockContrastColor = Colors.white;

  group('TappableColoredwidget', () {
    group('renders', () {
      testWidgets('properly with the colors provided', (tester) async {
        await tester.pumpApp(
          const TappableColoredWidget(
            backgroundColor: mockBackgroundColor,
            textColor: mockContrastColor,
          ),
        );
        expect(find.byType(AnimatedContainer), findsOneWidget);
        expect(find.text(text), findsOneWidget);

        final decoration = tester
            .firstWidget<AnimatedContainer>(find.byType(AnimatedContainer))
            .decoration as BoxDecoration?;

        expect(decoration?.color, mockBackgroundColor);

        final textStyle = tester.firstWidget<Text>(find.text(text)).style;

        expect(textStyle?.color, mockContrastColor);
      });

      testWidgets(
          'with defaultColor coloredContent if customColor'
          'is not provided', (tester) async {
        await tester.pumpApp(const TappableColoredWidget());

        expect(find.byType(AnimatedContainer), findsOneWidget);
        expect(find.text(text), findsOneWidget);

        final decoration = tester
            .firstWidget<AnimatedContainer>(find.byType(AnimatedContainer))
            .decoration as BoxDecoration?;

        expect(
          decoration?.color,
          TappableColoredWidget.defaultBackgroundColor,
        );

        final textStyle = tester.firstWidget<Text>(find.text(text)).style;

        expect(textStyle?.color, TappableColoredWidget.defaultTextColor);
      });
    });

    group('calls', () {
      testWidgets('onTap when tapped', (tester) async {
        final completer = Completer<void>();

        await tester.pumpApp(
          TappableColoredWidget(
            backgroundColor: mockBackgroundColor,
            textColor: mockContrastColor,
            onTap: completer.complete,
          ),
        );

        await tester.tap(find.byType(AnimatedContainer));
        expect(completer.isCompleted, isTrue);
      });
    });
  });
}

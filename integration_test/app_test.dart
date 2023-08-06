import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/presentation/app/app.dart';
import 'package:random_color_generator/presentation/random_colors/random_colors.dart';
import 'package:random_color_generator/presentation/random_colors/widget/widget.dart';

import '../test/helpers/helpers.dart';

void main() {
  const text = "Hello there! 👋";
  group('End to end test', () {
    testWidgets('tap on the floating action button, verify color changes',
        (tester) async {
      await tester.pumpApp(const AppView());

      expect(find.byType(AppView), findsOneWidget);
      expect(find.byType(RandomColorsView), findsOneWidget);
      expect(find.byType(RandomColorsBuilder), findsOneWidget);
      expect(find.byType(TappableColoredWidget), findsOneWidget);
      expect(find.text(text), findsOneWidget);

      final finder = find.byType(AnimatedContainer);
      expect(finder, findsOneWidget);

      final previousColor = (tester
              .firstWidget<AnimatedContainer>(finder)
              .decoration as BoxDecoration?)
          ?.color;

      await tester.tap(finder);

      await tester.pumpAndSettle();

      final currentColor = (tester
              .firstWidget<AnimatedContainer>(finder)
              .decoration as BoxDecoration?)
          ?.color;

      expect(previousColor == currentColor, false);
    });
  });
}

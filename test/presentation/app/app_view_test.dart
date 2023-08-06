import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/presentation/app/app.dart';
import 'package:random_color_generator/presentation/random_colors/random_colors.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppView', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpApp(const AppView());

      expect(find.byType(AppView), findsOneWidget);
      expect(find.byType(RandomColorsView), findsOneWidget);
    });
  });
}

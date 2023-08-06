import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget home) {
    return pumpWidget(
      TestApp(home: home),
    );
  }

  Future<void> pumpAppWithCubit<T extends Cubit<Object>>({
    required Widget home,
    required T cubit,
  }) async {
    await pumpApp(
      BlocProvider<T>.value(
        value: cubit,
        child: TestApp(home: home),
      ),
    );
  }
}

/// This is the base widget for all tests
class TestApp extends StatelessWidget {
  final Widget home;

  const TestApp({required this.home, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: home);
  }
}

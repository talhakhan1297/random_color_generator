part of 'view.dart';

/// This widget is the root of the application.
class AppView extends StatelessWidget {
  /// Default constructor.
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: RandomColorsView(),
    );
  }
}

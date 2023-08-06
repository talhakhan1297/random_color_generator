part of 'view.dart';

/// Root widget of the Random Colors feature.
class RandomColorsView extends StatelessWidget {
  /// Creates the root widget of the Random Colors feature.
  const RandomColorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomColorsCubit>(
      create: (context) => RandomColorsCubit(
        colorGenerator: RandomColorGenerator(),
      )..generateRandomColor(),
      child: const RandomColorsBuilder(),
    );
  }
}

/// Builder of the Random Colors feature.
class RandomColorsBuilder extends StatelessWidget {
  /// Constructor to create an instance of the builder.
  const RandomColorsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomColorsCubit, RandomColorsState>(
      builder: (context, state) {
        final color = state is RandomColorChanged ? state.color : null;
        final textColor =
            state is RandomColorChanged ? state.getContrastColor : null;

        return Scaffold(
          body: TappableColoredWidget(
            backgroundColor: color,
            textColor: textColor,
            onTap: () =>
                context.read<RandomColorsCubit>().generateRandomColor(),
          ),
        );
      },
    );
  }
}

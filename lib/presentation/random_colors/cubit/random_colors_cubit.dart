import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_generator/data/color_generator/color_generator.dart';

part 'random_colors_state.dart';

/// Cubit that handles the state of the color.
class RandomColorsCubit extends Cubit<RandomColorsState> {
  final ColorGenerator _colorGenerator;

  /// Constructor that sets the initial state.
  RandomColorsCubit({required ColorGenerator colorGenerator})
      : _colorGenerator = colorGenerator,
        super(const RandomColorsInitial());

  /// Generates a random color from [ColorGenerator] and emits a new state
  /// with that color.
  void generateRandomColor() {
    final color = _colorGenerator.generateColor();
    emit(RandomColorChanged(color));
  }
}

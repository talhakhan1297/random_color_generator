part of 'widget.dart';

/// A colored widget that can be tapped.
class TappableColoredWidget extends StatelessWidget {
  /// Constructor to create the widget with a color and a callback to be
  /// called when the widget is tapped.
  ///
  /// The [backgroundColor] is an optional parameter and if not provided
  /// the [defaultBackgroundColor] will be used.
  ///
  /// The [textColor] is an optional parameter and if not provided
  /// the [defaultTextColor] will be used.
  const TappableColoredWidget({
    required this.onTap,
    Color? backgroundColor,
    Color? textColor,
    super.key,
  })  : backgroundColor =
            backgroundColor ?? TappableColoredWidget.defaultBackgroundColor,
        textColor = textColor ?? TappableColoredWidget.defaultTextColor;

  /// Default color value to be used if no color is provided.
  @visibleForTesting
  static const Color defaultBackgroundColor = Colors.white;

  /// Default text color value to be used if no text color is provided.
  @visibleForTesting
  static const Color defaultTextColor = Colors.black;

  /// Background color of the widget.
  final Color backgroundColor;

  /// Color of the text widget.
  final Color textColor;

  /// The callback to be called when the widget is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: backgroundColor,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              helloThereText,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// a custom button
/// with loading state
class CustomButton extends StatelessWidget {
  /// Creates a new instance of [CustomButton].
  const CustomButton({
    Key? key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  /// a custom onTap callback to fire
  /// when the button is pressed
  final VoidCallback? onTap;

  /// button text
  final String text;

  /// a flag to either show loading widget
  /// or button text
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Center(
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              )
            : Text(text),
      ),
    );
  }
}

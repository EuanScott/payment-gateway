import 'package:flutter/material.dart';

/// A helper class for showing snack bars.
///
/// This class provides a static method `showSnackBar` for showing a snack bar with a given message.
/// The snack bar is displayed for a duration of 2 seconds.
class SnackBarHelper {
  /// Displays a snack bar with the given message.
  ///
  /// The snack bar is displayed using the `ScaffoldMessenger` of the given `BuildContext`.
  /// The duration of the snack bar is 2 seconds.
  ///
  /// The `context` parameter is the `BuildContext` that the snack bar will be displayed in.
  /// The `message` parameter is the message that will be displayed in the snack bar.
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

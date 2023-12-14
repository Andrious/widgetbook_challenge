import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgetbook_challenge/src/view.dart';

/// an extension to show snackbar message when
/// an exception occurs
extension AsyncValueUI on AsyncValue<void> {
  ///
  bool get isLoading => this is AsyncLoading<void>;

  /// helper method to display snackbar on [AsyncValue] error
  void showSnackBarOnError(BuildContext context) => whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('An unexpected error occurs!'),
              backgroundColor: AppColors().kRedIndicatorColor,
            ),
          );
        },
      );
}

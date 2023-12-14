import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/src/excess_riverpod_junk_IGNORED/providers/repository_provider.dart';

/// A [StateNotifier] controller class to interface
/// to app repository on button press
class MessageButtonController extends StateNotifier<AsyncValue<dynamic>> {
  /// Creates an instance of [MessageButtonController].
  MessageButtonController({required this.ref})
      : super(const AsyncValue<dynamic>.data(null));

  /// An object (from riverpod package) used by providers to interact with other
  /// providers and the life-cycles of the application.
  final Ref ref;

  /// make a request to repository to get message
  Future<void> getMessage(String name) async {
    state = const AsyncValue<dynamic>.loading();
    state = await AsyncValue.guard<dynamic>(
      () => ref.read(repositoryProvider).getMessage(name),
    );
  }
}

///
import 'package:widgetbook_challenge/src/model.dart';

/// A repository class interacting with
/// backend api
class AppRepository {
  /// Creates a new instance of [AppRepository].
  AppRepository(this.widgetbookApi);

  /// create a [WidgetbookApi] instance to mimic backend operations
  final WidgetbookApi widgetbookApi;

  /// A function which returns a message [String] on success
  ///
  /// - throws an [UnexpectedException] otherwise
  ///
  /// or void if there is slow network
  Future<String> getMessage(String name) async {
    final result = await widgetbookApi.welcomeToWidgetbook(message: name);

    return result;
  }
}

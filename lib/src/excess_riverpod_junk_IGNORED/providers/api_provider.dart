///
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgetbook_challenge/src/model.dart';

/// creates a provider for [WidgetbookApi]
///
/// provides a simulated backend experience
final apiProvider = Provider((_) => WidgetbookApi());

/// creates a provider for [DummyWidgetbookApi]
///
/// provides a simulated backend experience which can be altered per needs
final dummyApiProvider = Provider((_) => DummyWidgetbookApi());

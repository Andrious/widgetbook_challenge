import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgetbook_challenge/src/model.dart';

import 'api_provider.dart';

/// creates a provider for [AppRepository]
///
/// encapsulates backend operations
final repositoryProvider =
    Provider((ref) => AppRepository(ref.read(apiProvider)));

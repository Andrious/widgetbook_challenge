import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// global app [Theme] provider
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

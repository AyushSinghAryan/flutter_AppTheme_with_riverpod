// ! Easy level

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_dart/API/RiverPod/Themes/theme_class.dart';
import 'package:learning_dart/API/RiverPod/Themes/theme_model.dart';
import 'package:learning_dart/API/RiverPod/riverpod_model.dart';

final riverpodEasyLevel = StateProvider<int>((ref) {
  return 0;
});

final riverpodHardLevel = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel(counter: 0); // it is taking intial value
});

final riverpodTheme = ChangeNotifierProvider<ThemeModel>((ref) {
  return ThemeModel(AppThemes.lightTheme);
});

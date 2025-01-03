import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void updateTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    return json['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    return {'theme': state == ThemeMode.dark ? 'dark' : 'light'};
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../config/theme_manager.dart';
import '../../../../../../../core/app/di.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void getCurrentTheme(){
    emit(ChangeThemeState(theme: getApplicationLightTheme()));
  }
  void changeTheme(String theme){
    if(theme==darkMode){
      instance<SharedPreferences>().setString(themeIndexKey, darkMode);
      emit(ChangeThemeState(theme: getApplicationDarkTheme()));
    }
    else{
      instance<SharedPreferences>().setString(themeIndexKey, lightMode);
      emit(ChangeThemeState(theme: getApplicationLightTheme()));
    }
  }
}

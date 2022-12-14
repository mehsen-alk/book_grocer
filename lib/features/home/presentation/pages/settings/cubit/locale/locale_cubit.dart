import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:book_grocer/config/language_manager.dart';
import 'package:book_grocer/core/app/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  void getSavedLanguage()  {
    emit(ChangeLocalState(
        locale: instance<LanguageCacheHelper>().getLocal()));
  }

  void changeLanguage(String languageCode){
    if (languageCode == 'ar') {
      instance<SharedPreferences>().setString(prefKeyLang, arabic);
      emit(const ChangeLocalState(locale: arabicLocal));
    } else {
      instance<SharedPreferences>().setString(prefKeyLang, english);
      emit(const ChangeLocalState(locale: englishLocal));
    }
  }
}

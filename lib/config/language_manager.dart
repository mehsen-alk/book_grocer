// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_grocer/core/app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LanguageType { english, arabic }

const String arabic = "ar";
const String english = "en";
const String assetPathLocalization = "assets/translations";

const String prefKeyLang = 'pref_key_lang';

const Locale arabicLocal = Locale("ar");
const Locale englishLocal = Locale("en");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}

class LanguageCacheHelper {
  final SharedPreferences _sharedPreferences;

  LanguageCacheHelper(
      this._sharedPreferences,
      );

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefKeyLang);
    if (!language.nullOrEmpty()) {
      return language!;
    } else {
      // return default lang
      return LanguageType.arabic.getValue();
    }
  }


  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:visual_notes/Utils/constants.dart';

final localeProvider = ChangeNotifierProvider<LocaleProvider>((ref) => LocaleProvider());
final prov = Provider((ref) => LocaleProvider());

class LocaleProvider extends ChangeNotifier {
  Locale _appLocale = const Locale(Constants.englishCode);

  Locale get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(Constants.languageCode);
    if (languageCode == null) {
      setLocale(Constants.englishCode);
    } else {
      setLocale(languageCode);
      log('this Our Locale $_appLocale');
      notifyListeners();
    }
  }

  void setLocale(String languageCode) {
    _appLocale = Locale(languageCode);
  }

  void changeLanguage(Locale localeType) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == localeType) return;

    if (localeType == const Locale(Constants.arabicCode)) {
      setLocale(Constants.arabicCode);
      await prefs.setString(Constants.languageCode, Constants.arabicCode);
      await prefs.setString(Constants.countryCode, Constants.defaultSharedPrefString);
    } else {
      setLocale(Constants.englishCode);
      await prefs.setString(Constants.languageCode, Constants.englishCode);
      await prefs.setString(Constants.countryCode, Constants.usCode);
    }
  //  SettingsSession.instance().setAppLanguage();
    notifyListeners();
  }
}


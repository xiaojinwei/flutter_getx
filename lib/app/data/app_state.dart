import 'dart:ui';

import 'package:flutter_getx/app/data/theme_state.dart';
import 'package:flutter_getx/app/data/user_state.dart';
import 'package:flutter_getx/app/extension/locale_ext.dart';

class AppState {
  Locale? locale;
  ThemeState themeState = ThemeState();
  UserState userState = UserState();

  AppState.create({Locale? locale,ThemeState? themeState,UserState? userState}){
    this.locale = locale;
    this.themeState = themeState??this.themeState;
    this.userState = userState??this.userState;
  }

  static AppState fromJson(dynamic json) => json == null ? AppState.create() : AppState.create(
      locale: LocaleExtension.fromJson(json['locale']),
      themeState: ThemeState.fromJson(json['themeState']),
      userState: UserState.fromJson(json['userState']),
  );

  /// toJson名字固定
  Map<String,dynamic> toJson() => {
    'locale':locale == null ? null : locale?.toJson(),
    'themeState':themeState.toJson(),
    'userState':userState.toJson(),
  };

  AppState copyWith({
    Locale? locale,
    ThemeState? themeState,
    UserState? userState,
  }){
    return AppState.create(
      locale: locale??this.locale,
      themeState: themeState??this.themeState,
      userState: userState??this.userState,
    );
  }
}
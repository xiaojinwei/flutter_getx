import 'package:flutter/material.dart';
import 'package:flutter_getx/app/common/const.dart';
import 'package:flutter_getx/app/extension/color_ext.dart';

class ThemeState {
  MaterialColor themeColor; //主题
  String fontFamily; //字体
  int themeMode; //主题模式，暗黑模式

  ThemeState({this.themeColor = Colors.purple, this.fontFamily = "Local", this.themeMode = ThemeModeStatus.system});

  factory ThemeState.fromJson(Map<String,dynamic>? json) => ThemeState(
      themeColor:ColorExtension.fromJson(json == null ? null : json['themeColor'])??Colors.purple,
      fontFamily:json?['fontFamily'],
      themeMode:json?['themeMode']
  );

  Map<String,dynamic> toJson() => <String,dynamic>{
    'themeColor': themeColor.toJson(),
    'fontFamily': fontFamily,
    'themeMode': themeMode,
  };

  ThemeState copyWith({
    MaterialColor? themeColor,
    String? fontFamily,
    int? themeMode,
  }){
    return new ThemeState(
      themeColor: themeColor??this.themeColor,
      fontFamily: fontFamily??this.fontFamily,
      themeMode: themeMode??this.themeMode,
    );
  }
}
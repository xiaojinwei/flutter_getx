import 'package:flutter/material.dart';
import 'package:flutter_getx/app/common/const.dart';
import 'package:flutter_getx/app/data/theme_state.dart';
import 'package:flutter_getx/app/styles/colors.dart';
import 'package:flutter_getx/app/utils/app_util.dart';
import 'package:get/get.dart';

class ThemeUtil{

  static bool isDarkMode(){
    return Get.isDarkMode;
  }

  static Color getThemeColorWithDark(){
    bool isDark = Get.isDarkMode;
    Color darkLightColor = Colours.dark_light_color;
    var context = Get.context;
    Color color = isDark ? darkLightColor : (context != null ? Theme.of(context).primaryColor : Colours.app_main);
    return color;
  }

  static List<ThemeModelLabel> getThemeModelLabels(){
    List<ThemeModelLabel> result = [
      ThemeModelLabel(title: getThemeModeTitle(ThemeModeStatus.system),mode: ThemeModeStatus.system,isSelected: isSelectedMode(ThemeModeStatus.system)),
      ThemeModelLabel(title: getThemeModeTitle(ThemeModeStatus.dark),mode: ThemeModeStatus.dark,isSelected: isSelectedMode(ThemeModeStatus.dark)),
      ThemeModelLabel(title: getThemeModeTitle(ThemeModeStatus.light),mode: ThemeModeStatus.light,isSelected: isSelectedMode(ThemeModeStatus.light)),
    ];
    return result;
  }

  static String getThemeModeTitle(int mode){
    switch(mode){
      case ThemeModeStatus.system:
        return "theme_mode_auto".tr;
      case ThemeModeStatus.light:
        return "theme_mode_close".tr;
      case ThemeModeStatus.dark:
        return "theme_mode_open".tr;
      default:
        return "";
    }
  }

  static bool isSelectedMode(int mode){
    return AppUtil.instance.getAppState().themeState.themeMode == mode;
  }

  static int getSelectedThemeModeStatus(){
    return AppUtil.instance.getAppState().themeState.themeMode;
  }

  static ThemeModelLabel getSelectedThemeModelLabel(){
    int mode = getSelectedThemeModeStatus();
    return ThemeModelLabel(title: getThemeModeTitle(mode),mode: mode,isSelected: isSelectedMode(mode));
  }

  static ThemeMode getSelectedThemeMode(){
    var mode = getSelectedThemeModeStatus();
    return getThemeMode(mode);
  }

  static ThemeMode getThemeMode(int mode){
    switch(mode){
      case ThemeModeStatus.system:
        return ThemeMode.system;
      case ThemeModeStatus.light:
        return ThemeMode.light;
      case ThemeModeStatus.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static ThemeState getThemeState(){
    return AppUtil.instance.getAppState().themeState;
  }

  static ThemeData getThemeData({bool isDarkMode = false,MaterialColor? themeColor,String? fontFamily}) {
    var themeState = getThemeState();
    return ThemeData(
      primarySwatch: themeColor??themeState.themeColor,
      accentColor: themeColor??themeState.themeColor,
      fontFamily: fontFamily??themeState.fontFamily,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }

  static String getFontFamily(){
    return AppUtil.instance.getAppState().themeState.fontFamily;
  }

  static void switchThemeMode(int mode) {
    AppUtil.instance.saveAppState(AppUtil.instance.getAppState()..themeState.themeMode = mode);
    Get.changeThemeMode(getThemeMode(mode));
  }

  static void changeThemeColor(MaterialColor color){
    AppUtil.instance.saveAppState(AppUtil.instance.getAppState()..themeState.themeColor = color);
    Get.changeTheme(getThemeData(themeColor: color));
  }

  static void switchFontFamily(String fontFamily) {
    AppUtil.instance.saveAppState(AppUtil.instance.getAppState()..themeState.fontFamily = fontFamily);
    Get.changeTheme(getThemeData(fontFamily: fontFamily));
  }
  
}

class ThemeModelLabel {
  String title;
  int mode;
  bool isSelected;

  ThemeModelLabel({this.title = "",this.mode = ThemeModeStatus.system,this.isSelected = false});
}
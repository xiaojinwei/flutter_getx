import 'package:flutter/material.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  MaterialColor getThemeColor(){
    return ThemeUtil.getThemeState().themeColor;
  }

  void changeThemeColor(MaterialColor color) {
    ThemeUtil.changeThemeColor(color);
    update();
  }


}
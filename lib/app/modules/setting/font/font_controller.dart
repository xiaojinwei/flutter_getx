import 'package:flutter/material.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:get/get.dart';

class FontController extends GetxController {

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

  String getFontFamily(){
    return ThemeUtil.getFontFamily();
  }

  void switchFontFamily(String fontFamily) {
    ThemeUtil.switchFontFamily(fontFamily);
    update();
  }


}
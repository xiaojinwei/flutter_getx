import 'dart:ui';
import 'package:flutter_getx/app/utils/language_util.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {

  List<LanguageModel> supports = [];

  void onRefresh(){
    supports = LanguageUtil.getSupportLanguagesSort();
  }

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

  switchLanguage(Locale? locale){
      LanguageUtil.switchLanguage(locale);
  }
}

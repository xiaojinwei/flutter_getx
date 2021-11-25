import 'dart:ui';
import 'package:flutter_getx/app/utils/app_util.dart';
import 'package:get/get.dart';
import 'package:flutter_getx/app/language/locale_translations.dart';
import 'package:flutter_getx/app/extension/locale_ext.dart';

class LanguageUtil {
  static List<LanguageModel> getSupportLanguages(){
    List<LanguageModel> models = [];
    var locales = LocaleTranslations.getLocales();
    locales.forEach((element) {
      models.add(LanguageModel(title:getLanguageTitle(element),locale:element,isSelected:isSelectedLanguage(element)));
    });
    return models;
  }

  ///按Locale.toString()排序
  static List<LanguageModel> getSupportLanguagesSort(){
    var supportLanguages = getSupportLanguages();
    supportLanguages.sort((a,b)=> a.locale?.compareTo(b.locale)??-1);
    return supportLanguages;
  }

  static LanguageModel getSelectedLanguageModel(){
    var locale = getSelectedLocale();
    return LanguageModel(title:getLanguageTitle(locale),locale:locale,isSelected:isSelectedLanguage(locale));
  }

  static Locale? getSelectedLocale(){
    return AppUtil.instance.getAppState().locale;
  }

  static Locale? getSettingLanguageLocale(){
    return getSelectedLocale()??Get.deviceLocale;
  }

  static bool isSelectedLanguage(Locale? locale){
    return AppUtil.instance.getAppState().locale == locale;
  }

  static String getLanguageTitle(Locale? locale){
    String to = locale?.toString()??'auto';
    switch(to){
      case 'auto':
        return "language_auto".tr;
      case 'en':
      case 'en_US':
        return "language_en".tr;
      case 'zh_CN'://zh_Hans_CN
        return "language_zh_cn".tr;
      default:
        return to;
    }
  }

  static switchLanguage(Locale? locale){
    AppUtil.instance.saveAppState(AppUtil.instance.getAppState()..locale = locale);
    Get.updateLocale(locale??Get.deviceLocale??Locale.fromSubtags(languageCode: "en",countryCode: "US"));
  }

}

class LanguageModel {
  String title;
  Locale? locale;
  bool isSelected;

  LanguageModel({this.title = "",this.locale,this.isSelected = false});
}
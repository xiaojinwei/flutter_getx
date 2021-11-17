import 'package:flutter/material.dart';
import 'package:flutter_getx/app/language/locale_translations.dart';
import 'package:flutter_getx/app/utils/app_util.dart';
import 'package:flutter_getx/app/utils/language_util.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/cookie_util.dart';

void main() async{
  await AppUtil.instance.init();
  await CookieUtil.wait();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: LocaleTranslations(), // your translations
      locale: LanguageUtil.getSelectedLocale(), // translations will be displayed in that locale
      fallbackLocale: Locale('zh', 'CN'),
      themeMode: ThemeUtil.getSelectedThemeMode(),
      theme: ThemeUtil.getThemeData(isDarkMode: false),
      darkTheme: ThemeUtil.getThemeData(isDarkMode: true),
    ),
  );
}

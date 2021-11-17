import 'package:flutter_getx/app/modules/account/login/login_binding.dart';
import 'package:flutter_getx/app/modules/account/login/login_page.dart';
import 'package:flutter_getx/app/modules/setting/font/font_binding.dart';
import 'package:flutter_getx/app/modules/setting/font/font_page.dart';
import 'package:flutter_getx/app/modules/setting/mode/bindings/theme_mode_binding.dart';
import 'package:flutter_getx/app/modules/setting/mode/views/theme_mode_page.dart';
import 'package:flutter_getx/app/modules/setting/theme/theme_binding.dart';
import 'package:flutter_getx/app/modules/setting/theme/theme_page.dart';
import 'package:flutter_getx/app/modules/wenda/wenda_binding.dart';
import 'package:flutter_getx/app/modules/wenda/wenda_page.dart';
import 'package:get/get.dart';
import 'package:flutter_getx/app/modules/main/bindings/main_binding.dart';
import 'package:flutter_getx/app/modules/main/views/main_page.dart';
import 'package:flutter_getx/app/modules/setting/language/bindings/language_binding.dart';
import 'package:flutter_getx/app/modules/setting/language/views/language_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => LanguagePage(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.THEME_MODE,
      page: () => ThemeModePage(),
      binding: ThemeModeBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => ThemePage(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.FONT,
      page: () => FontPage(),
      binding: FontBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WENDA,
      page: () => WenDaPage(),
      binding: WenDaBinding(),
    ),
  ];
}

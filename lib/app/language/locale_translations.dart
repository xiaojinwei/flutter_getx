import 'dart:ui';

import 'package:get/get.dart';

class LocaleTranslations extends Translations {

  static List<Locale?> getLocales(){
    return [
      null,//跟随系统
      Locale.fromSubtags(languageCode: "en",countryCode: "US"),
      Locale.fromSubtags(languageCode: "zh",countryCode: "CN"),
    ];
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "tab_one": "Home",
      "tab_two": "Project",
      "tab_three": "WeChat",
      "tab_four": "System",
      "tab_one_write": "Write",
      "multi_language": "Language",
      "setting": "Setting",
      "language_auto": "Auto",
      "language_en": "English",
      "language_zh_cn": "简体中文",
      "theme":"Theme",
      "theme_mode_auto": "Auto",
      "theme_mode_open": "On",
      "theme_mode_close": "Off",
      "dark_mode": "Dark Mode",
      "font":"Font",
      "log_in": "Log In",
      "log_out": "Log Out",
      "enter_username": "Username",
      "enter_password": "Password",
      "enter_username_error": "Please enter your username",
      "enter_password_error": "Please enter your password",
      "network_error_hint": "There is a problem with the network ~ please check the network settings",
      "click_reload": "Click on the screen to reload",
      "empty_hint": "Empty ~",
      "integral": "Integral",
      "level": "Level",
      "new_article":"New",
      "top":"Top",
      "share_to_square":"Share",
      "collect": "Collect",
      "copy_link": "CopyLink",
      "exit": "Exit",
      "copy_success": "Copy successful",
      "share_failed": "Share failed",
      "share_success": "Share success",
      "tab_system": "System",
      "tab_navigation": "Navigation",
      "wenda": "Q&A",
    },
    'zh_CN': {
      "tab_one": "首页",
      "tab_two": "项目",
      "tab_three": "公众号",
      "tab_four": "体系",
      "tab_one_write": "记一下",
      "multi_language": "语言",
      "setting": "设置",
      "language_auto": "跟随系统",
      "language_en": "English",
      "language_zh_cn": "简体中文",
      "theme":"主题",
      "theme_mode_auto": "跟随系统",
      "theme_mode_open": "开启",
      "theme_mode_close": "关闭",
      "dark_mode": "暗黑模式",
      "font":"字体",
      "log_in": "登录",
      "log_out": "退出",
      "enter_username": "用户名",
      "enter_password": "密码",
      "enter_username_error": "请输入用户名",
      "enter_password_error": "请输入密码",
      "network_error_hint": "网络出问题了～ 请您查看网络设置",
      "click_reload": "点击屏幕，重新加载",
      "empty_hint": "空空如也～",
      "integral": "积分",
      "level": "排名",
      "new_article":"新",
      "top":"置顶",
      "share_to_square":"分享到广播",
      "collect": "收藏",
      "copy_link": "复制链接",
      "exit": "退出",
      "copy_success": "复制成功",
      "share_failed": "分享失败",
      "share_success": "分享成功",
      "tab_system": "体系",
      "tab_navigation": "导航",
      "wenda": "问答",
    }
  };
}

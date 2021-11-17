import 'package:flutter_getx/app/event/setting_event.dart';
import 'package:flutter_getx/app/utils/bus_util.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:get/get.dart';

class ThemeModeController extends GetxController {

  List<ThemeModelLabel> models = [];

  void onRefresh(){
    models = ThemeUtil.getThemeModelLabels();
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

  void switchThemeMode(ThemeModelLabel mode) {
    ThemeUtil.switchThemeMode(mode.mode);
    BusUtil.eventBus.fire(SettingEvent.createRefreshModeEvent(mode.title));
    update();
  }


}
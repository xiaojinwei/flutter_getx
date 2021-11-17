
import 'package:flutter_getx/app/modules/setting/mode/controllers/theme_mode_controller.dart';
import 'package:get/get.dart';

class ThemeModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeModeController>(
          () => ThemeModeController(),
    );
  }
}
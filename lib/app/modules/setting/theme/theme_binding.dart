
import 'package:flutter_getx/app/modules/setting/theme/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(
          () => ThemeController(),
    );
  }
}
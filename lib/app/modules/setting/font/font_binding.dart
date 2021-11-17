
import 'package:get/get.dart';

import 'font_controller.dart';

class FontBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FontController>(
          () => FontController(),
    );
  }
}
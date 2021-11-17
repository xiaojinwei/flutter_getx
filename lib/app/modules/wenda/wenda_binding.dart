
import 'package:flutter_getx/app/modules/wenda/wenda_controller.dart';
import 'package:get/get.dart';

class WenDaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WenDaController>(
          () => WenDaController(),
    );
  }
}
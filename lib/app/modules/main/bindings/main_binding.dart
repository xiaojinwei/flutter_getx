import 'package:flutter_getx/app/modules/main/controllers/common_controller.dart';
import 'package:flutter_getx/app/modules/tab/home/home_controller.dart';
import 'package:flutter_getx/app/modules/tab/project/project_controller.dart';
import 'package:flutter_getx/app/modules/tab/wechat/wechat_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
          () => MainController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<ProjectController>(
          () => ProjectController(),
    );
    Get.lazyPut<CommonController>(
          () => CommonController(),
    );
    Get.lazyPut<WeChatController>(
          () => WeChatController(),
    );
  }
}

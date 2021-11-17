import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/user_data.dart';
import 'package:flutter_getx/app/event/collect_event.dart';
import 'package:flutter_getx/app/event/token_event.dart';
import 'package:flutter_getx/app/utils/app_util.dart';
import 'package:flutter_getx/app/utils/bus_util.dart';
import 'package:flutter_getx/app/utils/navigator_util.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:get/get.dart';

import '../../../container.dart';

class LoginController extends GetxController{
  var logging = false.obs;

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onClose() {
    super.onClose();
  }

  void login(BuildContext context,String username,String password){
    this.logging.value = true;
    _login(username, password).then((value){
      AppUtil.instance.saveAppState(AppUtil.instance.getAppState()..userState.user = value);
      NavigatorUtil.gotoMainOrBack(context);
      BusUtil.eventBus.fire(TokenEvent.createTokenEvent(value));
      BusUtil.eventBus.fire(CollectEvent.createRefreshEvent());
    }).onError((error, stackTrace){
      AppUtil.instance.saveAppState(AppUtil.instance.getAppState()..userState.user = null);
      Util.toast(error.toString());
    }).whenComplete(() => {
      this.logging.value = false
    });
  }

  Future<UserData> _login(String username,String password){
    return WanContainer().wanRepository.login(username, password);
  }
}
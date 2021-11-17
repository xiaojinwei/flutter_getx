import 'dart:async';

import 'package:flutter_getx/app/action/refresh_action.dart';
import 'package:flutter_getx/app/event/token_event.dart';
import 'package:flutter_getx/app/utils/bus_util.dart';
import 'package:get/get.dart';

abstract class TokenController extends GetxController implements RefreshAction{

  StreamSubscription<TokenEvent>? _subscriptionToken;

  @override
  void onReady() {
    super.onReady();
    this.initTokenBus();
  }

  @override
  void onClose() {
    super.onClose();
    _subscriptionToken?.cancel();
  }

  void initTokenBus() {
    _subscriptionToken = BusUtil.eventBus.on<TokenEvent>().listen((event) {
      onRefresh();
    });
  }
}
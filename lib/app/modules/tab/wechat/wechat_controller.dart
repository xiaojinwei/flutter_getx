
import 'dart:async';

import 'package:flutter_getx/app/data/tab_label.dart';
import 'package:get/get.dart';

import '../../../container.dart';

class WeChatController extends GetxController{
  StreamController<List<TabLabel>> tabController = StreamController<List<TabLabel>>();

  Stream<List<TabLabel>> get tabStream => tabController.stream;

  @override
  void onReady() {
    super.onReady();
    this.getTab();
  }

  @override
  void onClose(){
    super.onClose();
    tabController.close();
  }

  Future getTab(){
    return WanContainer().wanRepository.getWeChatTab()
        .then((value) => tabController.sink.add(value))
        .catchError((e) =>
        tabController.sink.addError(e))
        .whenComplete(() =>
    {});
  }
}
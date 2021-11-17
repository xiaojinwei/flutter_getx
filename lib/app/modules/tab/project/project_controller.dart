import 'dart:async';

import 'package:flutter_getx/app/data/tab_label.dart';
import 'package:get/get.dart';

import '../../../container.dart';

class ProjectController extends GetxController{

  StreamController<List<TabLabel>> projectTabController = StreamController<List<TabLabel>>();

  Stream<List<TabLabel>> get projectTabStream => projectTabController.stream;
  //Rx<List<TabLabel>> rxProjectTab = Rx([]);

  @override
  void onReady() {
    super.onReady();
    this.getProjectTab();
  }

  @override
  void onClose(){
    super.onClose();
    projectTabController.close();
  }

  Future getProjectTab(){
    return WanContainer().wanRepository.getProjectTab()
        .then((value) => projectTabController.sink.add(value))
        .catchError((e) =>
        projectTabController.sink.addError(e))
        .whenComplete(() =>
        {});
  }

}
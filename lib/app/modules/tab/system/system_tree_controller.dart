import 'dart:async';

import 'package:flutter_getx/app/data/knowledge.dart';
import 'package:flutter_getx/app/data/navigation.dart';
import 'package:flutter_getx/app/modules/tab/system/system_tree_fragment.dart';
import 'package:get/get.dart';

import '../../../container.dart';

class SystemTreeController extends GetxController{
  StreamController<List<KnowledgeData>> treeController = StreamController<List<KnowledgeData>>();

  Stream<List<KnowledgeData>> get treeStream => treeController.stream;

  StreamController<List<NavigationData>> naviController = StreamController<List<NavigationData>>();

  Stream<List<NavigationData>> get naviStream => naviController.stream;

  late int _type;
  set type(int type) => _type = type;

  @override
  void onReady(){
    super.onReady();
    _type == SystemTreeFragment.TYPE_NAVI
        ? requestNavigation()
        : requestTree();
  }

  Future requestTree(){
    return WanContainer().wanRepository.getTree()
        .then((value)=>treeController.sink.add(value))
        .catchError((e)=>treeController.sink.addError(e))
        .whenComplete(() => {});
  }

  Future requestNavigation(){
    return WanContainer().wanRepository.getNavigation()
        .then((value)=>naviController.sink.add(value))
        .catchError((e)=>naviController.sink.addError(e))
        .whenComplete(() => {});
  }

  @override
  void onClose() {
    super.onClose();
    treeController.close();
    naviController.close();
  }
}
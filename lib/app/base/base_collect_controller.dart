import 'dart:async';

import 'package:flutter_getx/app/action/collect_action.dart';
import 'package:flutter_getx/app/base/token_controller.dart';
import 'package:flutter_getx/app/event/collect_event.dart';
import 'package:flutter_getx/app/utils/bus_util.dart';
import 'package:flutter_getx/app/extension/list_ext.dart';

abstract class BaseCollectController extends TokenController implements CollectAction{

  StreamSubscription<CollectEvent>? _subscriptionCollect;

  @override
  void onReady() {
    super.onReady();
    this.initEventBus();
  }

  @override
  void onClose() {
    super.onClose();
    _subscriptionCollect?.cancel();
  }

  void initEventBus() {
    _subscriptionCollect = BusUtil.eventBus.on<CollectEvent>().listen((event) {
      eventRefresh(event);
    });
  }

  void eventRefresh(CollectEvent event){
    if(event.type == CollectEvent.TYPE_REFRESH){
      onRefresh();
    }else if(event.type == CollectEvent.TYPE_PART){
      partRefresh(event);
    }
  }

  ///CollectEvent.TYPE_PART
  void partRefresh(CollectEvent event){
    var where = getArticleList().firstElement((element) => element.id == event.id);
    if(where != null)
      where.collect = event.collect;
    update();
  }

  ///收藏页/分享页(删除按钮的)是移除条目，其他文章列表不移除，所以需要在指定页面手动调用移除
  ///CollectEvent.TYPE_PART_REMOVE
  void partRemoveRefresh(CollectEvent event){
    getArticleList().removeWhere((element) => element.id == event.id);
    update();
  }
}
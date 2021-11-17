
import 'package:flutter_getx/app/data/article.dart';
import 'package:get/get.dart';
import 'package:flutter_getx/app/base/base_collect_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../container.dart';

class WenDaController extends BaseCollectController with StateMixin<List<Article>>{
  int _currentIndex = 0;

  List<Article> _articleList = [];

  @override
  List<Article> getArticleList() => _articleList;

  RefreshController refreshController = new RefreshController();

  @override
  onRefresh() {
    _currentIndex = 0;
    _articleList.clear();
    return _request(_currentIndex);
  }

  Future onLoadMore(){
    return _request(_currentIndex);
  }

  @override
  void onReady() {
    super.onReady();
    this.onRefresh();
  }

  @override
  void onClose(){
    super.onClose();
    refreshController.dispose();
  }

  Future _request(int num){
    return WanContainer().wanRepository.getWenDaList(num)
        .then((value){
      change(_articleList..addAll(value),status: RxStatus.success());
      if(value.length > 0){
        _currentIndex ++;
      }
    }).catchError((e){
      change(null,status: RxStatus.error(e));
    });
  }

}
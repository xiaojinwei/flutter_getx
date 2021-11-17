import 'dart:async';

import 'package:flutter_getx/app/base/base_collect_controller.dart';
import 'package:flutter_getx/app/data/article.dart';

import '../../../container.dart';

class ProjectListController extends BaseCollectController{

  int _currentIndex = 0;

  late int _cid;

  set cid(int cid) => _cid = cid;

  //Rx<List<Article>> articleList = Rx([]);
  StreamController<List<Article>> listController = StreamController<List<Article>>();

  Stream<List<Article>> get listStream => listController.stream;

  @override
  List<Article> getArticleList() => _articleList;

  List<Article> _articleList = [];

  @override
  void onReady() {
    super.onReady();
    this.onRefresh();
  }

  @override
  void onClose(){
    super.onClose();
    listController.close();
  }

  Future onRefresh(){
    _currentIndex = 0;
    _articleList.clear();
    return _request(_currentIndex);
  }

  Future onLoadMore(){
    return _request(_currentIndex);
  }

  Future _request(int num){
    return WanContainer().wanRepository.getProjectList(num,_cid)
        .then((value){
        listController.sink.add(_articleList..addAll(value));
        if(value.length > 0){
          _currentIndex ++;
        }
    }).catchError((e){
      listController.sink.addError(e);
    }).whenComplete(() => {});
  }

}
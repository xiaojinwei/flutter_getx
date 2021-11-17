import 'dart:async';

import 'package:flutter_getx/app/base/base_collect_controller.dart';
import 'package:flutter_getx/app/data/article.dart';
import 'package:flutter_getx/app/data/banner.dart';
import 'package:get/get.dart';

import '../../../container.dart';

class HomeController extends BaseCollectController{
  int _currentIndex = 0;

  List<Article> _articleList = [];
  StreamController<List<Article>> homeArticleController = StreamController<List<Article>>();
  Stream<List<Article>> get homeArticleStream => homeArticleController.stream;
  //Rx<List<Article>> articleList = Rx([]);
  Rx<List<BannerData>> bannerList = Rx([]);

  @override
  void onReady() {
    super.onReady();
    this.onRefresh();
  }

  @override
  void onClose(){
    super.onClose();
    homeArticleController.close();
  }

  @override
  Future onRefresh() {
    _currentIndex = 0;
    _articleList.clear();
    _requestBanner();
    return _requestTopArticle();
  }

  @override
  List<Article> getArticleList() => _articleList;

  Future onLoadMore(){
    return _requestArticleList(_currentIndex);
  }

  Future _requestBanner(){
    return WanContainer().wanRepository.getBanner()
        .then((value) => bannerList.value.addAll(value))
        .whenComplete(() => update(["id_home_banner"]));
  }

  Future _requestTopArticle(){
    return WanContainer().wanRepository.getTopArticle()
        .then((value){
      homeArticleController.sink.add(_articleList..addAll(value));
      _requestArticleList(_currentIndex);
    }).catchError((e){
      homeArticleController.sink.addError(e);
    }).whenComplete(() => {});
  }

  Future _requestArticleList(int num){
    return WanContainer().wanRepository.getArticleList(num)
        .then((value){
      homeArticleController.sink.add(_articleList..addAll(value));
      if(value.length > 0){
        _currentIndex ++;
      }
    }).catchError((e){
      homeArticleController.sink.addError(e);
    }).whenComplete(() => {});
  }

}
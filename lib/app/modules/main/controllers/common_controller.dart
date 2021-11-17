import 'package:get/get.dart';

import '../../../container.dart';

class CommonController extends GetxController {
  Future collect(int id,Function success,Function fail){
    return WanContainer().wanRepository.collect(id)
        .then((value) => success(value))
        .catchError(fail);
  }

  Future unCollect(int id,Function success,Function fail){
    return WanContainer().wanRepository.unCollectOriginId(id)
        .then((value) => success(value))
        .catchError(fail);
  }

  Future addShare(String title,String link,Function success,Function fail){
    return WanContainer().wanRepository.addShare(title,link)
        .then((value) => success(value))
        .catchError(fail);
  }

  Future deleteShare(int articleId,Function success,Function fail){
    return WanContainer().wanRepository.deleteShare(articleId)
        .then((value) => success(value))
        .catchError(fail);
  }
}
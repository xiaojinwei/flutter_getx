
import 'package:dio/dio.dart';
import 'package:flutter_getx/app/data/article.dart';
import 'package:flutter_getx/app/data/banner.dart';
import 'package:flutter_getx/app/data/knowledge.dart';
import 'package:flutter_getx/app/data/navigation.dart';
import 'package:flutter_getx/app/data/rank.dart';
import 'package:flutter_getx/app/data/tab_label.dart';
import 'package:flutter_getx/app/data/user_data.dart';
import 'package:flutter_getx/app/net/dio/http_dio.dart';
import 'package:sprintf/sprintf.dart';

import '../api.dart';

class WanRepository{
  Future<UserData> login(String username,String password)async{
    var reps = await HttpDio.instance.post(Api.LOGIN,data: FormData.fromMap({'username':username,'password':password}));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    var result = UserData.fromJson(reps.data);
    return result;
  }

  Future<UserData> register(String username,String password,String repassword)async{
    var reps = await HttpDio.instance.post(Api.REGISTER,data: FormData.fromMap({'username':username,'password':password,'repassword':repassword}));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    var result = UserData.fromJson(reps.data);
    return result;
  }

  Future<RankData> getCoinInfo()async{
    var reps = await HttpDio.instance.get(Api.COIN_INFO,);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    var result = RankData.fromJson(reps.data);
    return result;
  }

  Future<List<BannerData>> getBanner() async {
    var reps = await HttpDio.instance.get(Api.BANNER_URL);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<BannerData> result = [];
    reps.data.forEach((e){
      result.add(BannerData.fromJson(e));
    });
    return result;
  }

  Future<List<Article>> getTopArticle() async{
    var reps = await HttpDio.instance.get(Api.ARTICLE_TOP);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<Article> result = [];
    reps.data?.forEach((e){
      result.add(Article.fromJson(e));
    });
    return result;
  }

  Future<List<Article>> getArticleList(int num) async{
    var reps = await HttpDio.instance.get(sprintf(Api.HOME_ARTICLE_LIST,[num]));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<Article> result = [];
    reps.data['datas']?.forEach((e){
      result.add(Article.fromJson(e));
    });
    return result;
  }

  Future collect(int id) async {
    var resp = await HttpDio.instance.post(sprintf(Api.COLLECT,[id]));
    if(!resp.isSuccess()){
      return Future.error(resp.msg);
    }
    return Future.value();
  }

  Future unCollectOriginId(int id) async {
    var resp = await HttpDio.instance.post(sprintf(Api.UN_COLLECT_ORIGIN_ID,[id]));
    if(!resp.isSuccess()){
      return Future.error(resp.msg);
    }
    return Future.value();
  }

  Future addShare(String title,String link) async {
    var resp = await HttpDio.instance.post(Api.SHARE_ARTICLE,data: FormData.fromMap({"title":title,"link":link}));
    if(!resp.isSuccess()){
      return Future.error(resp.msg);
    }
    return Future.value();
  }

  Future deleteShare(int articleId) async {
    var resp = await HttpDio.instance.post(sprintf(Api.SHARE_ARTICLE_DELETE,[articleId]));
    if(!resp.isSuccess()){
      return Future.error(resp.msg);
    }
    return Future.value();
  }

  Future<List<TabLabel>> getProjectTab()async{
    var reps = await HttpDio.instance.get(Api.PROJECT_TAB);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<TabLabel> result = [];
    reps.data?.forEach((e){
      result.add(TabLabel.fromJson(e));
    });
    return result;
  }

  Future<List<Article>> getProjectList(int num,int cid) async{
    var reps = await HttpDio.instance.get(sprintf(Api.PROJECT_LIST,[num,cid]));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<Article> result = [];
    reps.data['datas']?.forEach((e){
      result.add(Article.fromJson(e));
    });
    return result;
  }

  Future<List<KnowledgeData>> getTree()async{
    var reps = await HttpDio.instance.get(Api.TREE);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<KnowledgeData> result = [];
    reps.data?.forEach((e){
      result.add(KnowledgeData.fromJson(e));
    });
    return result;
  }

  Future<List<NavigationData>> getNavigation()async{
    var reps = await HttpDio.instance.get(Api.NAVIGATION);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<NavigationData> result = [];
    reps.data?.forEach((e){
      result.add(NavigationData.fromJson(e));
    });
    return result;
  }

  Future<List<Article>> getTreeList(int num,int cid) async{
    var reps = await HttpDio.instance.get(sprintf(Api.TREE_LIST,[num,cid]));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<Article> result = [];
    reps.data['datas']?.forEach((e){
      result.add(Article.fromJson(e));
    });
    return result;
  }

  Future<List<TabLabel>> getWeChatTab()async{
    var reps = await HttpDio.instance.get(Api.WECHAT_TAB);
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<TabLabel> result = [];
    reps.data?.forEach((e){
      result.add(TabLabel.fromJson(e));
    });
    return result;
  }

  Future<List<Article>> getWebChatList(int num,int id) async{
    var reps = await HttpDio.instance.get(sprintf(Api.WECHAT_LIST,[id,num]));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<Article> result = [];
    reps.data['datas']?.forEach((e){
      result.add(Article.fromJson(e));
    });
    return result;
  }

  Future<List<Article>> getWenDaList(int num) async{
    var reps = await HttpDio.instance.get(sprintf(Api.WENDA_LIST,[num]));
    if(!reps.isSuccess()){
      return Future.error(reps.msg);
    }
    List<Article> result = [];
    reps.data['datas']?.forEach((e){
      result.add(Article.fromJson(e));
    });
    return result;
  }


}
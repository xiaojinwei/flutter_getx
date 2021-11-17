import 'package:flutter_getx/app/action/refresh_action.dart';
import 'package:flutter_getx/app/data/article.dart';

///用于Article列表收藏使用
abstract class CollectAction extends RefreshAction{
  ///整理刷新,调用刷新接口
  onRefresh();
  ///局部刷新
  ///找到对应的Article,将其collect致反，然后setState
  List<Article> getArticleList();
}
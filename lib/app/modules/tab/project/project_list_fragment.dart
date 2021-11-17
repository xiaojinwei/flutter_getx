import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx/app/data/article.dart';
import 'package:flutter_getx/app/modules/tab/project/project_list_controller.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:flutter_getx/app/widgets/article_item.dart';
import 'package:flutter_getx/app/widgets/refresh_scaffold.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProjectListFragment extends StatelessWidget{

  int cid;
  ProjectListFragment(this.cid) {
    Get.lazyPut(()=>ProjectListController()..cid = cid,tag: getTag());
  }

  String getTag(){
    return "tag_project_list_${cid}";
  }

  RefreshController _controller = new RefreshController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectListController>(tag:getTag(),builder: (controller){
      return StreamBuilder<List<Article>>(
          stream: controller.listStream,
          builder: (context,snapshot){
            return RefreshScaffold(
              loadStatus: Util.getLoadStatus(snapshot.hasError, snapshot.data),
              enablePullUp: true,
              controller: _controller,
              onRefresh: ({bool? isReload}){
                return controller.onRefresh();
              },
              onLoadMore: (){
                controller.onLoadMore().then((value) => _controller.loadComplete())
                    .catchError((e)=>_controller.loadFailed());
              },
              itemCount:snapshot.data?.length??0,
              itemBuilder: (context,index){
                return ArticleItemWidget(controller.getArticleList()[index],);
              },
              error: snapshot.error?.toString(),
            );
      });
    });
  }

}
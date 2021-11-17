import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx/app/modules/wenda/wenda_controller.dart';
import 'package:flutter_getx/app/widgets/article_item.dart';
import 'package:get/get.dart';
import 'package:flutter_getx/app/widgets/get_refresh_scaffold.dart';

class WenDaPage extends GetView<WenDaController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wenda".tr),
        centerTitle: true,
      ),
      body: controller.obr(
        controller: controller.refreshController,
        onRefresh: ({bool? isReload}){
          return controller.onRefresh();
        },
        onLoadMore: (){
          controller.onLoadMore().then((value) => controller.refreshController.loadComplete())
              .catchError((e)=>controller.refreshController.loadFailed());
        },
        itemBuilder: (context,index){
          return ArticleItemWidget(controller.getArticleList()[index],);
        },
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/tab/system/system_tree_controller.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:flutter_getx/app/widgets/refresh_scaffold.dart';
import 'package:flutter_getx/app/widgets/tree_item.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SystemTreeFragment extends StatelessWidget{

  static const TYPE_TREE = 0;
  static const TYPE_NAVI = 1;

  int type;

  SystemTreeFragment(this.type){
    Get.lazyPut(()=>SystemTreeController()..type = type,tag: getTag());
  }

  String getTag(){
    return "tag_tree_${type}";
  }

  RefreshController _controller = new RefreshController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemTreeController>(tag: getTag(),builder: (controller){
      return StreamBuilder<List>(
          stream: type == SystemTreeFragment.TYPE_NAVI ? controller.naviStream : controller.treeStream,
          builder: (context,snapshot){
            return RefreshScaffold(
              loadStatus: Util.getLoadStatus(snapshot.hasError, snapshot.data),
              enablePullUp: false,
              controller: _controller,
              onRefresh: ({bool? isReload}){
                return type == SystemTreeFragment.TYPE_NAVI ? controller.requestNavigation() : controller.requestTree();
              },
              itemCount:snapshot.hasData ? snapshot.data?.length??0 : 0,
              itemBuilder: (context,index){
                return TreeItem(snapshot.data?[index],);
              },
              error: snapshot.error?.toString(),
            );
        });
    });
  }

}
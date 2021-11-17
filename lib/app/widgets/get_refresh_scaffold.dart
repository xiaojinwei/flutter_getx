import 'package:flutter/material.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:get/get.dart';

import 'refresh_scaffold.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull;

extension StateExt<T> on StateMixin<T> {

  Widget obr({required pull.RefreshController controller,
      required OnRefreshCallback onRefresh,
      OnLoadMore? onLoadMore,
      required IndexedWidgetBuilder itemBuilder}){
    return SimpleBuilder(builder: (_){
      return RefreshScaffold(
        loadStatus: Util.getLoadStatusGet(status.isError, status.isLoading,status.isEmpty),
        enablePullUp: true,
        controller: controller,
        onRefresh: onRefresh,
        onLoadMore: onLoadMore,
        itemCount:(value is List ? (value as List).length :0),
        itemBuilder: itemBuilder,
        error: status.errorMessage,
      );
    });
  }
}
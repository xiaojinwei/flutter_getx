import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx/app/data/article.dart';
import 'package:flutter_getx/app/data/banner.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:flutter_getx/app/widgets/article_item.dart';
import 'package:flutter_getx/app/widgets/refresh_scaffold.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController>{

  RefreshController _controller = new RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller){
          return StreamBuilder(
            stream: controller.homeArticleStream,
            builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              return RefreshScaffold(
                loadStatus: Util.getLoadStatus(snapshot.hasError,snapshot.data),
                enablePullUp: true,
                controller: _controller,
                onRefresh: ({bool? isReload}){
                  return controller.onRefresh();
                },
                onLoadMore: (){
                  controller.onLoadMore().then((value) => _controller.loadComplete())
                      .catchError((e)=>_controller.loadFailed());
                },
                itemCount:snapshot.hasData ? snapshot.data?.length??0 + 1 : 0,
                itemBuilder: (BuildContext context, int index){
                  return index == 0 ? GetBuilder<HomeController>(id: "id_home_banner",builder: (controller){
                    return controller.bannerList.isBlank??true ? Container() :
                    _buildBanner(context,controller.bannerList.value);
                  }) :
                  ArticleItemWidget(controller.getArticleList()[index - 1],);
                },
                error: snapshot.error?.toString(),
              );
            },);
        },
      ),
    );
  }

  Widget _buildBanner(BuildContext context,List<BannerData>? list){
    if(list == null || list.isEmpty){
      return Container();
    }
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Swiper(
        autoplay: true,
        itemCount: list.length,
        pagination: new SwiperPagination(
            margin: EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(
                builder: (context,config){
                  return Container(
                    color: Color(0x599E9E9E),
                    height: 40.0,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(list[config.activeIndex].title??"",
                                style: TextStyle(fontSize: 12.0,color: Colors.white),),
                            )
                        ),
                        DotSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Theme.of(context).primaryColor,
                            size: 6.0,
                            activeSize: 6.0
                        ).build(context, config)
                      ],
                    ),
                  );
                }
            )
        ),
        //control: new SwiperControl(),
        itemBuilder: (context,index){
          return Image.network(list[index].imagePath??"");
        },
      ),
    );
  }

}
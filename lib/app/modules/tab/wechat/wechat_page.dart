import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/tab_label.dart';
import 'package:flutter_getx/app/modules/tab/wechat/wechat_controller.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:flutter_getx/app/widgets/refresh_status.dart';
import 'package:get/get.dart';

import 'wechat_list_fragment.dart';

class WeChatPage extends StatefulWidget {
  const WeChatPage({Key? key}) : super(key: key);

  @override
  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> with TickerProviderStateMixin{
  TabController? _controller;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<WeChatController>();
    return Scaffold(
      body: StreamBuilder<List<TabLabel>>(
        stream: controller.tabStream,
        builder: (context,snapshot){
          _controller = TabController(length: snapshot.data?.length??0, vsync: this);
          return RefreshStatusView(
            loadStatus: Util.getLoadStatus(snapshot.hasError, snapshot.data),
            onRefresh: () => controller.getTab(),
            child: _body(context, snapshot.data),
            error: snapshot.error?.toString(),
          );
        },
      ),
    );
  }

  _body(context,List<TabLabel>? tabs){
    if(tabs == null || tabs.isEmpty) return Container();
    return DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                labelColor: Colors.white,
                labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white,width: 3),
                    insets: EdgeInsets.fromLTRB(0, 0, 0, 0)
                ),
                tabs: tabs.map<Tab>((TabLabel tab){
                  return Tab(text: tab.name,);
                }).toList(),
              ),
            ),
            Flexible(child: TabBarView(
              controller: _controller,
              children: tabs.map<Widget>((TabLabel tab){
                return WeChatListFragment(tab.id??0);
              }).toList(),
            ))
          ],
        )
    );
  }
}

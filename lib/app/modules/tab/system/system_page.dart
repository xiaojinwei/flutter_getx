import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/tab/system/system_tree_fragment.dart';
import 'package:get/get.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> with TickerProviderStateMixin{

  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _controller?.length??0,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.white,width: 3),
                        insets: EdgeInsets.fromLTRB(0, 0, 0, 0)
                    ),
                    tabs: [Tab(text:"tab_system".tr),Tab(text:"tab_navigation".tr)],
                  ),
                ),
              ),
              Flexible(child: TabBarView(
                controller: _controller,
                children: [SystemTreeFragment(SystemTreeFragment.TYPE_TREE),SystemTreeFragment(SystemTreeFragment.TYPE_NAVI)],
              ))
            ],
          )
      ),
    );
  }
}

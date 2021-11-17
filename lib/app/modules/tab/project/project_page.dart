
import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/tab_label.dart';
import 'package:flutter_getx/app/modules/tab/project/project_controller.dart';
import 'package:flutter_getx/app/utils/util.dart';
import 'package:flutter_getx/app/widgets/refresh_status.dart';
import 'package:get/get.dart';

import 'project_list_fragment.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> with TickerProviderStateMixin{
  TabController? _controller;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProjectController>();
    return Scaffold(
      body: StreamBuilder<List<TabLabel>>(
        stream: controller.projectTabStream,
        builder: (context,snapshot){
          _controller = TabController(length: snapshot.data?.length??0, vsync: this);
          return RefreshStatusView(
            loadStatus: Util.getLoadStatus(snapshot.hasError, snapshot.data),
            onRefresh: () => controller.getProjectTab(),
            child: _body(context, snapshot.data),
            error: snapshot.error?.toString(),
          );
        },
      ),
    );
  }

  _body(context,List<TabLabel>? projectTabs){
    if(projectTabs == null || projectTabs.isEmpty) return Container();
    return DefaultTabController(
        length: projectTabs.length,
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
                tabs: projectTabs.map<Tab>((TabLabel tab){
                  return Tab(text: tab.name,);
                }).toList(),
              ),
            ),
            Flexible(child: TabBarView(
              controller: _controller,
              children: projectTabs.map<Widget>((TabLabel tab){
                return ProjectListFragment(tab.id??0);
              }).toList(),
            ))
          ],
        )
    );
  }
}


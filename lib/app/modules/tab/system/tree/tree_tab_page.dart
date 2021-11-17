import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/base_tree.dart';
import 'package:flutter_getx/app/modules/tab/system/tree/tree_list_fragment.dart';

class TreeTabPage extends StatefulWidget {
  TreeTabPage(this.title,this.baseList,int currentIndex,{Key? key}) :
        this.currentIndex = (currentIndex >= baseList.length ? 0 : currentIndex), super(key: key);

  List<BaseTree> baseList;

  int currentIndex = 0;

  String title = "";

  @override
  _TreeTabPageState createState() => _TreeTabPageState();
}

class _TreeTabPageState extends State<TreeTabPage> with TickerProviderStateMixin{

  TabController? _controller ;

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex:widget.currentIndex,length: widget.baseList.length, vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: DefaultTabController(
          length: _controller?.length??0,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
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
                  tabs: widget.baseList.map<Tab>((BaseTree tab){
                    return Tab(text: tab.showLabel(),);
                  }).toList(),
                ),
              ),
              Flexible(child: TabBarView(
                  controller: _controller,
                  children: List.generate(widget.baseList.length, (index) => TreeListFragment(widget.baseList[index]))
              ))
            ],
          )
      ),
    );
  }
}

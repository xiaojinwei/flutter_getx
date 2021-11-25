import 'package:flutter/material.dart';
import 'package:flutter_getx/app/demo/bar/nav_btn_bar_page.dart';
import 'package:get/get.dart';

class DemoMain extends StatelessWidget {
  DemoMain({Key? key}) : super(key: key);

  final data = [
    _ItemData('NavigatorBottomBar',()=>{
      Get.to(NavigatorBottomBarPage()),
    })
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Container(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index){
              var item = data[index];
              return ListTile(
                title: Text(item.title),
                onTap: ()=>item.action(),
              );
            },
          itemCount: data.length,
        ),
      ),
    );
  }
}

class _ItemData{
  String title;
  Function action;
  _ItemData(this.title,this.action);
}

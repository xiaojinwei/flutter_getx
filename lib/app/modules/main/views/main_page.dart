import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/main/views/main_drawer.dart';
import 'package:flutter_getx/app/modules/tab/home/home_page.dart';
import 'package:flutter_getx/app/modules/tab/project/project_page.dart';
import 'package:flutter_getx/app/modules/tab/system/system_page.dart';
import 'package:flutter_getx/app/modules/tab/wechat/wechat_page.dart';
import 'package:flutter_getx/app/widgets/bar_item.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainPage extends GetView<MainController> {

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    controller.onRefresh();
    var activeColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<MainController>(builder: (controller){
          return Text(controller.title);
        },),
        centerTitle: true,
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          ProjectPage(),
          WeChatPage(),
          SystemPage(),
        ],
        onPageChanged: controller.switchTab,
      ),
      /*bottomNavigationBar: GetBuilder<MainController>(builder: (controller){
        return BottomNavigationBar(
          currentIndex: controller.currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            _controller.jumpToPage(index);
            controller.switchTab(index);
          },
          items: [
            _itemBar(controller.currentIndex == 0, Icons.home, controller.titles[0], controller.defaultColor, controller.activeColor),
            _itemBar(controller.currentIndex == 1, Icons.account_box_outlined, controller.titles[1], controller.defaultColor, controller.activeColor),
            //_itemBar(false, null, controller.titles[4], controller.defaultColor, controller.defaultColor),
            _itemBar(controller.currentIndex == 2, Icons.camera, controller.titles[2], controller.defaultColor, controller.activeColor),
            _itemBar(controller.currentIndex == 3, Icons.account_circle, controller.titles[3], controller.defaultColor, controller.activeColor),
          ],
        );
      },),*/
      bottomNavigationBar: GetBuilder<MainController>(builder: (controller){
        return BottomBar(
          currentIndex: controller.currentIndex,
          shape: CircularNotchedRectangle(),
          onTap: (index){
            int pageIndex = index;
            switch(index){
              case 0:
                pageIndex = 0;
                break;
              case 1:
                pageIndex = 1;
                break;
              case 2:
                pageIndex = _controller.page as int;
                break;
              case 3:
                pageIndex = 2;
                break;
              case 4:
                pageIndex = 3;
                break;
            }
            _controller.jumpToPage(pageIndex);
            controller.switchTab(index);
          },
          items: [
            _itemBar2(controller.currentIndex == 0, Icons.home, controller.titles[0], controller.defaultColor, activeColor),
            _itemBar2(controller.currentIndex == 1, Icons.account_box_outlined, controller.titles[1], controller.defaultColor, activeColor),
            _itemBar2(false, null, controller.titles[2], controller.defaultColor, controller.defaultColor,isEnabled: false),
            _itemBar2(controller.currentIndex == 3, Icons.camera, controller.titles[3], controller.defaultColor, activeColor),
            _itemBar2(controller.currentIndex == 4, Icons.account_circle, controller.titles[4], controller.defaultColor, activeColor),
          ],
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {  },child: Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: MainDrawer(),
    );
  }

  _itemBar2(bool active,IconData? icon,String title,Color defaultColor,Color activeColor,{bool isEnabled = true}){
    return BarItem(
        icon: Icon(icon,color: defaultColor,),
        activeIcon: Icon(icon,color: activeColor,),
        title: Text(title,style: TextStyle(color: active ? activeColor : defaultColor),),
        isEnabled: isEnabled
    );
  }

  _itemBar(bool active,IconData? icon,String title,Color defaultColor,Color activeColor){
    return BottomNavigationBarItem(
        icon: Icon(icon,color: defaultColor,),
        activeIcon: Icon(icon,color: activeColor,),
        title: Text(title,style: TextStyle(color: active ? activeColor : defaultColor),)
    );
  }


}

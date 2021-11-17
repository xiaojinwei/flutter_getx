import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/base_tree.dart';
import 'package:flutter_getx/app/modules/tab/system/tree/tree_tab_page.dart';
import 'package:flutter_getx/app/modules/web/webview_page.dart';
import 'package:flutter_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';


class NavigatorUtil {

  ///跳转到指定页面
  static push(BuildContext context, Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  ///页面关闭
  static pop(BuildContext context){
    Navigator.pop(context);
  }

  ///当可以返回时返回，否则直接强制到主页
  static gotoMainOrBack(BuildContext context){
    if(Navigator.canPop(context)){
      pop(context);
    }else{
      gotoMainRemoveUntil(context);
    }
  }

  ///跳转到主页，并且移除所有页面
  static gotoMainRemoveUntil(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  ///跳转到登录页，并且移除所有页面
  static gotoLoginRemoveUntil(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  ///WebView
  static webView(BuildContext context,String url,{String? title,int? id,bool? isCollect}){
    push(context,WebViewPage(url,title: title,id: id,isCollect: isCollect??false,));
  }

  ///知识体系页
  static gotoSystemTree(BuildContext context,String title,List<BaseTree> baseList,int currentIndex){
    push(context, TreeTabPage(title,baseList,currentIndex));
  }

  static gotoLogin(){
    Get.toNamed(Routes.LOGIN);
  }
}
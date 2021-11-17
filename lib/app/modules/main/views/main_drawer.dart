import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getx/app/modules/main/controllers/main_controller.dart';
import 'package:flutter_getx/app/modules/setting/setting_page.dart';
import 'package:flutter_getx/app/routes/app_pages.dart';
import 'package:flutter_getx/app/utils/account_util.dart';
import 'package:flutter_getx/app/utils/app_util.dart';
import 'package:flutter_getx/app/utils/cookie_util.dart';
import 'package:flutter_getx/app/utils/navigator_util.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:flutter_getx/app/widgets/dynamic_flutter_logo.dart';
import 'package:flutter_getx/app/widgets/string_util.dart';
import 'package:flutter_getx/app/widgets/user_info.dart';
import 'package:get/get.dart';
//import 'package:mop/mop.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Color color = ThemeUtil.getThemeColorWithDark();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,//去除Drawer灰色头部
        children: [
          Container(
            child: DrawerHeader(
                padding: EdgeInsets.all(0),
                decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: UserAccountsDrawerHeader(
                  accountEmail: subView(),
                  accountName: Text(getTitle(),style: TextStyle(fontSize: 16),),
                  onDetailsPressed: () {
                    var loginData = AccountUtil.getUserData();
                    if(loginData != null) {
                      Get.dialog(SimpleDialog(
                        title: Text('user info'), children: <Widget>[
                        UserInfoWidget(loginData),
                        SimpleDialogOption(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                  'close', style: TextStyle(color: Theme
                                    .of(context)
                                    .primaryColor),),
                                onTap: () {
                                  Get.back();
                                },
                              )
                            ],
                          ),
                        )
                      ],));
                    }else{
                      //NavigatorUtil.gotoLogin(context);
                    }
                  },
                  currentAccountPicture: CircleAvatar(
                    child: DynamicFlutterLogo(54.0),
                  ),
                )
            ),
          ),
          ListTile(
            title: Text("wenda".tr),
            leading: Icon(Icons.question_answer,color: color),
            onTap: (){
              Get.back();
              Get.toNamed(Routes.WENDA);
            },
          ),
          ListTile(
            title: Text("setting".tr),
            leading: Icon(Icons.settings,color: color),
            onTap: (){
              Get.back();
              Get.to(SettingPage());
            },
          ),
          ListTile(
            title: Text('mop'),
            leading: Icon(Icons.moped,color: color),
            onTap: (){
              Get.back();
              //Mop.instance.openApplet('5e3c147a188211000141e9b1');
              //Mop.instance.openApplet('5e4d123647edd60001055df1',sequence: 1);
            },
          ),
          _logOutInView(context,color),
        ],
      ),
    );
  }

  _logOutInView(context,color){
    return AppUtil.instance.getAppState().userState.isLoginStatus() ?
    ListTile(
      title: Text("log_out".tr),
      leading: Icon(Icons.exit_to_app,color: color),
      onTap: (){
        NavigatorUtil.gotoLoginRemoveUntil(context);
        CookieUtil.deleteAllCookies();
      },
    )
        :
    ListTile(
      title: Text("log_in".tr),
      leading: Icon(Icons.open_in_browser,color: color),
      onTap: (){
        Get.back();
        Get.toNamed(Routes.LOGIN);
      },
    );
  }

  getTitle(){
    var userData = AccountUtil.getUserData();
    if(StringUtil.isNotEmpty(userData?.nickname)) return userData?.nickname??"";
    return userData?.username??"";
  }

  subView() {
    return GetBuilder<MainController>(builder: (controller) {
      var rank = controller.rxRankData.value;
      if(rank == null){
        AccountUtil.isLoginStatus().then((value){
          if(value) {
            controller.requestCoin();
          }
        });
        return Container(height: 10,);
      }
      return InkWell(
        onTap: () => {},
        child: Container(
          child: Row(
            children: <Widget>[
              Text("${"level".tr}: ${rank.rank??""}",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                "${"integral".tr}: ${rank.coinCount??"0"}",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              )
            ],
          ),
        ),
      );
    });
  }

}
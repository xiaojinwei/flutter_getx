import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx/app/event/setting_event.dart';
import 'package:flutter_getx/app/routes/app_pages.dart';
import 'package:flutter_getx/app/utils/bus_util.dart';
import 'package:flutter_getx/app/utils/language_util.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  StreamSubscription<SettingEvent>? _subscription;
  var modeTitle = "".obs;

  @override
  void initState() {
    super.initState();
    _subscription = BusUtil.eventBus.on<SettingEvent>().listen((event) {
      if(event.type == SettingEvent.TYPE_MODE_TITLE){
        modeTitle.value = event.modeTitle??"";
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Color color = ThemeUtil.getThemeColorWithDark();
    bool isDark = ThemeUtil.isDarkMode();
    modeTitle.value = ThemeUtil.getSelectedThemeModelLabel().title;
    return Scaffold(
      appBar: AppBar(
        title: Text("setting".tr),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.color_lens,color: color),
            title: Text("theme".tr),
            onTap: ()=>Get.toNamed(Routes.THEME),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: 24.0,
                  height: 24.0,
                  color: isDark ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.translate,color: color),
            title: Text("font".tr),
            onTap: ()=> Get.toNamed(Routes.FONT),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(ThemeUtil.getFontFamily(),
                  style: TextStyle(fontSize: 14,color:  color),),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.language,color: color,),
            title: Text("multi_language".tr),
            onTap: ()=>Get.toNamed(Routes.LANGUAGE),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(LanguageUtil.getSelectedLanguageModel().title,
                  style: TextStyle(fontSize: 14,color: color),),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
          ListTile(
            leading: Icon(!ThemeUtil.isDarkMode() ? Icons.brightness_6 : Icons.brightness_2,color: color),
            title: Text("dark_mode".tr),
            onTap: ()=>Get.toNamed(Routes.THEME_MODE),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Obx(()=>Text(modeTitle.value,
                  style: TextStyle(fontSize: 14,color: color),)),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          )
        ],
      ),
    );
  }
}


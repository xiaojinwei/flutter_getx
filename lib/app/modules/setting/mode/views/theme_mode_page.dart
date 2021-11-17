import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/setting/mode/controllers/theme_mode_controller.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:get/get.dart';

class ThemeModePage extends GetView<ThemeModeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dark_mode".tr),
        centerTitle: true,
      ),
      body: GetBuilder<ThemeModeController>(builder: (controller){
        controller.onRefresh();
        return ListView.builder(
          itemCount: controller.models.length,
          itemBuilder: (BuildContext context,int index){
            ThemeModelLabel model = controller.models[index];
            return ListTile(
              title: Text(model.title,),
              onTap: ()=>controller.switchThemeMode(model),
              trailing: new Radio(
                  value: true,
                  groupValue: model.isSelected == true,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    controller.switchThemeMode(model);
                  }),
            );
          },
        );
      },),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_getx/app/utils/language_util.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguagePage extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    controller.onRefresh();
    return Scaffold(
      appBar: AppBar(
        title: Text("multi_language".tr),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.supports.length,
        itemBuilder: (BuildContext context,int index){
          LanguageModel model = controller.supports[index];
          return ListTile(
            title: Text(model.title,),
            onTap: ()=>controller.switchLanguage(model.locale),
            trailing: new Radio(
                value: true,
                groupValue: model.isSelected == true,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  controller.switchLanguage(model.locale);
                }),
          );
        },
      ),
    );
  }
}

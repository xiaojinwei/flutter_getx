import 'package:flutter/material.dart';
import 'package:flutter_getx/app/common/const.dart';
import 'package:flutter_getx/app/modules/setting/theme/theme_controller.dart';
import 'package:flutter_getx/app/utils/theme_util.dart';
import 'package:get/get.dart';

import 'font_controller.dart';

class FontPage extends GetView<FontController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("font".tr),
        centerTitle: true,
      ),
      body: GetBuilder<FontController>(builder: (controller){
        return ListView.builder(
            itemCount: Const.supportFontFamily.length,
            itemBuilder: (context,index){
              var element = Const.supportFontFamily[index];
              return ListTile(
                title: Text(element,style: TextStyle(color: ThemeUtil.getThemeColorWithDark(),fontFamily: element),),
                subtitle: Text(Const.fontChina,style: TextStyle(color: ThemeUtil.getThemeColorWithDark(),fontFamily: element,)),
                trailing: Radio(
                    value: true,
                    groupValue: controller.getFontFamily() == element,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      controller.switchFontFamily(element);
                    }),
                onTap: ()=>controller.switchFontFamily(element),
              );
            }
        );
      },
      ),
    );
  }
}

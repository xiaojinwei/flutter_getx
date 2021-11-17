import 'package:flutter/material.dart';
import 'package:flutter_getx/app/modules/setting/theme/theme_controller.dart';
import 'package:get/get.dart';

class ThemePage extends GetView<ThemeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("theme".tr),
        centerTitle: true,
      ),
      body: GetBuilder<ThemeController>(builder: (controller){
        return ListView.builder(
            itemCount: Colors.primaries.length,
            itemBuilder: (context,index){
              var element = Colors.primaries[index];
              return GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              element[50]!,
                              element[100]!,
                              element[200]!,
                              element[300]!,
                              element[400]!,
                              element[500]!,
                              element[600]!,
                              element[700]!,
                              element[800]!,
                              element[900]!,
                            ]),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        height: 62,
                      ),
                      Positioned(
                        child: Colors.primaries[index] == controller.getThemeColor() ? Radio(
                            value: true,
                            groupValue: true,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              controller.changeThemeColor(Colors.primaries[index]);
                            }) : Container(),
                        right: 6,
                        top: 0,
                        bottom: 0,
                      )
                    ],
                  ),
                ),
                onTap: ()=>controller.changeThemeColor(Colors.primaries[index]),
              );
            }
        );
      },
      ),
    );
  }
}

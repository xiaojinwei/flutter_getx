import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_getx/app/data/rank.dart';
import 'package:flutter_getx/app/styles/colors.dart';
import 'package:get/get.dart';

import '../../../container.dart';

class MainController extends GetxController {

  Color defaultColor = colorStyles['light_gray']!;
  Color activeColor = colorStyles['primary']!;
  List<String> titles = ["tab_one".tr,"tab_two".tr,"tab_one_write".tr,"tab_three".tr,"tab_four".tr];
  String title = '';

  int currentIndex = 0;
  Rx<RankData?> rxRankData = Rx(null);

  void onRefresh(){
    activeColor = Theme.of(Get.context!).primaryColor;
    titles = ["tab_one".tr,"tab_two".tr,"tab_one_write".tr,"tab_three".tr,"tab_four".tr];
    title = titles[currentIndex];
  }

  @override
  void onInit() {
    super.onInit();
    title = titles[0];
    currentIndex = 0;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }

  void switchTab(int index){
    currentIndex = index;
    title = titles[index];
    update();
  }

  void requestCoin() {
    getCoinInfo().then((value){
      rxRankData.value = value;
      update();
    });
  }

  Future<RankData> getCoinInfo(){
    return WanContainer().wanRepository.getCoinInfo();
  }

}

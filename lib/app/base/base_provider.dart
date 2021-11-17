
import 'package:flutter_getx/app/net/api.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect{
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Api.BASE_URL;
  }
}
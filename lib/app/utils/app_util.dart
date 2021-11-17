import 'package:flutter_getx/app/data/app_state.dart';
import 'package:get_storage/get_storage.dart';

class AppUtil {

  static AppUtil? _instance;//唯一单例, _代表类私有,禁止外部直接访问
  factory AppUtil() => _getInstance();//使用工厂构造方法，通过Test()获取类时，返回唯一实例
  static AppUtil get instance => _getInstance();//通过静态变量instance获取实例

  static AppUtil _getInstance(){//这里真正生成唯一实例
    if(_instance==null){
      _instance = AppUtil._internal();//命名构造函数初始化唯一实例
    }
    return _instance!;
  }

  AppUtil._internal(){//命名构造函数
    //初始化
  }

  init()async{
    await GetStorage.init();
  }

  AppState getAppState(){
    final box = GetStorage();
    var read = box.read("key_app_state");
    return AppState.fromJson(read);
  }

  AppState saveAppState(AppState state){
    final box = GetStorage();
    box.write("key_app_state", state.toJson());
    return state;
  }

}
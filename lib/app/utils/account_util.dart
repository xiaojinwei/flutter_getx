import 'package:flutter_getx/app/data/user_data.dart';
import 'package:flutter_getx/app/data/user_state.dart';
import 'package:flutter_getx/app/utils/app_util.dart';
import 'cookie_util.dart';

class AccountUtil {
  static UserState getUserState(){
    return AppUtil.instance.getAppState().userState;
  }

  static UserData? getUserData(){
    return getUserState().user;
  }

  ///是否是登录状态
  static Future<bool> isLoginStatus()async{
    var userBool = getUserState().isLoginStatus();//用户信息
    var cookieBool = await CookieUtil.isExpired();//cookie是否过期
    return userBool && !cookieBool;
  }

}
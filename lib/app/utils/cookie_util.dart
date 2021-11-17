import 'dart:async';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_getx/app/net/api.dart';
import 'package:flutter_getx/app/net/dio/http_dio.dart';
import 'package:path_provider/path_provider.dart';

class CookieUtil {

  /// 获取cookie地址
  static Future<String> getCookiePath() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    return "${tempPath}/cookies/";
  }

  ///清除所有cookie
  static Future<Null> deleteAllCookies() async {
    var cookiePath = await getCookiePath();
    PersistCookieJar cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
    cookieJar.deleteAll();
  }

  ///持久化的cookie是否过期
  static Future<bool> isExpired()async{
    var cookiePath = await getCookiePath();
    PersistCookieJar cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));
    var cookies = await cookieJar.loadForRequest(Uri.parse(Api.BASE_URL));//加载对应URL的cookie
    if(cookies.isNotEmpty){
      return new SerializableCookie(cookies[0]).isExpired();//判断cookie是否过期
    }
    return true;
  }

  ///等待完成初始化
  ///1.等待加载持久化的cookie，并将其设置到dio拦截器，否则在首页调用接口时cookie还没有设置到dio
  static Future wait()async{
    return await HttpDio.instance.wait();
  }

}
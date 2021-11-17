import 'package:flutter_getx/app/data/user_data.dart';

class TokenEvent{
  UserData? loginData;

  TokenEvent({this.loginData});

  static TokenEvent createTokenEvent(UserData loginData){
    return TokenEvent(loginData: loginData);
  }
}
import 'package:flutter_getx/app/data/user_data.dart';

class UserState {
  UserData? user;

  UserState({this.user});

  factory UserState.fromJson(Map<String,dynamic>? json) => new UserState(
    user: json?['user'] == null ? null : UserData.fromJson(json?['user']),
  );

  Map<String,dynamic> toJson() => <String,dynamic>{
    'user':this.user == null ? null : this.user!.toJson(),
  //  'error':this.error
  };

  UserState copyWith({
    UserData? user,
  }){
    return new UserState(
      user: user??this.user,
    );
  }

  bool isLoginStatus(){
    return user != null;
  }

}
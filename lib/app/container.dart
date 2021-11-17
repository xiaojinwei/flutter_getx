import 'package:injector/injector.dart';

import 'net/repository/wan_repository.dart';

class WanContainer{
  static WanContainer _instance = WanContainer._();

  final _injector = Injector();

  WanContainer._() {
    registerRepository();
  }

  factory WanContainer(){
    return _instance;
  }

  void registerRepository() {
    _injector.registerSingleton<WanRepository>(() => WanRepository());
  }
  
  WanRepository get wanRepository {
    return _injector.get<WanRepository>();
  }

}
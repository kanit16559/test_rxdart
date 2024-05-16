import 'dart:async';

import 'package:get_it/get_it.dart';

import '../view_models/home_viewmodel.dart';





class AppInjections {

  AppInjections._internal();

  static final AppInjections internal = AppInjections._internal();

  factory AppInjections(){
    return internal;
  }

  GetIt get getItInstance => GetIt.instance;

  Future<void> initInjections() async {
    await _initArticlesInjections();
  }

  Future<void> _initArticlesInjections() async {
    getItInstance.registerFactory<HomeViewModel>(() => HomeViewModel());
  }
}


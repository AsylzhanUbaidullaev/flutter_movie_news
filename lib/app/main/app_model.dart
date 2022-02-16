import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_news/screens/home/ui/movie_list.dart';

import '../../base/base_bloc.dart';

class MyAppModel extends BaseBloc {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  init() async {
    log('init called');
    var result = await Connectivity().checkConnectivity();
    log('result from init is: $result');
    connectionStatusController.add(result);
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      log('Internet result is: $result');
      connectionStatusController.add(result);
    });
  }

  Widget getHomeScreen() {
    return MovieList();
    
  }
}

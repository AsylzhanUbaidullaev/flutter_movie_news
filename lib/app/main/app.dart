
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_news/base/base_provider.dart';
import 'package:flutter_movie_news/shared/size_config.dart';
import 'package:flutter_movie_news/shared/theme.dart';

import 'app_model.dart';
import 'navigator_state.dart';
import 'no_internet_screen.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;

  MyApp({required this.model});

  @override
  Widget build(BuildContext context) {
      // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return BaseProvider<MyAppModel>(
      model: model,
      builder: (context, model, child) {
        return StreamBuilder<Object>(
          stream: model.connectionStatusController.stream,
          builder: (context, snapshot) {
            return MaterialApp(

              debugShowCheckedModeBanner: false,
              title: 'Movie',
              navigatorKey: GlobalVariable.navState,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                fontFamily: 'Inter',
              ),
              home: snapshot.data == ConnectivityResult.none ||
                      snapshot.data == null
                  ? NoInternetScreen()
                  : model.getHomeScreen(),
            );
          },
        );
      },
    );
  }
}

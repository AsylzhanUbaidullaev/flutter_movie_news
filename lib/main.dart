import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_news/app/main/app.dart';
import 'package:flutter_movie_news/app/main/app_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Set device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight, DeviceOrientation.portraitDown]);

  // Проверка аутентификации
  final model = MyAppModel();
  await model.init();
  
  runApp(MyApp(model: model));
}

import 'package:flutter/material.dart';
import 'package:flutter_movie_news/shared/theme.dart';
import 'package:flutter_movie_news/shared/ui_helper.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.wifi_off,
                color: AppColors.primaryColor,
                size: 40,
              ),
            ),
            UIHelper.verticalSpace(20),
            Text(
              'Соеденение с интернетом потеряно, просим вас подключится к интернету.',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.grayColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

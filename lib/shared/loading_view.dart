import 'package:flutter/material.dart';
import 'package:flutter_movie_news/shared/theme.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_movie_news/shared/theme.dart';

class CustomActionDialog extends StatelessWidget {
  final Widget child;
  final BuildContext ctx;
  final bool isDismissible;
  final String? title;

  CustomActionDialog({
    required this.child,
    required this.isDismissible,
    required this.ctx,
    this.title = 'Нажмите для выбора',
  });

  @override
  Widget build(BuildContext contx) {
    return Builder(builder: (context) {
      return WillPopScope(
        onWillPop: () async => this.isDismissible ? true : false,
        child: Dialog(
          insetPadding: EdgeInsets.all(15),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          insetAnimationDuration: const Duration(milliseconds: 500),
          insetAnimationCurve: Curves.bounceIn,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(fit: FlexFit.loose, child: Text("$title")),
                      IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).pop(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.blackColor,
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                ),
                child,
              ],
            ),
          ),
        ),
      );
    });
  }
}

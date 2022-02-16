import 'package:flutter/material.dart';
import 'package:flutter_movie_news/base/base_provider.dart';
import 'package:flutter_movie_news/screens/home/provider/movie_details_provider.dart';
import 'package:flutter_movie_news/shared/loading_view.dart';
import 'package:flutter_movie_news/shared/theme.dart';
import 'package:flutter_movie_news/shared/ui_helper.dart';

class MovieDetails extends StatelessWidget {
  final int? movieId;

  const MovieDetails({Key? key, required this.movieId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String imgUrl = 'http://image.tmdb.org/t/p/w500/';
    return BaseProvider<MovieDetailsProvider>(
        model: MovieDetailsProvider(),
        onReady: (_) async => await _.init(context, movieId!),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  backgroundColor: AppColors.primaryColor,
                  appBar: AppBar(
                    backgroundColor: AppColors.appBarColor,
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    title: Text(
                      '${model.movieDetailsModel!.originalTitle}',
                      style: kLargeTitleTextStyle,
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          // height: 500,
                          height: model.size!.height * 0.6,
                          padding:
                              EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    AppColors.primaryColor.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image: new NetworkImage(
                                  imgUrl +
                                      model.movieDetailsModel!.posterPath!,
                                ),
                              ),
                            color: AppColors.darkGrayColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        color: AppColors.whiteColor),
                                    child: Text(
                                      '${model.movieDetailsModel!.voteAverage ?? 0.0}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        color: AppColors.whiteColor),
                                    child: const Icon(Icons.star,
                                        size: 40, color: AppColors.starColor),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: model.size!.width * 0.7,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 5),
                                    color: AppColors.whiteColor,
                                    child: Column(
                                      children: [
                                        Text(
                                          '${model.movieDetailsModel!.originalTitle}',
                                          style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  UIHelper.verticalSpace(10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 5),
                                    color: AppColors.whiteColor,
                                    child: Text(
                                      '${model.movieDetailsModel!.releaseDate}',
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(14),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '${model.movieDetailsModel?.overview}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        UIHelper.verticalSpace(30),
                      ],
                    ),
                  ),
                );
        });
  }
}

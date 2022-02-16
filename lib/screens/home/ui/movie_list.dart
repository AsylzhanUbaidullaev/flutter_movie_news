import 'package:flutter/material.dart';
import 'package:flutter_movie_news/base/base_provider.dart';
import 'package:flutter_movie_news/screens/home/provider/movie_list_provider.dart';
import 'package:flutter_movie_news/screens/home/ui/movie_details.dart';
import 'package:flutter_movie_news/shared/loading_view.dart';
import 'package:flutter_movie_news/shared/size_config.dart';
import 'package:flutter_movie_news/shared/theme.dart';
import 'package:flutter_movie_news/shared/ui_helper.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String imgUrl = 'http://image.tmdb.org/t/p/w500/';
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: Text(
          'News',
          style: kLargeTitleTextStyle,
        ),
      ),
      body: BaseProvider<MovieListProvider>(
          model: MovieListProvider(),
          onReady: (value) async => await value.init(context),
          builder: (context, model, child) {
            return model.isLoading
                ? LoadingView()
                : RefreshIndicator(
                  onRefresh: () => _refresh(model, context),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: model.movieModel!.results!.length,
                      itemBuilder: (context, index) {
                        return 
                        // model.allMoviesList.last.data!.isEmpty
                            // ? SizedBox()
                            // : 
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MovieDetails(
                                            movieId: model
                                                .movieModel!.results![index].id),
                                      ));
                                },
                                child: Container(
                                  height: model.size!.height * 0.4,
                                  // width: 200,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: new ColorFilter.mode(
                                          AppColors.primaryColor.withOpacity(0.5),
                                          BlendMode.dstATop),
                                      image: new NetworkImage(
                                        imgUrl +
                                            model.movieModel!.results![index]
                                                .posterPath!,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.appBarColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                color: AppColors.whiteColor),
                                            child: Text(
                                              '${model.movieModel!.results![index].voteAverage}',
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
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                color: AppColors.whiteColor),
                                            child: const Icon(Icons.star,
                                                size: 40,
                                                color: AppColors.starColor),
                                          ),
                                        ],
                                      ),
                                      // UIHelper.verticalSpace(15),
                                      Spacer(),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 45),
                                        child: Text(
                                          '${model.movieModel!.results![index].title}',
                                          textAlign: TextAlign.center,
                                          style: kLargeTitleTextStyle,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                    ),
                );
          }),
    );
  }

  Future<Null> _refresh(MovieListProvider model, context) async{
    model.init(context);
  }
}

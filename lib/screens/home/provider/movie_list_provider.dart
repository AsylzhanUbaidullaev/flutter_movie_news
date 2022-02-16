import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_movie_news/app/data/models/movie_model.dart';
import 'package:flutter_movie_news/app/data/services/movie_service.dart';
import 'package:flutter_movie_news/base/base_bloc.dart';
import 'package:flutter_movie_news/core/freezed/network_error.dart';
import 'package:flutter_movie_news/core/freezed/result.dart';

class MovieListProvider extends BaseBloc {
  ScrollController controller = ScrollController();
  MovieService _movieService = MovieService();
  MovieModel? movieModel;
  List<MovieModel> allMoviesList = [];
  Result<MovieModel, NetworkError>? movieData;
  bool isMoreMoviesLoading = false;
  Size? size;
  int page = 0;

  init(context) async {
    setLoading(true);

    controller.addListener(() async {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
        // Couldn't find pagination from backend

        // if (allMoviesList.last.links!.next != null) {
        //   print("Tubine zhettik");
          await moreMoviesLoad();
        // }
      }
    });

    await getMovieList();
    size = MediaQuery.of(context).size;

    setLoading(false);
  }


  getMovieList() async {
    movieData = await _movieService.getMovieList();
    movieData!.when(
      success: (response) {
        movieModel = response;
        notifyListeners();
      }, 
      failure: (error) {
        log('$error');
      }
    );
  }

  moreMoviesLoad() async {
    setIsMoreMoviesLoading(true);
    pageIncr();

    movieData = await _movieService.getMovieList();
    movieData!.when(success: (response) {
      allMoviesList.add(response);
      notifyListeners();
    }, failure: (error) {
      log('$error');
    });


    setIsMoreMoviesLoading(false);
  }

  setIsMoreMoviesLoading(bool value) {
    isMoreMoviesLoading = value;
    notifyListeners();
  }

  pageIncr() {
    page++;
    notifyListeners();
  }
}
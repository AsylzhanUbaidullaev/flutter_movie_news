import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_movie_news/app/data/models/movie_details_model.dart';
import 'package:flutter_movie_news/app/data/services/movie_service.dart';
import 'package:flutter_movie_news/base/base_bloc.dart';
import 'package:flutter_movie_news/core/freezed/network_error.dart';
import 'package:flutter_movie_news/core/freezed/result.dart';

class MovieDetailsProvider extends BaseBloc {
  Size? size;
  MovieDetailsModel? movieDetailsModel;
  MovieService _movieService = MovieService();

  init(context, int id) async {
    setLoading(true);
    size = MediaQuery.of(context).size;
    await getMovieDetails(id);
    setLoading(false);
  }

  getMovieDetails(int id) async {
    Result<MovieDetailsModel, NetworkError> detailData =
        await _movieService.getMovieDetails(id);
    detailData.when(success: (response) {
      movieDetailsModel = response;
      notifyListeners();
    }, failure: (error) {
      log('$error');
    });
  }
}

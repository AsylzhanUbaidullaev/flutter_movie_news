import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_news/app/clients/json_api_client.dart';
import 'package:flutter_movie_news/app/data/models/movie_details_model.dart';
import 'package:flutter_movie_news/app/data/models/movie_model.dart';
import 'package:flutter_movie_news/core/freezed/network_error.dart';
import 'package:flutter_movie_news/core/freezed/result.dart';
import 'package:flutter_movie_news/core/network/layers/network_executer.dart';

class MovieService {
  Future<Result<MovieModel, NetworkError>> getMovieList() async {
    return NetworkExecuter.execute(route: PlaceHolderClient.getMovieList(), responseType: MovieModel());
  }

  Future<Result<MovieDetailsModel, NetworkError>> getMovieDetails(
      int id) async {
    return NetworkExecuter.execute(
        route: PlaceHolderClient.getMovieDetails(id), responseType: MovieDetailsModel());
  }
}

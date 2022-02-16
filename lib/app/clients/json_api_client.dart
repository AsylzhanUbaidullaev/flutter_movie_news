
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie_news/core/network/interfaces/base_client_generator.dart';
part 'json_api_client.freezed.dart';

@freezed
class PlaceHolderClient extends BaseClientGenerator with _$PlaceHolderClient {
  // Routes
  const PlaceHolderClient._() : super();

  const factory PlaceHolderClient.getMovieList() = _GetMovieList;
  const factory PlaceHolderClient.getMovieDetails(int movieId) = _GetMovieDetails;

  @override
  String get baseURL => "https://api.themoviedb.org/3/movie/";

  // String apiKey = '7b79568d4e94ac70052f8e960cc7aa12';

  @override
  Future<Map<String, dynamic>> get header async {
    return {
      "accept": "application/json",
      
    };
  }

  @override
  String get path {
    return this.when<String>(
      // home
     getMovieList: () => 'popular?api_key=7b79568d4e94ac70052f8e960cc7aa12&language=en-US&page=1',
     getMovieDetails: (int movieId) => '$movieId?api_key=7b79568d4e94ac70052f8e960cc7aa12&language=en-US',
    );
  }

  @override
  String get method {
    return this.maybeWhen<String>(
      orElse: () => 'GET',
    
    );
  }

  @override
  dynamic get body {
    return this.maybeWhen(
      orElse: () {
        return null;
      },
    
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return this.maybeWhen(
      orElse: () {
        return null;
      },
     
    );
  }
}

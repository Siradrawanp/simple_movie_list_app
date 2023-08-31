import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../constant/constants.dart';
import 'package:movie_app/src/features/movie_list/data/model/movie_model.dart';

abstract class MovieRemoteDataSources {
  Future<MovieModel> getMovieList();
}

class MovieRemoteDataSourcesImpl extends MovieRemoteDataSources {
  final Dio _dio = Dio();
  
  @override
  Future<MovieModel> getMovieList() async {
    final response = await _dio.get(Urls.apiUrl);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.data));
    } else {
      throw Exception();
    }
  }
}
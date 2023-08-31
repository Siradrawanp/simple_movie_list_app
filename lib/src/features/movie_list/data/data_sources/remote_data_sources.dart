import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/src/constant/constants.dart';

import '../model/movie_model.dart';

abstract class MovieRemoteDataSources {
  Future<List<MovieModel>> getMovieList();
}

class MovieRemoteDataSourcesImpl extends MovieRemoteDataSources {
  final Dio _dio = Dio();
  
  @override
  Future<List<MovieModel>> getMovieList() async {
    try {
      final response = await _dio.get(Urls.apiUrl);
      if (response.statusCode == 200) {
        if (response.data != null) {
          final List<dynamic> jsonData = response.data;
          return jsonData.map((json) => MovieModel(
            title: json["Title"], 
            year: json["Year"], 
            runtime: json["Runtime"], 
            poster: json["Poster"] ?? "no image")).toList();
          
        } else {
          throw Exception('No data returned from API');
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      log("remote $e");
      throw Exception('Failed to fetch data');
    }
  }
}

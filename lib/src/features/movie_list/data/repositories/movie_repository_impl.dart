import 'dart:developer';

import '../../domain/repositories/movie_repository.dart';
import '../data_sources/remote_data_sources.dart';
import '../model/movie_model.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSources movieRemoteDataSources;
  MovieRepositoryImpl({
    required this.movieRemoteDataSources,
  });

  @override
  Future<List<MovieModel>> getMovieList() async {
    try {
      final result = await movieRemoteDataSources.getMovieList();
      return result.toList();
    } catch (e) {
      log("movie repos $e");
      throw Exception();
    }
  }
}
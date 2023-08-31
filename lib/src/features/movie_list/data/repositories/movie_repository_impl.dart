// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/src/features/movie_list/data/data_sources/remote_data_sources.dart';
import 'package:movie_app/src/features/movie_list/domain/entities/movie.dart';
import 'package:movie_app/src/features/movie_list/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSources movieRemoteDataSources;
  MovieRepositoryImpl({
    required this.movieRemoteDataSources,
  });

  @override
  Future<MovieEntity> getMovieList() async {
    try {
      final result = await movieRemoteDataSources.getMovieList();
      return result.toEntity();
    } catch (e) {
      throw Exception();
    }
  }
}

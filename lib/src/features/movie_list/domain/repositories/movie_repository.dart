import '../entities/movie.dart';

abstract class MovieRepository {
  Future<MovieEntity> getMovieList();
}

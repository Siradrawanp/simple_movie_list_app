import '../../data/model/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getMovieList();
}

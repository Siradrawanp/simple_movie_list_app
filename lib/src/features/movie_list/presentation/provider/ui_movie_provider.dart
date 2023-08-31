import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/movie_model.dart';
import '../../domain/usecase/movie_provider.dart';

final getMovieListProvider = FutureProvider<List<MovieModel>>(
  (ref) async {
    return ref.watch(movieRepositoryProvider).getMovieList();
  },
);
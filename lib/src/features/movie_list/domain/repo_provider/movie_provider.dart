import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_sources/remote_data_sources.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../repositories/movie_repository.dart';

final movieDataSourceProvider = Provider<MovieRemoteDataSources>(
  (ref) {
    return MovieRemoteDataSourcesImpl();
  },
);

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    try {
      final MovieRemoteDataSources dataSources = ref.watch(movieDataSourceProvider);
      return MovieRepositoryImpl(movieRemoteDataSources: dataSources);
    } catch (e) {
      log("domain repos $e");
      throw Exception("here");
    }
  },
);

import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String year;
  final String runtime;
  final String poster;
  
  const MovieEntity({
    required this.title,
    required this.year,
    required this.runtime,
    required this.poster,
  });
  
  @override
  List<Object> get props => [title, year, runtime, poster];
}

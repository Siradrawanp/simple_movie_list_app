import 'dart:convert';
List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  String title;
  String year;
  String runtime;
  String poster;

  MovieModel({
    required this.title,
    required this.year,
    required this.runtime,
    required this.poster,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["Title"],
        year: json["Year"],
        runtime: json["Runtime"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Runtime": runtime,
        "Poster": poster,
      };
}

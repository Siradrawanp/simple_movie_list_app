class Movie {
  String? title;
  String? year;
  String? runtime;
  String? poster;

  Movie({this.title, this.year, this.runtime, this.poster});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    runtime = json['Runtime'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Runtime'] = runtime;
    data['Poster'] = poster;
    return data;
  }
}

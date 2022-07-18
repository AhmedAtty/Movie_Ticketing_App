class MovieModel {
  final int id;
  final double popularity;
  final String title;
  // ignore: non_constant_identifier_names
  final String poster_path;
  // ignore: non_constant_identifier_names
  final String release_date;
  // ignore: non_constant_identifier_names
  final String original_title;
  // ignore: non_constant_identifier_names
  final String backdrop_path;
  // ignore: non_constant_identifier_names
  final String original_language;
  final String overview;
  // ignore: non_constant_identifier_names
  final double vote_average;

//<editor-fold desc="Data Methods">

  const MovieModel({
    required this.id,
    required this.popularity,
    required this.title,
    // ignore: non_constant_identifier_names
    required this.poster_path,
    // ignore: non_constant_identifier_names
    required this.release_date,
    // ignore: non_constant_identifier_names
    required this.original_title,
    // ignore: non_constant_identifier_names
    required this.backdrop_path,
    // ignore: non_constant_identifier_names
    required this.original_language,
    required this.overview,
    // ignore: non_constant_identifier_names
    required this.vote_average,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'popularity': popularity,
      'title': title,
      'poster_path': poster_path,
      'release_date': release_date,
      'original_title': original_title,
      'backdrop_path': backdrop_path,
      'original_language': original_language,
      'overview': overview,
      'vote_average': vote_average,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int,
      popularity: map['popularity'] as double,
      title: map['title'] as String,
      poster_path: map['poster_path'] as String,
      release_date: map['release_date'] as String,
      original_title: map['original_title'] as String,
      backdrop_path: map['backdrop_path'] as String,
      original_language: map['original_language'] as String,
      overview: map['overview'] as String,
      vote_average: map['vote_average'] as double,
    );
  }

//</editor-fold>
}

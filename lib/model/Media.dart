import 'package:flutter_movie_db/common/Util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);

  String getBackDropUrl() => getLargePictureUrl(posterPath);

  String getGenres() => getGenreValues(genreIds);

  int getRealeaseYear() {
    if (releaseDate == null || releaseDate == "") {
      return 0;
    }

    return DateTime
        .parse(releaseDate)
        .year;
  }

  factory Media(Map jsonMap) {
    return Media.deserialize(jsonMap);
  }

  Media.deserialize(Map json)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json["title"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json["release_date"],
        genreIds = json["genre_ids"].toList();
}

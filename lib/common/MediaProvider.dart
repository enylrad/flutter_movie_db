import 'package:flutter_movie_db/common/HttpHandler.dart';
import 'package:flutter_movie_db/model/Media.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShows(category: category);
  }
}

enum MediaType { movie, show }

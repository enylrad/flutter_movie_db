import 'package:flutter_movie_db/common/HttpHandler.dart';
import 'package:flutter_movie_db/model/Media.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchMovies();
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia() {
    return _client.fetchShows();
  }
}

enum MediaType { movie, show }

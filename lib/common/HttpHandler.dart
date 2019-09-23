import 'dart:async';
import 'dart:convert';

import 'package:flutter_movie_db/common/KeyConstants.dart';
import 'package:flutter_movie_db/model/Media.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var uri = Uri.https(_baseUrl, "3/movie/popular", {
      "api_key": API_KEY_MOVILES_DB,
      "language": _language,
      "page": _language
    });

    return getJson(uri).then(
        (data) => data["results"].map<Media>((item) => Media(item)).toList());
  }
}

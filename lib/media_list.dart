import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_db/common/HttpHandler.dart';

import 'model/Media.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Image.network(_media[index].getPosterUrl()),
            ],
          );
        },
      ),
    );
  }
}

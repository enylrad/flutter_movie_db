import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_db/common/MediaProvider.dart';
import 'package:flutter_movie_db/media_list_item.dart';

import 'model/Media.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  String category;

  MediaList(this.provider, this.category);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = List();

  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = List();
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var medias = await widget.provider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(medias);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return MediaListItem(_media[index]);
        },
      ),
    );
  }
}

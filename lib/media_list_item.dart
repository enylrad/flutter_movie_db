import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Stack(
              children: <Widget>[
                getImageBackground(),
                getBackgroundDetails(),
                getTitleAndGenre(),
                getRatingAndDateRelease(),
              ],
            )));
  }

  Positioned getBackgroundDetails() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900].withOpacity(0.5),
        ),
        constraints: BoxConstraints.expand(height: 55.0),
      ),
    );
  }

  Positioned getRatingAndDateRelease() {
    return Positioned(
      right: 10.0,
      bottom: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(media.voteAverage.toString()),
              Container(width: 4.0),
              Icon(
                Icons.star,
                color: Colors.white,
                size: 16.0,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(media.getRealeaseYear().toString()),
              Container(width: 4.0),
              Icon(
                Icons.date_range,
                color: Colors.white,
                size: 16.0,
              )
            ],
          ),
        ],
      ),
    );
  }

  Positioned getTitleAndGenre() {
    return Positioned(
      left: 10.0,
      bottom: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Text(
              media.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: 250.0,
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              media.getGenres(),
              style: TextStyle(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  FadeInImage getImageBackground() {
    return FadeInImage.assetNetwork(
      placeholder: "assets/placeholder.jpg",
      image: media.getBackDropUrl(),
      fit: BoxFit.cover,
      height: 200.0,
      width: double.infinity,
      fadeInDuration: Duration(milliseconds: 40),
    );
  }
}

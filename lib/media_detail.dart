import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'model/Media.dart';

class MediaDetail extends StatelessWidget {
  final Media media;

  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  getImageMedia(),
                  SizedBox(height: 20.0),
                  getTitleAndRating(),
                  Column(
                    children: <Widget>[
                      Text(
                        media.overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: "Arvo"),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container getTitleAndRating() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              media.title,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white, fontSize: 25.0, fontFamily: "Arvo"),
            ),
          ),
          Text(
            "${media.voteAverage.toString()}/10",
            style: TextStyle(
                color: Colors.white, fontSize: 18.0, fontFamily: "Arvo"),
          )
        ],
      ),
    );
  }

  Container getImageMedia() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      width: 390.0,
      height: 390.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(
              media.getPosterUrl(),
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
                offset: Offset(0.0, 10.0)),
          ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/common/MediaProvider.dart';
import 'package:flutter_movie_db/media_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  PageController _pageController;
  int _page = 0;

  MediaType mediaType = MediaType.movie;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Movie"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: PageView(
        children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _page = index;
          });
        },
      ),
      drawer: _getDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  Drawer _getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Material(),
          ),
          ListTile(
            title: Text("Peliculas"),
            trailing: Icon(Icons.local_movies),
            onTap: () {
              _changeMediaType(MediaType.movie);
              Navigator.of(context).pop();
            },
            selected: mediaType == MediaType.movie,
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text("Televisión"),
            trailing: Icon(Icons.live_tv),
            onTap: () {
              _changeMediaType(MediaType.show);
              Navigator.of(context).pop();
            },
            selected: mediaType == MediaType.show,
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text("Cerrar"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return mediaType == MediaType.movie
        ? [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text("Populares")),
      BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text("Próximamente")),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text("Mejor valoradas")),
    ]
        : [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text("Populares")),
      BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text("En el aire")),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text("Mejor valoradas")),
    ];
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList() {
    return (mediaType == MediaType.movie)
        ? <Widget>[
      MediaList(movieProvider, "popular"),
      MediaList(movieProvider, "upcoming"),
      MediaList(movieProvider, "top_rated"),
    ]
        : <Widget>[
      MediaList(showProvider, "popular"),
      MediaList(showProvider, "on_the_air"),
      MediaList(showProvider, "top_rated"),
    ];
  }

  void _navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}

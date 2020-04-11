import 'package:finalmovies/src/constant/global.dart';
import 'package:finalmovies/src/ui/detail/detail_page.dart';
import 'package:finalmovies/src/ui/widget/category/category.dart';
import 'package:finalmovies/src/ui/widget/movie_list/movie_list.dart';
import 'package:finalmovies/src/ui/widget/slideshow/slideshow.dart';
import 'package:finalmovies/src/utils/my_scroll_behavior.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("res/graphic/index.png"),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,

      ),
      body: Container(
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SlideShowView(onItemInteraction: (movieId) {
                  _navigateToMovieDetail(context, movieId);
                },),
                Padding(padding: EdgeInsets.only(top: 10),),
                MovieCategory(),
                Padding(padding: EdgeInsets.only(top: 10),),
                _buildMyList(context),
                Padding(padding: EdgeInsets.only(top: 10),),
                _buildPopularList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMyList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("My List Of Movies", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Muli"),
                  ),
                ),
                Icon(Icons.arrow_forward, color: Colors.black,)
              ],
            ),
          ),
          MovieListView(type: MovieListType.topRated, onItemInteraction: (movieId) {
            _navigateToMovieDetail(context, movieId);
          },)
        ],
      ),
    );
  }

  _buildPopularList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text("Popular  Movies", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Muli"),
                  ),
                ),
                Icon(Icons.arrow_forward, color: Colors.black,)
              ],
            ),
          ),
          MovieListView(type: MovieListType.popular, onItemInteraction: (movieId) {
            _navigateToMovieDetail(context, movieId);
          },)
        ],
      ),
    );
  }

  _navigateToMovieDetail(BuildContext context, int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movieId: movieId),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

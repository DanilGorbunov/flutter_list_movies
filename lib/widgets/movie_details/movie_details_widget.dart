import 'package:catalogs/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:catalogs/widgets/movie_details/movie_details_main_screen_cast_widget.dart';
import 'package:flutter/material.dart';

class MoviesDetailsWidget extends StatefulWidget {
  final int movieId;
  MoviesDetailsWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MoviesDetailsWidget> createState() => _MoviesDetailsWidgetState();
}

class _MoviesDetailsWidgetState extends State<MoviesDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie name'),
        ),
        body: ColoredBox(
          color: Color.fromRGBO(22, 21, 25, 1.0),
          child: ListView(
            children: [
              MoviesDetailsMainInfoWidget(),
              MovieDetailsMainScreenCastWidget(),
            ],
          ),
        ));
  }
}

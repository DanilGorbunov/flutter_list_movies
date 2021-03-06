import 'package:flutter/material.dart';
import 'package:catalogs/widgets/images.dart';

class Movie {
  // class for list movies
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    //создаем экземпляры класса movies
    // нельзя сделать класс константным если в нем есть неконстантные поля
    Movie(
      id: 1,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 2,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 3,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 4,
      imageName: AppImages.open.assetName,
      title: 'Tigi combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 5,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 6,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 7,
      imageName: AppImages.open.assetName,
      title: 'pin combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 8,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 9,
      imageName: AppImages.open.assetName,
      title: 'Get combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 10,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 11,
      imageName: AppImages.open.assetName,
      title: 'Mortal combat',
      time: 'April 4, 2021',
      description: 'Wndn bjkbk bkbkbk kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
    Movie(
      id: 12,
      imageName: AppImages.open.assetName,
      title: 'Kavabanga combat 2',
      time: 'April 4, 2022',
      description: 'Dffhh dsfsdfsf kbkbk kjbkbk kjbkjbbbkk bkk',
    ),
  ];
  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTab(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movies_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTab(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true, //чтобы можно было задать fillColor
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:catalogs/Theme/app_colors.dart';
import 'package:catalogs/widgets/auth_widget.dart';
import 'package:catalogs/widgets/main_screen/main_screen_widget.dart';
import 'package:catalogs/widgets/movie_details/movie_details_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainDarkBlue,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              //backgroundColor: AppColors.mainDarkBlue,
              //selectedItemColor: Colors.white,
              // unselectedItemColor: Colors.grey,
              )),
      routes: {
        '/auth': (context) => AuthWidget(),
        //'/': (context) => AuthWidget(),
        //dsad - delet arrow button from main page
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/movies_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MoviesDetailsWidget(movieId: arguments);
          } else {
            return MoviesDetailsWidget(movieId: 0);
          }
        },
      },
      //home: AuthWidget(),
      initialRoute: '/auth',
      //initialRoute: '/main_screen',

      //This is for noname pages
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute<void>(builder: (context) {
      //     return Scaffold(
      //       body: Center(
      //         child: Text('Navigation Error'),
      //       ),
      //     );
      //   });
      // }
    );
  }
}

class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              //pop - back return
              // if (Navigator.of(context).canPop()) ;
            },
            child: Text('Enter'),
          ),
        ));
  }
}

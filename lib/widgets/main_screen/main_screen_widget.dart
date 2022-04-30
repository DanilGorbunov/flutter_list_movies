import 'package:catalogs/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:catalogs/widgets/movie_list/movie_list_widget.dart';
import 'package:spider/spider.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  //static List<Widget> _widgetOptions = <Widget>[];

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text(
            'Index 0: News',
          ),
          MovieListWidget(),
          Text(
            'Index 2: TV shows',
          ),
        ],
      ),

      //Center(child: _widgetOptions[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV shows',
          ),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}

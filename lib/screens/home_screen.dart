import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_api/providers/movie_provider.dart';
import 'package:movieapp_api/screens/fav_screen.dart';
import 'package:movieapp_api/screens/profile_screen.dart';
import 'package:movieapp_api/screens/search_screen.dart';
import 'package:movieapp_api/screens/signin_screen.dart';
import 'package:movieapp_api/search/movie_search_delegate.dart';
import 'package:movieapp_api/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:movieapp_api/widgets/bottomnavigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  static const String routeName = 'Home';

}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Movies on Cines'),
        centerTitle: true,
        elevation: 0,
      ),*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 10.0),
                  child: Text("IMOVE.",style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold, color:Colors.amber)),
                ),
              ],
            ),
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            const SizedBox(height: 10),
            MovieSlider(
              movies: moviesProvider.onDisplayMovies,
              title: 'Now Playing',
              onNextPage: () => moviesProvider.getOnDiaplayMovies(),
            ),
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popular Movies',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            MovieSlider(
              movies: moviesProvider.topRated,
              title: 'AllTime Top Rated Movies',
              onNextPage: () => moviesProvider.getTopRatedMovies(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
  }














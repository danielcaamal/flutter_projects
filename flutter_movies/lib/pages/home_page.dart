import 'package:flutter/material.dart';
import 'package:flutter_movies/delegates/search_delegate.dart';
import 'package:flutter_movies/providers/movie_provider.dart';
import 'package:flutter_movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Movies on cinema")),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Principal Card
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              title: 'Populares',
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}

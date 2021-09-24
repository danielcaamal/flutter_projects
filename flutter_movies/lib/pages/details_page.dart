import 'package:flutter/material.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          movie: movie,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie: movie),
          _Overview(
            movie: movie,
          ),
          CastingCards(movieId: movie.id),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            color: Colors.black12,
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16.0),
            )),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackDropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final Size _mediaQuery = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              fit: BoxFit.cover,
              height: 150.0,
              width: 100.0,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: _textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: _textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: <Widget>[
                    _stars(movie.voteAverage),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text('${movie.voteAverage}', style: _textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _stars(double average) {
  List<Widget> listStar = [];
  bool half = false;
  for (int i = 1; i <= 5; i++) {
    if ((average / 2).floor() >= i) {
      listStar.add(const Icon(
        Icons.star,
        size: 16.0,
        color: Colors.yellow,
      ));
    } else if (average / 2 - (average / 2).floorToDouble() >= 0.5 &&
        half == false) {
      half = true;
      listStar.add(const Icon(
        Icons.star_half,
        size: 16.0,
        color: Colors.yellow,
      ));
    } else {
      listStar.add(const Icon(
        Icons.star_border,
        size: 16.0,
        color: Colors.yellow,
      ));
    }
  }

  return Row(
    children: listStar,
  );
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

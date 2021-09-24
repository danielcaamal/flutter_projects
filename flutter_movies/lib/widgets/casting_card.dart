import 'package:flutter/material.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
        future: moviesProvider.getMovieCast(movieId),
        builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              width: double.infinity,
              height: 180.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final List<Cast> cast = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 180.0,
            margin: const EdgeInsets.only(bottom: 30, right: 10, left: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, int index) => _CastCard(
                      cast: cast[index],
                    )),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;
  const _CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 110,
      height: 100,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(cast.fullProfilePath),
              height: 140.0,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

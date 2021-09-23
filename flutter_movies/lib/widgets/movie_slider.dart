import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movies/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  const MovieSlider({Key? key, required this.movies, this.title = 'Populares'})
      : super(key: key);
  final textStyle =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const SizedBox(
          width: double.infinity,
          height: 260.0,
          child: Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
      width: double.infinity,
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: textStyle,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) {
                  return _MoviePoster(
                    movie: movies[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

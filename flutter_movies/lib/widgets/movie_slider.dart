import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movies/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final Function onNextPage;
  const MovieSlider(
      {Key? key,
      required this.movies,
      required this.onNextPage,
      this.title = 'Populares'})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final textStyle =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // TODO: implement init
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
        print("ON NEXT PAGE");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
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
              widget.title,
              style: textStyle,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, int index) {
                  return _MoviePoster(
                    movie: widget.movies[index],
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
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
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

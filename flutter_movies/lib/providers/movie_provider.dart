import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movies/helpers/debouncer.dart';
import 'package:flutter_movies/models/models.dart';
import 'package:flutter_movies/models/search_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '43e17a7eb93e48b2d8dd95baff90755b';
  String _language = 'es-ES';
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _streamMovieController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream => _streamMovieController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  void getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  void getPopularMovies() async {
    final jsonData = await _getJsonData('3/movie/popular', ++_popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) {
      return moviesCast[movieId]!;
    }
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> getMoviesByQuery(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final jsonData = await http.get(url);
    final searchResponse = SearchResponse.fromJson(jsonData.body);
    return searchResponse.results;
  }

  void getSuggestionByQuery(String query) async {
    debouncer.value = "";
    debouncer.onValue = (value) async {
      final results = await getMoviesByQuery(value);
      _streamMovieController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });
    Future.delayed(Duration(milliseconds: 301)).then((value) => timer.cancel());
  }
}

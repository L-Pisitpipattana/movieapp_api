import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:movieapp_api/helpers/debouncer.dart';
import 'package:movieapp_api/models/models.dart';
import 'package:movieapp_api/models/search_response.dart';
import 'package:movieapp_api/models/movieup.dart';

class MovieProvider extends ChangeNotifier {

  final String _apiKey = 'e1a2ba2794e480f50fe96b98f17c03fd';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRated = [];
  List<Movie> Upcoming = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;
  int _topRatedPage = 0;


  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionStreamController.stream;

  MovieProvider() {
    getOnDiaplayMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
  }


  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, '3/movie/$endPoint', {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }
  getUpcomingMovies() async {
    final jsonData = await _getJsonData('upcoming');
    final upcomingResponse = UpcomingResponse.fromJson(jsonData);

    Upcoming = upcomingResponse.results;
    notifyListeners();
  }


  getOnDiaplayMovies() async {
    final jsonData = await _getJsonData('now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }


  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  getTopRatedMovies() async {
    _topRatedPage++;
    final jsonData = await _getJsonData('top_rated', _topRatedPage);
    final topRatedResponse = PopularResponse.fromJson(jsonData);

    topRated = [...topRated, ...topRatedResponse.results];
    notifyListeners();
  }

  Future<List<Movie>> getSimilarMovies(int id) async {
    final jsonData = await _getJsonData('$id/similar', 1);
    final similarResponse = PopularResponse.fromJson(jsonData);

    return similarResponse.results;
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
      'query': query,
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovie(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}

import 'package:flutter/cupertino.dart';
import 'package:gif_finder/model/gif.dart';
import 'package:gif_finder/model/services/api_status.dart';
import 'package:gif_finder/model/services/gif_service.dart';

class HomeScreenViewModel extends ChangeNotifier {
  bool _loading = false;
  bool _loadingMoreGifs = false;
  List<Gif> _gifs = [];
  String _errorMessage = '';
  String _searchQuery = '';

  bool get loading => _loading;
  bool get loadingMoreGifs => _loadingMoreGifs;
  List<Gif> get gifs => _gifs;
  String get error => _errorMessage;
  String get searchQuery => _searchQuery;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setLoadingMoreGifs(bool loading) {
    _loadingMoreGifs = loading;
    notifyListeners();
  }

  setGifs(List<Gif> gifs) {
    _gifs = gifs;
  }

  appendGifs(List<Gif> gifs) {
    _gifs.addAll(gifs);
  }

  setErrorMessage (String errorMessage) {
    _errorMessage = errorMessage;
  }

  searchGifs(String query) async {
    setLoading(true);

    _searchQuery = query;
    var response = await GifService.getGifs(query);

    if (response is Success) {
      setGifs(response.response as List<Gif>);
    }
    if (response is Failure) {
      setErrorMessage(response.errorResponse as String);
    }

    setLoading(false);
  }

  loadMoreGifs() async {
    setLoadingMoreGifs(true);

    var response = await GifService.getGifs(_searchQuery, _gifs.length);

    if (response is Success) {
      appendGifs(response.response as List<Gif>);
    }
    if (response is Failure) {
      setErrorMessage(response.errorResponse as String);
    }

    setLoadingMoreGifs(false);
  }

  clearGifs() {
    _gifs.clear();
    _searchQuery = '';
    notifyListeners();
  }
}

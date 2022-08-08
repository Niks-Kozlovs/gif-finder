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
  int _totalCount = 0;

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
    notifyListeners();
  }

  setErrorMessage (String errorMessage) {
    _errorMessage = errorMessage;
  }

  searchGifs(String query) async {
    setLoading(true);

    _searchQuery = query;
    var response = await GifService.getGifs(query);

    if (response is Success) {
      Map<String, dynamic> data = response.response as Map<String, dynamic>;
      setGifs(data["gifs"] as List<Gif>);
      _totalCount = data['count'];
    }
    if (response is Failure) {
      setErrorMessage(response.errorResponse as String);
    }

    setLoading(false);
  }

  loadMoreGifs() async {
    if (_loadingMoreGifs) {
      return;
    }

    if (_totalCount == _gifs.length) {
      return;
    }

    setLoadingMoreGifs(true);

    var response = await GifService.getGifs(_searchQuery, _gifs.length);

    if (response is Success) {
      Map<String, dynamic> data = response.response as Map<String, dynamic>;
      appendGifs(data["gifs"] as List<Gif>);
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

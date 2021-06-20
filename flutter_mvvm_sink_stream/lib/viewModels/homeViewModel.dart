import 'dart:async';

abstract class IHomeViewModel {
  Sink get inputSearchText;
  Stream<String> get outputSearchText;
  Sink get searchButtonPressed;
  Stream<String> get outputSearchResult;
  void dispose();
}

class HomeViewModel implements IHomeViewModel{
  var _searchTextController = StreamController<String>.broadcast();
  var _resultTextController = StreamController<String>.broadcast();

  @override
  Sink get inputSearchText => _searchTextController;

  @override
  Stream<String> get outputSearchText => _searchTextController.stream.map((searchText) => searchText);

  @override
  Sink get searchButtonPressed => _resultTextController;

  @override
  Stream<String> get outputSearchResult => _resultTextController.stream.map((resultText) => resultText);

  @override
  void dispose() {
    _searchTextController.close();
    _resultTextController.close();
  }
}
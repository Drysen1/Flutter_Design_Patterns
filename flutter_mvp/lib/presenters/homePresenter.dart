import 'package:flutter_mvp/interfaces/presenterInterfaces/interfaceHomePresenter.dart';
import 'package:flutter_mvp/interfaces/screenInterfaces/interfaceHomeScreen.dart';

class HomePresenter implements InterfaceHomePresenter {
  late InterfaceHomeScreen _homeView;

  @override
  set homeView(InterfaceHomeScreen value) {
    _homeView = value;
  }

  @override
  void onSearchButtonClicked(String searchText) {
    _homeView.updateResultText(searchText);
  }

  @override
  void onSearchTextChanged(String searchText) {
    _homeView.updateOnchangedText(searchText);
  }
}
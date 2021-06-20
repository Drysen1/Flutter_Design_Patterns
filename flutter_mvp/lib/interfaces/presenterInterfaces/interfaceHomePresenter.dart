import 'package:flutter_mvp/interfaces/screenInterfaces/interfaceHomeScreen.dart';

abstract class InterfaceHomePresenter {
  void onSearchTextChanged(String searchText);
  void onSearchButtonClicked(String searchText);
  set homeView(InterfaceHomeScreen value){}
}
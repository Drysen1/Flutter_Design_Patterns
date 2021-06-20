import 'package:flutter/material.dart';
import 'package:flutter_mvp/interfaces/screenInterfaces/interfaceHomeScreen.dart';
import 'package:flutter_mvp/presenters/homePresenter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements InterfaceHomeScreen {
  final HomePresenter _homePresenter = HomePresenter();
  final TextEditingController _searchTextController = TextEditingController();
  String _onchangedString = "";
  String _resultString = "";

  @override
    void initState() {
      _homePresenter.homeView = this;
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(),    
    );
  }

  Widget _mainBody(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _onChangedLabel(),
          SizedBox(height: 40,),
          _resultLabel(),
          _searchTextField(),
          SizedBox(height: 40,),
          _searchButton(),
        ],
      ),
    );
  }

  Widget _onChangedLabel(){
    return Text(_onchangedString);
  }

  Widget _resultLabel(){
    return Text(_resultString);
  }

  Widget _searchTextField(){
    return TextField(
      controller: _searchTextController,
      onChanged: (text) {
        this._homePresenter.onSearchTextChanged(text);
      },
    ); 
  }

  Widget _searchButton(){
    return ElevatedButton(
      onPressed: () {
        this._homePresenter.onSearchButtonClicked(_searchTextController.text);
      }, 
      child: Text("Go")
    );
  }

  @override
  void updateOnchangedText(String searchText) {
    setState(() {
      _onchangedString = searchText;
    });
  }

  @override
  void updateResultText(String resultText) {
    setState(() {
      _resultString = resultText;
    });
  }
}
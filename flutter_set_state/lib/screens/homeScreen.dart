import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchTextController = TextEditingController();
  String _onChangedString = "";
  String _resultString = "";

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
    return Text(_onChangedString);
  }

  Widget _resultLabel(){
    return Text(_resultString);
  }

  Widget _searchTextField(){
    return TextField(
      controller: _searchTextController,
      onChanged: (text) {
        setState(() {
          _onChangedString = text; 
        });
      },
    ); 
  }

  Widget _searchButton(){
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _resultString = _searchTextController.text;
        });
      }, 
      child: Text("Go")
    );
  }
}
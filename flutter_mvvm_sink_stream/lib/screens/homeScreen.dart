import 'package:flutter/material.dart';
import 'package:flutter_mvvm_sink_stream/viewModels/homeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  HomeViewModel _viewModel = HomeViewModel();

  @override
    void initState() {
      _searchTextController.addListener(() => _viewModel.inputSearchText.add(_searchTextController.text));
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
    return StreamBuilder(
      stream: _viewModel.outputSearchText,
      builder: (context, snapshot){
        return Text(snapshot.data == null ? "" : snapshot.data.toString());
      },
    );
  }

  Widget _resultLabel(){
    return StreamBuilder(
      stream: _viewModel.outputSearchResult,
      builder: (context, snapshot){
        return Text(snapshot.data == null ? "" : snapshot.data.toString());
      }
    );
  }

  Widget _searchTextField(){
    return TextField(
      controller: _searchTextController
    ); 
  }

  Widget _searchButton(){
    return ElevatedButton(
      onPressed: () => _viewModel.searchButtonPressed.add(_searchTextController.text),
      child: Text("Go")
    );
  }
}
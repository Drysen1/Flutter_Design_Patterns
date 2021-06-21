import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_00/blocs/home/home_bloc.dart';
import 'package:flutter_bloc_00/blocs/home/home_event.dart';
import 'package:flutter_bloc_00/blocs/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchTextController = TextEditingController();

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
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (oldState, newState){
        return newState is OnSearchTextChangedState;
      },
      builder: (context, state) {
        var text = "";
        if(state is OnSearchTextChangedState){
          text = state.text;
        }
        return Text(text);
      }
    );
    // return Text("");
  }

  Widget _resultLabel(){
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        var text = "";
        if(state is ButtonPressedState){
          text = state.text;
        }
        return Text(text);
      }
    );
  }

  Widget _searchTextField(){
    return TextField(
      controller: _searchTextController,
      onChanged: (text) {
        context.read<HomeBloc>().add(OnSearchTexhChangedEvent(text));
      },
    ); 
  }

  Widget _searchButton(){
    return ElevatedButton(
      onPressed: () {
        context.read<HomeBloc>().add(OnButtonPressedEvent(_searchTextController.text));
      }, 
      child: Text("Go")
    );
  }
}
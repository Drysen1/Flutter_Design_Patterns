import 'package:equatable/equatable.dart';

class HomeState extends Equatable{
  const HomeState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeInitialState extends HomeState{}

class OnSearchTextChangingState extends HomeState{}

class OnSearchTextChangedState extends HomeState{
  final String text;
  OnSearchTextChangedState(this.text);
}

class ButtonPressedState extends HomeState{
  final String text;
  ButtonPressedState(this.text);
}
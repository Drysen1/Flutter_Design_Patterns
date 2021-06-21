import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnSearchTexhChangedEvent extends HomeEvent{
  final String text;
  OnSearchTexhChangedEvent(this.text);
}

class OnButtonPressedEvent extends HomeEvent{
  final String text;
  OnButtonPressedEvent(this.text);
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_00/blocs/home/home_event.dart';
import 'package:flutter_bloc_00/blocs/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is OnSearchTexhChangedEvent){
      yield* _mapOnSearchTextChangedEventToState(event);
    } else if(event is OnButtonPressedEvent){
      yield* _mapOnButtonPressedEventToState(event);
    }
  }

  Stream<HomeState> _mapOnSearchTextChangedEventToState(OnSearchTexhChangedEvent event) async* {
    yield OnSearchTextChangingState();
    yield OnSearchTextChangedState(event.text);
  }

  Stream<HomeState> _mapOnButtonPressedEventToState(OnButtonPressedEvent event) async* {
    yield ButtonPressedState(event.text);
  }
}

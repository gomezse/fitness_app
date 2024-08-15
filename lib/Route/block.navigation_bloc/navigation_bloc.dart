
import 'package:bloc/bloc.dart';
import 'package:fitness_app/Screens/BottomBar/bottomBar.dart';

enum NavigationEvents{
  IntroPageClickedEvent,

}

abstract class NavigationStates{

}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  NavigationBloc(NavigationStates initialState): super(initialState);

  @override
  NavigationStates get initialState => BottombarPage();


  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async*{
    switch(events){
      case NavigationEvents.IntroPageClickedEvent:
        yield BottombarPage();
        break;
    }
  }
}
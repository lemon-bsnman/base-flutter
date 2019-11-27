import 'package:base_app/model/app_state.dart';
import 'actions.dart';

AppState reducer(AppState prevState, dynamic action){
  AppState newState = AppState.fromAppState(prevState);
    
  if(action is ProfileName){
    newState.profileName = action.payload;
  }
  return newState;
}
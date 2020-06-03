import 'package:flutter_redux_app/action.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:redux/redux.dart';

final counterReducer = combineReducers<AppState>([
  TypedReducer<AppState, IncrementCounterAction>(_incrementCounterReducer),
  TypedReducer<AppState, ResetCounterAction>(_resetCounterReducer),
  TypedReducer<AppState, DecrementCounterAction>(_decrementCounterReducer),
]);

AppState _resetCounterReducer(AppState state, ResetCounterAction action) => state.rebuild((b) => b..counter = 0);

AppState _incrementCounterReducer(AppState state, IncrementCounterAction action) => state.rebuild((b) => b..counter += 1);

AppState _decrementCounterReducer(AppState state, DecrementCounterAction action) => state.rebuild((b) => b..counter -= 1);

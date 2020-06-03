import 'package:flutter_redux_app/state.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final Store<AppState> store;

  ViewModel(this.store) : assert(store != null);
}


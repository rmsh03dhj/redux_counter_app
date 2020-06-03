import 'package:flutter/material.dart';
import 'package:flutter_redux_app/custom_floating_action_button.dart';
import 'package:flutter_redux_app/action.dart';
import 'package:flutter_redux_app/middleware.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_redux_app/view_model.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/reducer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: Store<AppState>(counterReducer, initialState: AppState.initial()),
        child: MaterialApp(
          title: 'My Redux App',
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  Store<AppState> get store => StoreProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux implementation"),
      ),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel(store),
        builder: (BuildContext context, ViewModel viewModel) => Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    store.state.counter.toString(),
                    style: TextStyle(fontSize: 36),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomFloatingActionButton(
                key: Key("increment button"),
                icon: Icons.arrow_upward,
                counterActions: CounterActions.Increment,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomFloatingActionButton(
                key: Key("decrement button"),
                icon: Icons.arrow_downward,
                counterActions: CounterActions.Decrement,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomFloatingActionButton(
                key: Key("reset button"),
                icon: Icons.refresh,
                counterActions: CounterActions.Reset,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




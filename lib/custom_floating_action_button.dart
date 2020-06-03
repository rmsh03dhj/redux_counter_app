import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/action.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_redux_app/view_model.dart';
import 'package:redux/redux.dart';

enum CounterActions { Increment, Decrement, Reset }

class CustomFloatingActionButton extends StatefulWidget {
  final IconData icon;
  final CounterActions counterActions;

  const CustomFloatingActionButton({Key key, this.icon, this.counterActions}) : super(key: key);

  @override
  _CustomButton createState() => _CustomButton();
}

class _CustomButton extends State<CustomFloatingActionButton> {
  Store<AppState> get store => StoreProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel(store),
        builder: (BuildContext context, ViewModel viewModel) => FloatingActionButton(
          child: Icon(widget.icon),
          onPressed: () => {
            widget.counterActions == CounterActions.Increment
                ? store.dispatch(IncrementCounterAction())
                : widget.counterActions == CounterActions.Decrement ? store.dispatch(DecrementCounterAction()) : store.dispatch(ResetCounterAction()),
          },
        ),
      ),
    );
  }
}
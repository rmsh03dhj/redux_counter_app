import 'package:flutter_redux_app/action.dart';
import 'package:flutter_redux_app/reducer.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Increments state by 1 on dispatching IncrementCounterAction', () {
    final state = counterReducer(
      AppState.initial(),
      IncrementCounterAction(),
    );

    expect(state.counter, 1);
  });

  test('Decrements state by 1 on dispatching DecrementCounterAction ', () {
    final state = counterReducer(
      AppState.initial(),
      DecrementCounterAction(),
    );

    expect(state.counter, -1);
  });

  test('Decrements state by 1 on dispatching ResetCounterAction ', () {
    final state = counterReducer(
      AppState.copyState(1),
      ResetCounterAction(),
    );

    expect(state.counter, 0);
  });
}

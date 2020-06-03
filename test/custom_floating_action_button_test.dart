import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/custom_floating_action_button.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'main_test.dart';

void main() {
  testWidgets('tapping on increment button increments counter value', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StoreProvider<AppState>(
          store: storeWithCounter0,
          child: StoreBuilder<AppState>(
            builder: (context, viewModel) {
              return CustomFloatingActionButton(icon: Icons.arrow_upward, counterActions: CounterActions.Increment);
            },
          ),
        ),
      ),
    );

    Finder finder = find.byType(FloatingActionButton);
    await tester.tap(finder);
    expect(storeWithCounter0.state.counter, 1);

    await tester.tap(finder);
    await tester.tap(finder);

    expect(storeWithCounter0.state.counter, 3);
  });

  testWidgets('tapping on decrement button decreases counter value', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StoreProvider<AppState>(
          store: storeWithCounter5,
          child: StoreBuilder<AppState>(
            builder: (context, viewModel) {
              return CustomFloatingActionButton(icon: Icons.arrow_downward, counterActions: CounterActions.Decrement);
            },
          ),
        ),
      ),
    );

    Finder finder = find.byType(FloatingActionButton);
    await tester.tap(finder);
    expect(storeWithCounter5.state.counter, 4);

    await tester.tap(finder);
    await tester.tap(finder);

    expect(storeWithCounter5.state.counter, 2);
  });

  testWidgets('tapping on reset button resets counter value', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: StoreProvider<AppState>(
          store: storeWithCounter100,
          child: StoreBuilder<AppState>(
            builder: (context, viewModel) {
              return CustomFloatingActionButton(icon: Icons.refresh, counterActions: CounterActions.Reset);
            },
          ),
        ),
      ),
    );

    Finder finder = find.byType(FloatingActionButton);
    await tester.tap(finder);
    expect(storeWithCounter100.state.counter, 0);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/reducer.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import '../lib/main.dart';

void main() {
  testWidgets('home screen loads the default counter value from the state', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter0));
    expect(find.text("0"), findsOneWidget);
  });


  testWidgets('home screen loads the updated counter value from the state', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter5));
    expect(find.text("5"), findsOneWidget);
  });

  testWidgets('home screen contains floating action button for increment', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter0));
    Finder finder = find.byKey(Key("increment button"));


    expect(finder, findsOneWidget);
  });

  testWidgets('pressing increment button increments the value', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter0));
    expect(find.text("0"), findsOneWidget);

    await tester.tap(find.byKey(Key("increment button")));
    await tester.pump();
    expect(find.text("1"), findsOneWidget);
  });

  testWidgets('home screen contains floating action button for decrement', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter0));
    expect(find.byKey(Key("decrement button")), findsOneWidget);
  });

  testWidgets('pressing decrement button increments the value', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter5));
    expect(find.text("5"), findsOneWidget);

    await tester.tap(find.byKey(Key("decrement button")));
    await tester.tap(find.byType(RaisedButton));

    await tester.pump();
    expect(find.text("4"), findsOneWidget);
  });

  testWidgets('home screen contains floating action button for reset', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter5));
    expect(find.byKey(Key("reset button")), findsOneWidget);
  });

  testWidgets('pressing reset button resets the value', (WidgetTester tester) async {
    await tester.pumpWidget(myHomePage(storeWithCounter100));
    expect(find.text("100"), findsOneWidget);

    await tester.tap(find.byKey(Key("reset button")));
    await tester.pump();
    expect(find.text("0"), findsOneWidget);
  });
}

Store<AppState> storeWithCounter0 = Store<AppState>(
  counterReducer,
  initialState: AppState.initial(),
);

Store<AppState> storeWithCounter5 = Store<AppState>(
  counterReducer,
  initialState: AppState.copyState(5),
);

Store<AppState> storeWithCounter100 = Store<AppState>(
  counterReducer,
  initialState: AppState.copyState(100),
);

Widget myHomePage(Store<AppState> store) {
  return MaterialApp(
    home: StoreProvider<AppState>(
      store: store,
      child: StoreBuilder<AppState>(
        builder: (context, viewModel) {
          return MyHomePage();
        },
      ),
    ),
  );
}

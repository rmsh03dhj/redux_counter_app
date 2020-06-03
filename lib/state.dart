import 'package:built_value/built_value.dart';

part 'state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initial() => _$AppState._(
    counter: 0,
  );

  factory AppState.copyState(int value) => _$AppState._(
    counter: value,
  );

  AppState._();

  @nullable
  int get counter;
}
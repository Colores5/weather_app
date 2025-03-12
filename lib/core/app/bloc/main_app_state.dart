part of 'main_app_bloc.dart';

@freezed
abstract class MainAppState with _$MainAppState {
  const factory MainAppState({
    @Default(true) bool loading,
    ThemeData? theme,
    ThemeStatus? themeStatus,
  }) = _MainAppState;
}

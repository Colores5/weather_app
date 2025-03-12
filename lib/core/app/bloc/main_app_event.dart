part of 'main_app_bloc.dart';

@freezed
class MainAppEvent with _$MainAppEvent {
  const factory MainAppEvent.init() = _Init;

  const factory MainAppEvent.changeTheme({
    required ThemeStatus themeStatus,
  }) = _ChangeTheme;
}

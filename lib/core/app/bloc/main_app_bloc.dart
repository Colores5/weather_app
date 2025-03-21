import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_app_event.dart';
part 'main_app_state.dart';
part 'main_app_bloc.freezed.dart';

class MainAppBloc extends Bloc<MainAppEvent, MainAppState> {
  final ThemeRepository _themeRepository;
  final PrefsRepository _prefsRepository;

  StreamSubscription<ThemeStatus>? _themeSubscription;

  MainAppBloc({
    required ThemeRepository themeRepository,
    required PrefsRepository prefsRepository,
  })  : _themeRepository = themeRepository,
        _prefsRepository = prefsRepository,
        super(
          const MainAppState(),
        ) {
    on<_Init>(_onInit);
    on<_ChangeTheme>(_onChangeTheme);

    add(const MainAppEvent.init());

    _themeSubscription = _themeRepository.themeStream.listen(
      _themeListener,
    );
  }

  @override
  Future<void> close() async {
    await _themeSubscription?.cancel();
    return super.close();
  }

  Future<void> _onInit(
    _Init event,
    Emitter<MainAppState> emit,
  ) async {
    emit(
      state.copyWith(
        themeStatus: _prefsRepository.setThemeStatus(
          _prefsRepository.isDarkTheme(),
        ),
        theme: _themeRepository.getTheme(
          _prefsRepository.isDarkTheme(),
        ),
      ),
    );
  }

  void _themeListener(ThemeStatus themeStatus) {
    add(
      MainAppEvent.changeTheme(
        themeStatus: themeStatus,
      ),
    );
  }

  Future<void> _onChangeTheme(
    _ChangeTheme event,
    Emitter<MainAppState> emit,
  ) async {
    if (isClosed) return;

    final theme = _themeRepository.getTheme(
      event.themeStatus.name,
    );

    _prefsRepository.setThemeChange(event.themeStatus.name);

    emit(
      state.copyWith(
        theme: theme,
      ),
    );
  }
}

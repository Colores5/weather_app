import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_app/weather_app.dart';

part 'weather_screen_event.dart';
part 'weather_screen_state.dart';

class WeatherScreenBloc extends Bloc<WeatherScreenEvent, WeatherScreenState> {
  final WeatherRepository _weatherRepository;
  final ThemeRepository _themeRepository;
  final PrefsRepository _prefsRepository;

  WeatherScreenBloc({
    required PrefsRepository prefsRepository,
    required ThemeRepository themeRepository,
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        _themeRepository = themeRepository,
        _prefsRepository = prefsRepository,
        super(WeatherScreenState()) {
    on<WeatherScreenEvent>(_onInit);
    on<LoadWeatherScreen>(_searchWeather);
    on<ChangeThemeEvent>(_changeTheme);

    add(LoadWeatherScreen());
  }

  Future<void> _onInit(
    WeatherScreenEvent event,
    Emitter<WeatherScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        themeStatus: _prefsRepository.setThemeStatus(
          _prefsRepository.isDarkTheme(),
        ),
      ),
    );
  }

  FutureOr<void> _changeTheme(
    ChangeThemeEvent event,
    Emitter<WeatherScreenState> emit,
  ) {
    final _themeStatus = event.themeStatus;
    _themeRepository.updateTheme(_themeStatus);
    emit(
      state.copyWith(
        themeStatus: _themeStatus,
      ),
    );
  }

  FutureOr<void> _searchWeather(
    LoadWeatherScreen event,
    Emitter<WeatherScreenState> emit,
  ) async {
    try {
      final currentPosition = await _weatherRepository.determinePosition();
      final currentWeatherInfo =
          await _weatherRepository.searchWeather(currentPosition);
      emit(
        state.copyWith(currentWeatherInfo: currentWeatherInfo),
      );
    } catch (e) {
      emit(WeatherScreenBlocFailure(exception: e));
    }
  }
}

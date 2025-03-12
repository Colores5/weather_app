import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_app/weather_app.dart';

part 'weather_screen_event.dart';
part 'weather_screen_state.dart';

class WeatherScreenBloc extends Bloc<WeatherScreenEvent, WeatherScreenState> {
  final WeatherRepository _weatherRepository;
  WeatherScreenBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(WeatherScreenBlocInitial()) {
    on<LoadWeatherScreen>(_searchWeather);
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
        WeatherScreenBlocLoaded(currentWeatherInfo: currentWeatherInfo),
      );
    } catch (e) {
      emit(WeatherScreenBlocFailure(exception: e));
    }
  }
}

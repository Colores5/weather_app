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
    // on<LoadingWeatherScreen>(_determinePosition);
    on<LoadWeatherScreen>(_searchWeather);
  }

  // FutureOr<void> _determinePosition(event, emit) async {
  //   try {
  //     final currentPositionInfo = await _locationRepository.determinePosition();
  //     emit(
  //       WeatherScreenBlocLoading(currentPosition: currentPositionInfo),
  //     );
  //   } on Exception catch (e) {
  //     emit(WeatherScreenBlocFailure(exception: e));
  //   }
  // }

  FutureOr<void> _searchWeather(event, emit) async {
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

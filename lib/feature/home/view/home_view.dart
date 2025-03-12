import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/feature/home/bloc/weather_screen_bloc.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/weather_app.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Constants myConstants = Constants();

  final _weatherBloc = WeatherScreenBloc(
    weatherRepository: getIt<WeatherRepository>(),
  );

  final currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

  @override
  void initState() {
    _weatherBloc.add(
      LoadWeatherScreen(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: BlocBuilder<WeatherScreenBloc, WeatherScreenState>(
          bloc: _weatherBloc,
          builder: (context, state) {
            switch (state) {
              case WeatherScreenBlocLoaded():
                return Text(
                  state.currentWeatherInfo.name,
                );
              case WeatherScreenBlocFailure():
                return const Center(
                  child: Text('Request failed'),
                );
              default:
                return const Text('Loading...');
            }
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return _weatherBloc.add(
            LoadWeatherScreen(),
          );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<WeatherScreenBloc, WeatherScreenState>(
            bloc: _weatherBloc,
            builder: (context, state) {
              switch (state) {
                case WeatherScreenBlocLoaded():
                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.currentWeatherInfo.name,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          currentDate,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        MainWeatherInfo(
                            myConstants: myConstants,
                            imageURL: state
                                .currentWeatherInfo.weather[0].stateName
                                .replaceAll(' ', '')
                                .toLowerCase(),
                            stateName:
                                state.currentWeatherInfo.weather[0].stateName,
                            description:
                                state.currentWeatherInfo.weather[0].description,
                            temp: state.currentWeatherInfo.main.maxTemp),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeatherItemInfo(
                                value: state.currentWeatherInfo.wind.speed,
                                text: 'Wind Speed',
                                unit: 'km/h',
                                url: 'windspeed',
                              ),
                              WeatherItemInfo(
                                value: state.currentWeatherInfo.main.humidity,
                                text: 'Humidity',
                                unit: '%',
                                url: 'humidity',
                              ),
                              WeatherItemInfo(
                                value: state.currentWeatherInfo.main.maxTemp
                                    .round(),
                                text: 'Max Temp',
                                unit: '°',
                                url: 'max-temp',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
              }
              if (state is WeatherScreenBlocFailure) {
                return Center(
                  child: Text('${state.exception}'),
                );
              }
              return const Center(
                heightFactor: 10,
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

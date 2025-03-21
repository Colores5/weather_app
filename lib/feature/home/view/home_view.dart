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
    prefsRepository: getIt<PrefsRepository>(),
    weatherRepository: getIt<WeatherRepository>(),
    themeRepository: getIt<ThemeRepository>(),
  );

  final currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

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
            return Text(state.currentWeatherInfo?.name ?? 'Loading');
          },
        ),
        actions: <Widget>[
          BlocBuilder<WeatherScreenBloc, WeatherScreenState>(
            bloc: _weatherBloc,
            builder: (context, state) {
              return Row(
                children: [
                  Icon(switch (state.themeStatus) {
                    ThemeStatus.light => Icons.sunny,
                    ThemeStatus.dark => Icons.dark_mode,
                  }),
                  Switch(
                    value: state.themeStatus == ThemeStatus.dark,
                    onChanged: (value) {
                      _weatherBloc.add(
                        ChangeThemeEvent(
                          themeStatus:
                              value ? ThemeStatus.dark : ThemeStatus.light,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
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
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.currentWeatherInfo?.name ?? "",
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
                      imageURL: state.currentWeatherInfo?.weather[0].stateName
                              .replaceAll(' ', '')
                              .toLowerCase() ??
                          '',
                      stateName:
                          state.currentWeatherInfo?.weather[0].stateName ?? "",
                      description:
                          state.currentWeatherInfo?.weather[0].description ??
                              "",
                      temp: state.currentWeatherInfo?.main.maxTemp ?? 0,
                    ),
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
                            value: state.currentWeatherInfo?.wind.speed ?? 0,
                            text: 'Ветер',
                            unit: 'км/ч',
                            url: 'windspeed',
                          ),
                          WeatherItemInfo(
                            value: state.currentWeatherInfo?.main.humidity ?? 0,
                            text: 'Влажность',
                            unit: '%',
                            url: 'humidity',
                          ),
                          WeatherItemInfo(
                            value: state.currentWeatherInfo?.main.maxTemp
                                    .round() ??
                                0,
                            text: 'Макс t°',
                            unit: '°',
                            url: 'max-temp',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

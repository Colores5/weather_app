import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/feature/home/bloc/weather_screen_bloc.dart';
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
    weatherRepository: GetIt.I<WeatherRepository>(),
  );

  var currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  String imageURL = "";
  String location = "Moscow";

  var selectedCities = City.getSelectedCities();
  List<String> cities = ["Moscow"];

  @override
  void initState() {
    _weatherBloc.add(LoadWeatherScreen(location: location));
    for (int i = 0; i < selectedCities.length; i++) {
      cities.add(selectedCities[i].city);
    }
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pin.png',
              width: 20,
            ),
            const SizedBox(width: 4),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                alignment: const Alignment(0, 0),
                value: location,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: cities.map((String location) {
                  return DropdownMenuItem(
                    alignment: const Alignment(0, 0),
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(
                    () {
                      location = newValue!;
                      _weatherBloc.add(LoadWeatherScreen(location: location));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return _weatherBloc.add(LoadWeatherScreen(location: location));
        },
        child: BlocBuilder<WeatherScreenBloc, WeatherScreenState>(
          bloc: _weatherBloc,
          builder: (context, state) {
            if (state is WeatherScreenBlocLoaded) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      currentDate,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MainWeatherInfo(
                        myConstants: myConstants,
                        imageURL: state.currentWeatherInfo.weather[0].stateName
                            .replaceAll(' ', '')
                            .toLowerCase(),
                        stateName:
                            state.currentWeatherInfo.weather[0].stateName,
                        description:
                            state.currentWeatherInfo.weather[0].description,
                        temp: state.currentWeatherInfo.main.temp),
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
                            value:
                                state.currentWeatherInfo.main.maxTemp.round(),
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
              return const Center(
                child: Text('Request failed'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

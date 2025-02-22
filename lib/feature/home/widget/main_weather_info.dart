import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';

class MainWeatherInfo extends StatelessWidget {
  const MainWeatherInfo({
    super.key,
    this.color,
    required this.myConstants,
    required this.imageURL,
    required this.stateName,
    required this.description,
    required this.temp,
  });

  final Color? color;
  final Constants myConstants;
  final String imageURL;
  final String stateName;
  final String description;
  final double temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color ?? Theme.of(context).primaryColor.withAlpha(150),
            offset: const Offset(0, 25),
            blurRadius: 10,
            spreadRadius: -12,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -40,
            left: 20,
            child: imageURL == ''
                ? const Text('')
                : Image.asset(
                    'assets/$imageURL.png',
                    width: 150,
                  ),
          ),
          Positioned(
            bottom: 35,
            left: 20,
            child: Text(
              stateName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              description,
              style: const TextStyle(
                color: Color.fromARGB(255, 189, 230, 255),
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Text(
                    temp.round().toString(),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  '°',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

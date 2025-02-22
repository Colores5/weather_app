import 'package:flutter/material.dart';

class WeatherItemInfo extends StatelessWidget {
  const WeatherItemInfo({
    super.key,
    this.color,
    required this.value,
    required this.text,
    required this.unit,
    required this.url,
  });

  final Color? color;
  final int value;
  final String text;
  final String unit;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? Theme.of(context).primaryColor,
          ),
          child: Image.asset(
            'assets/$url.png',
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${value.toString()} $unit',
        )
      ],
    );
  }
}

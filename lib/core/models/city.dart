class City {
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;

  City({
    required this.isSelected,
    required this.city,
    required this.country,
    required this.isDefault,
  });

  static List<City> citiesList = [
    City(
      isSelected: false,
      city: 'Moscow',
      country: 'Russia',
      isDefault: true,
    ),
    City(
      isSelected: false,
      city: 'Omsk',
      country: 'Russia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Kazan',
      country: 'Russia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Novosibirsk',
      country: 'Russia',
      isDefault: false,
    ),
    City(
      isSelected: false,
      city: 'Vladivostok',
      country: 'Russia',
      isDefault: false,
    )
  ];

  static List<City> getSelectedCities() {
    List<City> selectedCities = City.citiesList;
    return selectedCities.where((city) => city.isSelected == true).toList();
  }
}

class Weather {
  final double lat;
  final double lon;
  final String weahter;
  final String description;
  final String icon;
  final double temp;
  final double feelLike;
  final double tempMin;
  final double tempMax;
  final String localName;

  Weather({
    required this.lat,
    required this.lon,
    required this.weahter,
    required this.description,
    required this.icon,
    required this.temp,
    required this.feelLike,
    required this.tempMin,
    required this.tempMax,
    required this.localName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    lat: json["coord"]["lat"],
    lon: json["coord"]["lon"],
    weahter: json["weather"][0]["main"],
    description: json["weather"][0]["description"],
    icon: json["weather"][0]["icon"],
    temp: json["main"]["temp"],
    feelLike: json["main"]["feels_like"],
    tempMin: json["main"]["temp_min"],
    tempMax: json["main"]["temp_max"],
    localName: json["name"],
  );
}
import 'package:geolocator/geolocator.dart';

Future<Map<String, double>> getCurrentCoord() async {
  double lat;
  double lon;
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    lat = 37.51175556;
    lon = 127.1079306;
  } else {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    lat = position.latitude;
    lon = position.longitude;
  }

  return { "lat": lat, "lon": lon };
}
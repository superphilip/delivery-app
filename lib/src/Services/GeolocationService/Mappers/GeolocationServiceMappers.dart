import 'package:delivery_app/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceMappers {
  static PositionEntity mapPosition(Position position) {
    print("Lon: ${position.longitude}");
    print("Lat: ${position.latitude}");
    return PositionEntity(
      longitude: position.longitude,
      latitude: position.latitude,
      timestamp: position.timestamp,
      accuracy: position.accuracy,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
    );
  }
}

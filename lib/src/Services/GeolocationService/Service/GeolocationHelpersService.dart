import 'package:delivery_app/src/Services/GeolocationService/interfaces/GeolocationServiceInterfaces.dart';
import 'package:geolocator/geolocator.dart';


class DefaultGeolocationHelpersService extends GeolocationHelpersService {

  @override
  double getDistanceBetweenInMetters(double startLatitude,
                                     double startLongitude,
                                     double destinationLatitude,
                                     double destinationLongitude) {
    double distanceInMeters = Geolocator.distanceBetween(startLatitude, startLongitude, destinationLatitude, destinationLongitude);
    return distanceInMeters;
  }

  @override
  double getDistanceBetweenInKilometters(double startLatitude,
                                         double startLongitude,
                                         double destinationLatitude,
                                         double destinationLongitude) {
    double distanceInKilometters = Geolocator.distanceBetween(startLatitude, startLongitude, destinationLatitude, destinationLongitude) / 1000;
    return distanceInKilometters;
  }
}
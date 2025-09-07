

import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/Services/GeolocationService/Mappers/GeolocationServiceMappers.dart';
import 'package:delivery_app/src/Services/GeolocationService/Service/GeolocationService.dart';
import 'package:delivery_app/src/Services/GeolocationService/interfaces/GeolocationServiceInterfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:geolocator/geolocator.dart';

class MockSuccessGeolocationService extends GeolocationService {

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {
    /*
    Simulador:
    I/flutter (14723): 37.421998333333335 - LAT
    I/flutter (14723): -122.084 - LNG

    Reales del centro de Barcelona para pruebas:
    41.386400 - LAT
    2.169188 - LNG
    */
    final permisionStatus = await getPermissionStatus();
    if(permisionStatus == LocationPermissionStatus.allowed) {
      var fakePosition = Position(longitude: 2.169188,
          latitude: 41.386400,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          altitudeAccuracy: 1,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0, 
          headingAccuracy: 1);

      return Result.success(GeolocationServiceMappers.mapPosition(fakePosition));
    } else {
      return Future.error(GeoLocationFailureMessages.locationPermissionsDenied);
    }
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return LocationPermissionStatus.denied;
  }
}

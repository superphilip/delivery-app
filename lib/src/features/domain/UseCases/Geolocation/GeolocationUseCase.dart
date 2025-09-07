

import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Geolocation/GeolocationUseCaseParams.dart';
import 'package:delivery_app/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/Services/GeolocationService/Service/GeolocationHelpersService.dart';
import 'package:delivery_app/src/Services/GeolocationService/Service/GeolocationService.dart';
import 'package:delivery_app/src/Services/GeolocationService/interfaces/GeolocationServiceInterfaces.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class GeolocationUseCase {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
  Future<double> getDistanceBetweenYourCurrentPositionAnd(Destination destination);
}

class DefaultGeolocationUseCase extends GeolocationUseCase {
  // Dependencies
  final GeolocationService _geolocationService;
  final GeolocationHelpersService _geolocationHelpersService;

  DefaultGeolocationUseCase({ GeolocationService? geolocationService,
                              GeolocationHelpersService? geolocationHelpersService })
                       : _geolocationService = geolocationService ?? DefaultGeolocationService(), // Bueno: DefaultGeolocationService() Mock: MockSuccessGeolocationService
                         _geolocationHelpersService = geolocationHelpersService ?? DefaultGeolocationHelpersService();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    final status = await _geolocationService.getPermissionStatus();
    // Logger.printMessageOnConsole("$status", "LocationPermission");
    return status;
  }

  @override
  Future<double> getDistanceBetweenYourCurrentPositionAnd(Destination destination) async {
    final currentPosition = await _geolocationService.getCurrentPosition();
    final distance = _geolocationHelpersService.getDistanceBetweenInKilometters(currentPosition.value?.latitude ?? 0.0,
                                                                                currentPosition.value?.longitude ?? 0.0,
                                                                                destination.destinationLatitude,
                                                                                destination.destinationLongitude);
    return distance;
  }
}
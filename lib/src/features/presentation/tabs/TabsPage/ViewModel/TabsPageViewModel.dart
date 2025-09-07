

import 'package:delivery_app/src/Base/ApiService/AppError.dart';
import 'package:delivery_app/src/Base/Views/BaseView.dart';
import 'package:delivery_app/src/Features/domain/UseCases/Geolocation/GeolocationUseCase.dart';
import 'package:delivery_app/src/Features/presentation/StateProviders/LoadingStatusStateProvider.dart';
import 'package:delivery_app/src/Services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class TabsPageViewModelInput {
  // Exposed Methods
  Future<Result<bool,Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}



// Crear ViewModel
abstract class TabsPageViewModel extends TabsPageViewModelInput with BaseViewModel {}

class DefaultTabsPageViewModel extends TabsPageViewModel with BaseViewModel {
  // Dependencies
  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsPageViewModel({ GeolocationUseCase? geolocationUseCase })
      : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

  @override
  void iniState({ required LoadingStateProvider loadingStateProvider }) {
    loadingState = loadingStateProvider;
  }

  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {

    return await _geolocationUseCase.getCurrentPosition().then( (result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return await _geolocationUseCase.getPermissionStatus();
  }
  
  
  
  
}

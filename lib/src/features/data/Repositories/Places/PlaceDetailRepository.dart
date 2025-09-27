import 'package:delivery_app/src/Features/data/interfaces/Interfaces.dart';
import 'package:delivery_app/src/Features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/interfaces/interfaces.dart';

class DefatultPlaceDetailRepository extends PlaceDetailRepository {
  final String _path = "placeList/";
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefatultPlaceDetailRepository({
    RealtimeDatabaseService? realtimeDataBaseService,
  }) : _realtimeDatabaseService =
           realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<void> savePlaceDetail({required PlaceListDetailEntity placeDetail}) {
    var fullPath = _path + placeDetail.placeId;
    return _realtimeDatabaseService.putData(
      bodyParameters: placeDetail.toMap(),
      path: fullPath,
    );
  }
}

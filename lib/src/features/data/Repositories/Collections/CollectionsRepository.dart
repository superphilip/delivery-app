import 'package:delivery_app/src/Features/data/Decodables/CollectionsDecodable/CollectionsDecodable.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/Services/FirebaseServices/RealtimeDatabaseService/interfaces/interfaces.dart';



abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}

class DefaultCollectionsRepository extends CollectionsRepository {

  final String _path = "collections/";

  // * Dependencies
  final RealtimeDatabaseService _realtimeDataBaseService;
  
  DefaultCollectionsRepository({ RealtimeDatabaseService? realtimeDataBaseService })
          : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<CollectionsDecodable> fetchCollections() async {
    final response = await _realtimeDataBaseService.getData(path: _path);
    CollectionsDecodable decodable = CollectionsDecodable.fromMap(response);
    return decodable;
  }
}

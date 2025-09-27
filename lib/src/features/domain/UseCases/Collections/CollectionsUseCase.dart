import 'package:delivery_app/src/Features/data/Repositories/Collections/CollectionsRepository.dart';
import 'package:delivery_app/src/Features/domain/Entities/Collections/CollectionEntity.dart';

abstract class FetchCollectionUseCase {
  Future<CollectionsEntity> execute();
}

class DefaultFetchCollectionUseCase extends FetchCollectionUseCase {
  
  // * Dependencies
  final CollectionsRepository _collectionsRepository;

  DefaultFetchCollectionUseCase({ CollectionsRepository? collectionsRepository })
      : _collectionsRepository =
            collectionsRepository ?? DefaultCollectionsRepository();

  @override
  Future<CollectionsEntity> execute() async {
    final response = await _collectionsRepository.fetchCollections();
    return CollectionsEntity.fromMap(response.toMap());
  }
}


class SaveLocalStorageUseCaseParameters {
  final String key;
  final String value;

  SaveLocalStorageUseCaseParameters({
    required this.key,
    required this.value,
  });
}

class FetchLocalStorageUseCaseParameters {
  final String key;

  FetchLocalStorageUseCaseParameters({
    required this.key,
  });
}

class RemoveLocalStorageUseCaseParameters {
  final String key;

  RemoveLocalStorageUseCaseParameters({
    required this.key,
  });
}
class GetUSerDataUseCaseParameters {
  final String idToken;

  GetUSerDataUseCaseParameters({required this.idToken});

  Map<String, dynamic> toMap() => {
    'idToken': idToken
  };
}

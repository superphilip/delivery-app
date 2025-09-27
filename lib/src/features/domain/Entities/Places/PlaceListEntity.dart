import 'dart:convert';

class PlaceListEntity {
  PlaceListEntity({required this.placeList});
  List<PlaceListDetailEntity>? placeList;
  factory PlaceListEntity.fromJson(String str) =>
      PlaceListEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceListEntity.fromMap(Map<String, dynamic> json) =>
      PlaceListEntity(
        placeList: json["placeList"] == null
            ? null
            : List<PlaceListDetailEntity>.from(
                json["placeList"].map((x) => PlaceListDetailEntity.fromMap(x)),
              ),
      );

  Map<String, dynamic> toMap() => {
    "placeList": placeList == null
        ? null
        : List<dynamic>.from(placeList!.map((x) => x.toMap())),
  };
}

class PlaceListDetailEntity {
  String address;
  String adminId;
  String averageDelivery;
  double averagePrice;
  String city;
  int collectionId;
  String country;
  String description;
  String email;
  List<String> favourites;
  bool hasAlcohol;
  bool hasFreeDelivery;
  List<String> imgs;
  bool isNovelty;
  bool isOpenNow;
  bool isPopularThisWeek;
  double lat;
  double long;
  String phoneNumber;
  String placeId;
  String placeName;
  double ratingAverage;
  int ratings;
  String status;
  String zipCode;

  PlaceListDetailEntity({
    required this.address,
    required this.adminId,
    required this.averageDelivery,
    required this.averagePrice,
    required this.city,
    required this.collectionId,
    required this.country,
    required this.description,
    required this.email,
    required this.favourites,
    required this.hasAlcohol,
    required this.hasFreeDelivery,
    required this.imgs,
    required this.isNovelty,
    required this.isOpenNow,
    required this.isPopularThisWeek,
    required this.lat,
    required this.long,
    required this.phoneNumber,
    required this.placeId,
    required this.placeName,
    required this.ratingAverage,
    required this.ratings,
    required this.status,
    required this.zipCode,
  });

  factory PlaceListDetailEntity.fromMap(
    Map<String, dynamic> json,
  ) => PlaceListDetailEntity(
    address: json["address"] ?? "",
    adminId: json["adminId"] ?? "",
    averageDelivery: json["averageDelivery"] ?? "",
    averagePrice: json["averagePrice"] ?? 0,
    city: json["city"] ?? "",
    collectionId: json["collectionId"] ?? 0,
    country: json["country"] ?? "",
    description: json["description"] ?? "",
    email: json["email"] ?? "",
    favourites: json["favourites"] == null
        ? []
        : List<String>.from(json["favourites"].map((x) => x)),
    hasAlcohol: json["hasAlcohol"] ?? false,
    hasFreeDelivery: json["hasFreeDelivery"] ?? false,
    imgs: json["imgs"] == null
        ? []
        : List<String>.from(json["imgs"].map((x) => x)),
    isNovelty: json["isNovelty"] ?? false,
    isOpenNow: json["isOpenNow"] ?? false,
    isPopularThisWeek: json["isPopularThisWeek"] ?? false,
    lat: json["lat"]?.toDouble() ?? 0,
    long: json["long"]?.toDouble() ?? 0,
    phoneNumber: json["phoneNumber"] ?? "",
    placeId: json["placeId"] ?? "",
    placeName: json["placeName"] ?? "",
    ratingAverage: json["ratingAverage"]?.toDouble() ?? 0,
    ratings: json["ratings"] ?? 0,
    status: json["status"] ?? "",
    zipCode: json["zipCode"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "adminId": adminId,
    "averageDelivery": averageDelivery,
    "averagePrice": averagePrice,
    "city": city,
    "collectionId": collectionId,
    "country": country,
    "description": description,
    "email": email,
    "favourites": List<dynamic>.from(favourites.map((x) => x)),
    "hasAlcohol": hasAlcohol,
    "hasFreeDelivery": hasFreeDelivery,
    "imgs": List<dynamic>.from(imgs.map((x) => x)),
    "isNovelty": isNovelty,
    "isOpenNow": isOpenNow,
    "isPopularThisWeek": isPopularThisWeek,
    "lat": lat,
    "long": long,
    "phoneNumber": phoneNumber,
    "placeId": placeId,
    "placeName": placeName,
    "ratingAverage": ratingAverage,
    "ratings": ratings,
    "status": status,
    "zipCode": zipCode,
  };

  bool isUserFavourite({required String? userUid}) {
    return favourites.contains(userUid);
  }
}

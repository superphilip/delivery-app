import 'package:delivery_app/src/Features/domain/Entities/User/UserEntity.dart';

class SaveUserDataUseCaseParameters {
  SaveUserDataUseCaseParameters({
    this.localId,
    this.role,
    this.username,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.startDate,
    this.photo,
    this.shippingAddress,
    this.bilingAddress,
    this.idToken,
  });

  String? localId;
  UserRole? role;
  String? username;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? bilingAddress;
  String? idToken;

  Map<String, dynamic> toMap() => {
    "localId": localId,
    "role": role,
    "usarname": username,
    "email": email,
    "phone": phone,
    "dateOfBirth": dateOfBirth,
    "startDate": startDate,
    "photo": photo,
    "shippingAddress": shippingAddress,
    "bilingAddress": bilingAddress,
    "idToken": idToken,
  };
}

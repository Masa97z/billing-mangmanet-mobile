// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

User temperaturesFromJson(String str) => User.fromJson(json.decode(str));

String temperaturesToJson(User data) => json.encode(data.toJson());

class User {
  String id;
  String name;
  String email;
  String password;
  String typeAccount;
  String costumerId;
  int phone;
  Address address;
  Invoces invoces;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.typeAccount,
    required this.costumerId,
    required this.phone,
    required this.address,
    required this.invoces,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    typeAccount: json["typeAccount"],
    costumerId: json["costumerId"],
    phone: json["phone"],
    address: Address.fromJson(json["address"]),
    invoces: Invoces.fromJson(json["invoces"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "typeAccount": typeAccount,
    "costumerId": costumerId,
    "phone": phone,
    "address": address.toJson(),
    "invoces": invoces.toJson(),
  };
}

class Address {
  String city;
  String region;
  String homeNumber;

  Address({
    required this.city,
    required this.region,
    required this.homeNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    region: json["region"],
    homeNumber: json["homeNumber"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "region": region,
    "homeNumber": homeNumber,
  };
}

class Invoces {
  int deps;
  int currentAmount;
  int totalAmount;

  Invoces({
    required this.deps,
    required this.currentAmount,
    required this.totalAmount,
  });

  factory Invoces.fromJson(Map<String, dynamic> json) => Invoces(
    deps: json["deps"],
    currentAmount: json["currentAmount"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "deps": deps,
    "currentAmount": currentAmount,
    "totalAmount": totalAmount,
  };
}

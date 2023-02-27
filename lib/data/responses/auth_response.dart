import 'dart:convert';

// To parse this JSON data, do
//
//     final authenticationResponse = authenticationResponseFromJson(jsonString);

AuthenticationResponse authenticationResponseFromJson(String str) =>
    AuthenticationResponse.fromJson(json.decode(str));

String authenticationResponseToJson(AuthenticationResponse data) =>
    json.encode(data.toJson());

class AuthenticationResponse {
  AuthenticationResponse({
    required this.status,
    required this.message,
    required this.customer,
    required this.contacts,
  });

  int status;
  String message;
  Customer customer;
  Contacts contacts;

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      AuthenticationResponse(
        status: json["status"],
        message: json["message"],
        customer: Customer.fromJson(json["customer"]),
        contacts: Contacts.fromJson(json["contacts"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "customer": customer.toJson(),
        "contacts": contacts.toJson(),
      };
}

class Contacts {
  Contacts({
    required this.phone,
    required this.link,
    required this.email,
  });

  String phone;
  String link;
  String email;

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        phone: json["phone"],
        link: json["link"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "link": link,
        "email": email,
      };
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.numOfNotifications,
  });

  String id;
  String name;
  int numOfNotifications;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        numOfNotifications: json["numOfNotifications"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "numOfNotifications": numOfNotifications,
      };
}

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String lastName;
  final String mail;
  final String phone;
  final String profilePhotoLink;
  final Timestamp registerDate;

  User({
    required this.id,
    required this.mail,
    required this.phone,
    required this.profilePhotoLink,
    required this.registerDate,
    required this.name,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'last_name': lastName,
        'mail': mail,
        'phone': phone,
        'profile_photo_link': profilePhotoLink,
        'register_date': registerDate,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        lastName: json['last_name'],
        mail: json['mail'],
        phone: json['phone'],
        profilePhotoLink: json['profile_photo_link'],
        registerDate: json['register_date'],
      );
}

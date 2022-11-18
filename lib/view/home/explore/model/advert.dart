import 'package:cloud_firestore/cloud_firestore.dart';

class Advert {
  String id;
  final String country;
  final String city;
  final String province;
  final String district;
  final List<String> advertPhotos;
  final double pricePerNight;
  final Timestamp availableDate;
  final GeoPoint location;
  final Rating rating;
  final int filterTypeId;

  Advert({
    required this.id,
    required this.country,
    required this.city,
    required this.province,
    required this.district,
    required this.advertPhotos,
    required this.pricePerNight,
    required this.availableDate,
    required this.location,
    required this.rating,
    required this.filterTypeId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'country': country,
        'city': city,
        'province': province,
        'district': district,
        'advert_photos': advertPhotos,
        'price_per_night': pricePerNight,
        'available_date': availableDate,
        'location': location,
        'rating': rating.toJson(),
        'filter_type_id': filterTypeId,
      };

  static Advert fromJson(Map<String, dynamic> json) => Advert(
        id: json['id'],
        country: json['country'],
        city: json['city'],
        province: json['province'],
        district: json['district'],
        advertPhotos: List<String>.from(json['advert_photos'].map((x) => x)),
        pricePerNight: double.parse(json['price_per_night'].toString()),
        availableDate: json['available_date'],
        location: json['location'],
        rating: Rating.fromJson(json['rating']),
        filterTypeId: json['filter_type_id'],
      );
}

class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  static Location fromJson(Map<String, dynamic> json) => Location(
        json['latitude'],
        json['longitude'],
      );
}

class Rating {
  final double rate;
  final int review;

  Rating(this.rate, this.review);

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'review': review,
      };

  static Rating fromJson(Map<String, dynamic> json) => Rating(
        json['rate'],
        json['review'],
      );
}

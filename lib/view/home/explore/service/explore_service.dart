import 'dart:io';
import 'package:airbnb_clone/product/models/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/advert.dart';

class ExploreService {
  static final ExploreService _instance = ExploreService._init();
  static ExploreService get instance => _instance;
  ExploreService._init();

  Future<List<Advert>> getAdverts() async {
    try {
      var response = FirebaseFirestore.instance.collection('adverts').snapshots().map(
            (snapshot) => snapshot.docs.map((e) => Advert.fromJson(e.data())).toList(),
          );
      return response.first;
    } on SocketException {
      throw Failure('SocketException :( Check your internet connection');
    } on HttpException {
      throw Failure(' HttpException :(');
    } on FormatException {
      throw Failure('Format Exception :(');
    }
  }
}

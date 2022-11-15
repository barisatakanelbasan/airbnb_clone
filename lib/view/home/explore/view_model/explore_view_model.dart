// ignore_for_file: constant_identifier_names

import 'package:airbnb_clone/view/home/explore/model/advert.dart';
import 'package:airbnb_clone/view/home/explore/service/explore_service.dart';
import 'package:flutter/material.dart';
import '../../../../product/constants/enums.dart';
import '../../../../product/models/failure.dart';

class ExploreViewModel with ChangeNotifier {
  ExploreViewModel() {
    _state = AppState.IDLE;
    adverts = [];
    getAdverts();
  }

  AppState? _state;
  AppState get state => _state!;

  set changeState(AppState state) {
    _state = state;
    notifyListeners();
  }

  Failure? _failure;
  Failure get failure => _failure!;
  set setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  List<Advert>? adverts;
  // Get adverts
  Future<void> getAdverts() async {
    try {
      changeState = AppState.LOADING;
      adverts = await ExploreService.instance.getAdverts();
      changeState = AppState.IDLE;
    } on Failure catch (e) {
      setFailure = e;
      changeState = AppState.ERROR;
      adverts = [];
    }
  }

  // Filter
  int? _selectedFilterIndex;
  get selectedFilterIndex => _selectedFilterIndex;
  set setSelectedFilterIndex(int? index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }
}

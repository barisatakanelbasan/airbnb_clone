import 'package:flutter/material.dart';

import '../generation/colors.gen.dart';

class ProductConstants {
  static final ProductConstants _instance = ProductConstants._init();
  static ProductConstants get instance => _instance;
  ProductConstants._init();

  List<BoxShadow> get defaultShadow => [BoxShadow(blurRadius: 15, spreadRadius: 0, color: ColorName.black.withOpacity(.15))];
}

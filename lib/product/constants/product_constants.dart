import 'package:flutter/material.dart';

import '../generation/colors.gen.dart';

class ProductConstants {
  List<BoxShadow> get defaultShadow => [BoxShadow(blurRadius: 15, spreadRadius: 0, color: ColorName.black.withOpacity(.15))];
}

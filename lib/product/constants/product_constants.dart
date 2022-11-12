import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:flutter/material.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../generation/colors.gen.dart';

class ProductConstants {
  static final ProductConstants _instance = ProductConstants._init();
  static ProductConstants get instance => _instance;
  ProductConstants._init();

  List<BoxShadow> get defaultShadow => [BoxShadow(blurRadius: 15, spreadRadius: 0, color: ColorName.black.withOpacity(.15))];

  List<String> get filterNames => [
        LocaleKeys.filter_variables_design,
        LocaleKeys.filter_variables_omg,
        LocaleKeys.filter_variables_surfing,
        LocaleKeys.filter_variables_arctic,
        LocaleKeys.filter_variables_tropical,
        LocaleKeys.filter_variables_windmills,
      ];

  List<String> get filterIcons => [
        Assets.icon.icDesign.path,
        Assets.icon.icOmg.path,
        Assets.icon.icSurfing.path,
        Assets.icon.icArctic.path,
        Assets.icon.icTropical.path,
        Assets.icon.icWindmills.path,
      ];
}

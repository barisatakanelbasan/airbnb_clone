/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/ic_arctic.jpg
  AssetGenImage get icArctic =>
      const AssetGenImage('assets/icon/ic_arctic.jpg');

  /// File path: assets/icon/ic_design.jpg
  AssetGenImage get icDesign =>
      const AssetGenImage('assets/icon/ic_design.jpg');

  /// File path: assets/icon/ic_omg.jpg
  AssetGenImage get icOmg => const AssetGenImage('assets/icon/ic_omg.jpg');

  /// File path: assets/icon/ic_surfing.jpg
  AssetGenImage get icSurfing =>
      const AssetGenImage('assets/icon/ic_surfing.jpg');

  /// File path: assets/icon/ic_tropical.jpg
  AssetGenImage get icTropical =>
      const AssetGenImage('assets/icon/ic_tropical.jpg');

  /// File path: assets/icon/ic_windmills.jpg
  AssetGenImage get icWindmills =>
      const AssetGenImage('assets/icon/ic_windmills.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icArctic, icDesign, icOmg, icSurfing, icTropical, icWindmills];
}

class $AssetsLangGen {
  const $AssetsLangGen();

  /// File path: assets/lang/en-US.json
  String get enUS => 'assets/lang/en-US.json';

  /// File path: assets/lang/tr-TR.json
  String get trTR => 'assets/lang/tr-TR.json';

  /// List of all assets
  List<String> get values => [enUS, trTR];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/ic_airbnb.svg
  SvgGenImage get icAirbnb => const SvgGenImage('assets/svg/ic_airbnb.svg');

  /// File path: assets/svg/ic_fav.svg
  SvgGenImage get icFav => const SvgGenImage('assets/svg/ic_fav.svg');

  /// File path: assets/svg/ic_filter.svg
  SvgGenImage get icFilter => const SvgGenImage('assets/svg/ic_filter.svg');

  /// File path: assets/svg/ic_heart.svg
  SvgGenImage get icHeart => const SvgGenImage('assets/svg/ic_heart.svg');

  /// File path: assets/svg/ic_inbox.svg
  SvgGenImage get icInbox => const SvgGenImage('assets/svg/ic_inbox.svg');

  /// File path: assets/svg/ic_location.svg
  SvgGenImage get icLocation => const SvgGenImage('assets/svg/ic_location.svg');

  /// File path: assets/svg/ic_map.svg
  SvgGenImage get icMap => const SvgGenImage('assets/svg/ic_map.svg');

  /// File path: assets/svg/ic_profile.svg
  SvgGenImage get icProfile => const SvgGenImage('assets/svg/ic_profile.svg');

  /// File path: assets/svg/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/svg/ic_search.svg');

  /// File path: assets/svg/ic_settings.svg
  SvgGenImage get icSettings => const SvgGenImage('assets/svg/ic_settings.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icAirbnb,
        icFav,
        icFilter,
        icHeart,
        icInbox,
        icLocation,
        icMap,
        icProfile,
        icSearch,
        icSettings
      ];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsLangGen lang = $AssetsLangGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/downcat.png
  AssetGenImage get downcat => const AssetGenImage('assets/icon/downcat.png');

  /// File path: assets/icon/hash.png
  AssetGenImage get hash => const AssetGenImage('assets/icon/hash.png');

  /// File path: assets/icon/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icon/icon.png');

  /// File path: assets/icon/micro.png
  AssetGenImage get micro => const AssetGenImage('assets/icon/micro.png');

  /// File path: assets/icon/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/icon/pen.png');

  /// File path: assets/icon/user.png
  AssetGenImage get user => const AssetGenImage('assets/icon/user.png');

  /// File path: assets/icon/w.png
  AssetGenImage get w => const AssetGenImage('assets/icon/w.png');

  /// List of all assets
  List<AssetGenImage> get values => [downcat, hash, icon, micro, pen, user, w];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/a1.png
  AssetGenImage get a1 => const AssetGenImage('assets/img/a1.png');

  /// File path: assets/img/poster_test.png
  AssetGenImage get posterTest =>
      const AssetGenImage('assets/img/poster_test.png');

  /// File path: assets/img/profile_img.png
  AssetGenImage get profileImg =>
      const AssetGenImage('assets/img/profile_img.png');

  /// File path: assets/img/sing.svg
  String get sing => 'assets/img/sing.svg';

  /// File path: assets/img/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/img/single_place_holder.jpg');

  /// List of all assets
  List<dynamic> get values =>
      [a1, posterTest, profileImg, sing, singlePlaceHolder];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImgGen img = $AssetsImgGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

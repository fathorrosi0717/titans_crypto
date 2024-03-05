// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/view/styles/colors.dart';

@immutable
class AppStyle {
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9;
    } else {
      scale = .85;
    }
  }

  late final double scale;

  final AppColors colors = AppColors();

  late final _Corners corners = _Corners();

  late final _Insets insets = _Insets(scale);

  late final _Text text = _Text(scale);

  late final _Sizes sizes = _Sizes();
}

@immutable
class _Text {
  _Text(this._scale);
  final double _scale;

  final fonts = const TextStyle(fontFamily: 'NeueMontreal');

  late final displayLarge =
      _createFont(fonts, sizePx: 57, heightPx: 64, weight: FontWeight.w400);
  late final displayMedium =
      _createFont(fonts, sizePx: 45, heightPx: 52, weight: FontWeight.w400);
  late final displaySmall =
      _createFont(fonts, sizePx: 36, heightPx: 44, weight: FontWeight.w400);
  late final headlineLarge =
      _createFont(fonts, sizePx: 32, heightPx: 40, weight: FontWeight.w400);
  late final headlineMedium =
      _createFont(fonts, sizePx: 28, heightPx: 36, weight: FontWeight.w400);
  late final headlineSmall =
      _createFont(fonts, sizePx: 24, heightPx: 32, weight: FontWeight.w400);
  late final titleLarge =
      _createFont(fonts, sizePx: 22, heightPx: 28, weight: FontWeight.w400);
  late final titleMedium =
      _createFont(fonts, sizePx: 16, heightPx: 24, weight: FontWeight.w500);
  late final titleSmall =
      _createFont(fonts, sizePx: 14, heightPx: 20, weight: FontWeight.w500);
  late final labelLarge =
      _createFont(fonts, sizePx: 14, heightPx: 20, weight: FontWeight.w500);
  late final labelMedium =
      _createFont(fonts, sizePx: 12, heightPx: 16, weight: FontWeight.w500);
  late final labelSmall =
      _createFont(fonts, sizePx: 11, heightPx: 16, weight: FontWeight.w500);
  late final bodyLarge =
      _createFont(fonts, sizePx: 16, heightPx: 24, weight: FontWeight.w400);
  late final bodyMedium =
      _createFont(fonts, sizePx: 14, heightPx: 20, weight: FontWeight.w400);
  late final bodySmall =
      _createFont(fonts, sizePx: 12, heightPx: 16, weight: FontWeight.w400);

  TextStyle _createFont(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    sizePx *= _scale;
    if (heightPx != null) {
      heightPx *= _scale;
    }
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight,
        color: $styles.colors.white);
  }
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;
}

// TODO: add, @immutable when design is solidified
class _Sizes {
  double get maxContentWidth1 => 800;
  double get maxContentWidth2 => 600;
  double get maxContentWidth3 => 500;
  final Size minAppSize = const Size(380, 650);
}

@immutable
class _Insets {
  _Insets(this._scale);
  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 16 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color smokyBlack;
  late Color white;
  late Color roseQuartz;
  late Color africanViolet;
  late Color lavenderWeb;
  late Color thistle;
  late Color black;
  late Color blueViolet;
  late Color russianViolet;
  late Color russianViolet2;
  late Color darkText;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFE2DADA);
  late Color secondary = const Color(0xFF9E87BC);
  late Color tertiary = const Color(0xFF5F218E);
  late Color alternate = const Color(0xFFFDBA31);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF301852);
  late Color primaryBackground = const Color(0xFFFDFCFE);
  late Color secondaryBackground = const Color(0xFFE2DADA);
  late Color accent1 = const Color(0xFFFDBA31);
  late Color accent2 = const Color(0xFF7B2CDA);
  late Color accent3 = const Color(0xFF000000);
  late Color accent4 = const Color(0xFFE2DADA);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color smokyBlack = const Color(0xFF0A0403);
  late Color white = const Color(0xFFFDFCFE);
  late Color roseQuartz = const Color(0xFF998B99);
  late Color africanViolet = const Color(0xFF9E87BC);
  late Color lavenderWeb = const Color(0xFFDFDCEA);
  late Color thistle = const Color(0xFFCEC8DE);
  late Color black = const Color(0xFF000002);
  late Color blueViolet = const Color(0xFF7B2CDA);
  late Color russianViolet = const Color(0xFF201037);
  late Color russianViolet2 = const Color(0xFF301852);
  late Color darkText = const Color(0xFF2D0040);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Archivo Black';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Archivo Black',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Archivo Black';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Archivo Black',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
      );
  String get displaySmallFamily => 'Archivo Black';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Archivo Black',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineLargeFamily => 'Archivo Black';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Archivo Black',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineMediumFamily => 'Archivo Black';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Archivo Black',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineSmallFamily => 'Archivo Black';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Archivo Black',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get titleLargeFamily => 'satoshi';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'satoshi';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'satoshi';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get labelLargeFamily => 'satoshi';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      );
  String get labelMediumFamily => 'satoshi';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'satoshi';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Poppins';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Poppins',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyMediumFamily => 'Poppins';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Poppins',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get bodySmallFamily => 'Poppins';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Poppins',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'satoshi';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'satoshi';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'satoshi';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'satoshi';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'satoshi';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'satoshi';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'satoshi';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'satoshi';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'satoshi';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get labelLargeFamily => 'satoshi';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      );
  String get labelMediumFamily => 'satoshi';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'satoshi';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'satoshi';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'satoshi';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'satoshi';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'satoshi';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'satoshi';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'satoshi';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'satoshi';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'satoshi';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'satoshi';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'satoshi';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'satoshi';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'satoshi';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.normal,
      );
  String get labelLargeFamily => 'satoshi';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      );
  String get labelMediumFamily => 'satoshi';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'satoshi';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'satoshi';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'satoshi';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'satoshi';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'satoshi',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}

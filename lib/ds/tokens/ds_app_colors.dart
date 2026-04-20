import 'package:flutter/material.dart';
import 'package:gestao_velas/ds/tokens/ds_foundations.dart';

class DsAppColors extends ThemeExtension<DsAppColors> {
  // Static
  final Color staticBlack;
  final Color staticWhite;

  // Background
  final Color bgStrong950;
  final Color bgSurface800;
  final Color bgSub300;
  final Color bgSoft200;
  final Color bgSoft100;
  final Color bgWeek50;
  final Color bgWhite0;
  final Color bgDisabled300;

  // Text
  final Color textStrong950;
  final Color textSub600;
  final Color textSub400;
  final Color textDisabled;
  final Color textWhite0;

  // Stroke
  final Color strokeStrong950;
  final Color strokeSub300;
  final Color strokeSoft200;
  final Color strokeWhite0;

  // Icon
  final Color iconSub600;
  final Color iconSoft400;

  // Faded
  final Color fadedDark;
  final Color fadedBase;
  final Color fadedLight;
  final Color fadedLighter;

  // Information
  final Color informationDark;
  final Color informationBase;
  final Color informationLight;
  final Color informationLighter;

  // Warning
  final Color warningDark;
  final Color warningBase;
  final Color warningLight;
  final Color warningLighter;

  // Error
  final Color errorDark;
  final Color errorBase;
  final Color errorLight;
  final Color errorLighter;

  // Success
  final Color successDark;
  final Color successBase;
  final Color successLight;
  final Color successLighter;

  // Away
  final Color awayDark;
  final Color awayBase;
  final Color awayLight;
  final Color awayLighter;

  // Feature
  final Color featureDark;
  final Color featureBase;
  final Color featureLight;
  final Color featureLighter;

  // Verified
  final Color verifiedDark;
  final Color verifiedBase;
  final Color verifiedLight;
  final Color verifiedLighter;

  // Highlighted
  final Color highlightedDark;
  final Color highlightedBase;
  final Color highlightedLight;
  final Color highlightedLighter;

  // Stable
  final Color stableDark;
  final Color stableBase;
  final Color stableLight;
  final Color stableLighter;

  // State
  final Color stateDark;

  // Overlay
  final Color overlayGray;
  final Color overlayState;
  final Color overlayWhite;
  final Color overlayWhite0;

  // Neutral
  final Color neutralSoft;
  final Color neutralStrong;

  // Theme
  final Color themeBlueBase;

  const DsAppColors({
    required this.staticBlack,
    required this.staticWhite,
    required this.bgStrong950,
    required this.bgSurface800,
    required this.bgSub300,
    required this.bgSoft200,
    required this.bgSoft100,
    required this.bgWeek50,
    required this.bgWhite0,
    required this.bgDisabled300,
    required this.textStrong950,
    required this.textSub600,
    required this.textSub400,
    required this.textDisabled,
    required this.textWhite0,
    required this.strokeStrong950,
    required this.strokeSub300,
    required this.strokeSoft200,
    required this.strokeWhite0,
    required this.iconSub600,
    required this.iconSoft400,
    required this.fadedDark,
    required this.fadedBase,
    required this.fadedLight,
    required this.fadedLighter,
    required this.informationDark,
    required this.informationBase,
    required this.informationLight,
    required this.informationLighter,
    required this.warningDark,
    required this.warningBase,
    required this.warningLight,
    required this.warningLighter,
    required this.errorDark,
    required this.errorBase,
    required this.errorLight,
    required this.errorLighter,
    required this.successDark,
    required this.successBase,
    required this.successLight,
    required this.successLighter,
    required this.awayDark,
    required this.awayBase,
    required this.awayLight,
    required this.awayLighter,
    required this.featureDark,
    required this.featureBase,
    required this.featureLight,
    required this.featureLighter,
    required this.verifiedDark,
    required this.verifiedBase,
    required this.verifiedLight,
    required this.verifiedLighter,
    required this.highlightedDark,
    required this.highlightedBase,
    required this.highlightedLight,
    required this.highlightedLighter,
    required this.stableDark,
    required this.stableBase,
    required this.stableLight,
    required this.stableLighter,
    required this.stateDark,
    required this.overlayGray,
    required this.overlayState,
    required this.overlayWhite,
    required this.overlayWhite0,
    required this.neutralSoft,
    required this.neutralStrong,
    required this.themeBlueBase,
  });

  static final light = DsAppColors(
    // Static
    staticBlack: DSFoundations.neutralGrey950,
    staticWhite: DSFoundations.neutralGrey0,

    // Background
    bgStrong950: DSFoundations.neutralGrey950,
    bgSurface800: DSFoundations.neutralGrey800,
    bgSub300: DSFoundations.neutralGrey300,
    bgSoft200: DSFoundations.neutralGrey200,
    bgSoft100: DSFoundations.neutralGrey100,
    bgWeek50: DSFoundations.neutralGrey50,
    bgWhite0: DSFoundations.neutralGrey0,
    bgDisabled300: DSFoundations.neutralGrey300,

    // Text
    textStrong950: DSFoundations.neutralGrey950,
    textSub600: DSFoundations.neutralGrey600,
    textSub400: DSFoundations.neutralGrey400,
    textDisabled: DSFoundations.neutralGrey300,
    textWhite0: DSFoundations.neutralGrey300,

    // Stroke
    strokeStrong950: DSFoundations.neutralGrey950,
    strokeSub300: DSFoundations.neutralGrey300,
    strokeSoft200: DSFoundations.neutralGrey200,
    strokeWhite0: DSFoundations.neutralGrey300,

    // Icon
    iconSub600: DSFoundations.neutralState600,
    iconSoft400: DSFoundations.neutralState400,

    // Faded
    fadedDark: DSFoundations.neutralGrey800,
    fadedBase: DSFoundations.neutralGrey500,
    fadedLight: DSFoundations.neutralGrey200,
    fadedLighter: DSFoundations.neutralGrey100,

    // Information
    informationDark: DSFoundations.blue950,
    informationBase: DSFoundations.blue500,
    informationLight: DSFoundations.blue200,
    informationLighter: DSFoundations.blue50,

    // Warning
    warningDark: DSFoundations.orange950,
    warningBase: DSFoundations.orange500,
    warningLight: DSFoundations.orange200,
    warningLighter: DSFoundations.orange50,

    // Error
    errorDark: DSFoundations.red950,
    errorBase: DSFoundations.red500,
    errorLight: DSFoundations.red200,
    errorLighter: DSFoundations.red50,

    // Success
    successDark: DSFoundations.green950,
    successBase: DSFoundations.green500,
    successLight: DSFoundations.green200,
    successLighter: DSFoundations.green50,

    // Away
    awayDark: DSFoundations.yellow950,
    awayBase: DSFoundations.yellow500,
    awayLight: DSFoundations.yellow200,
    awayLighter: DSFoundations.yellow50,

    // Feature
    featureDark: DSFoundations.purple950,
    featureBase: DSFoundations.purple500,
    featureLight: DSFoundations.purple200,
    featureLighter: DSFoundations.purple50,

    // Verified
    verifiedDark: DSFoundations.sky950,
    verifiedBase: DSFoundations.sky500,
    verifiedLight: DSFoundations.sky200,
    verifiedLighter: DSFoundations.sky50,

    // Highlighted
    highlightedDark: DSFoundations.pink950,
    highlightedBase: DSFoundations.pink500,
    highlightedLight: DSFoundations.pink200,
    highlightedLighter: DSFoundations.pink50,

    // Stable
    stableDark: DSFoundations.teal950,
    stableBase: DSFoundations.teal500,
    stableLight: DSFoundations.teal200,
    stableLighter: DSFoundations.teal50,

    // State
    stateDark: DSFoundations.alphaWhite24,

    // Overlay
    overlayGray: const Color(0xFF333333).withAlpha(24),
    overlayState: const Color(0xFF2B303B).withAlpha(24),
    overlayWhite: DSFoundations.neutralGrey0,
    overlayWhite0: DSFoundations.neutralGrey0.withAlpha(0),

    // Neutral
    neutralSoft: DSFoundations.alphaBlack4,
    neutralStrong: DSFoundations.alphaBlack16,
    themeBlueBase: DSFoundations.blue500,
  );

  static final dark = DsAppColors(
    // Static
    staticBlack: DSFoundations.neutralGrey950,
    staticWhite: DSFoundations.neutralGrey0,

    // Background
    bgStrong950: DSFoundations.neutralGrey0,
    bgSurface800: DSFoundations.neutralGrey200,
    bgSub300: DSFoundations.neutralGrey600,
    bgSoft200: DSFoundations.neutralGrey700,
    bgSoft100: DSFoundations.neutralGrey600,
    bgWeek50: DSFoundations.neutralGrey900,
    bgWhite0: DSFoundations.neutralGrey950,
    bgDisabled300: DSFoundations.neutralGrey600,

    // Text
    textStrong950: DSFoundations.neutralGrey50,
    textSub600: DSFoundations.neutralGrey400,
    textSub400: DSFoundations.neutralGrey500,
    textDisabled: DSFoundations.neutralGrey500,
    textWhite0: DSFoundations.neutralGrey500,

    // Stroke
    strokeStrong950: DSFoundations.neutralGrey50,
    strokeSub300: DSFoundations.neutralGrey600,
    strokeSoft200: DSFoundations.neutralGrey800,
    strokeWhite0: DSFoundations.neutralGrey500,

    // Icon
    iconSub600: DSFoundations.neutralState600,
    iconSoft400: DSFoundations.neutralState500,

    // Faded
    fadedDark: DSFoundations.neutralGrey300,
    fadedBase: DSFoundations.neutralGrey500,
    fadedLight: DSFoundations.alphaNeutralGrey24,
    fadedLighter: DSFoundations.alphaNeutralGrey16,

    // Information
    informationDark: DSFoundations.blue400,
    informationBase: DSFoundations.blue500,
    informationLight: DSFoundations.alphaBlue24,
    informationLighter: DSFoundations.alphaBlue16,

    // Warning
    warningDark: DSFoundations.orange400,
    warningBase: DSFoundations.orange600,
    warningLight: DSFoundations.alphaOrange24,
    warningLighter: DSFoundations.alphaOrange16,

    // Error
    errorDark: DSFoundations.red400,
    errorBase: DSFoundations.red600,
    errorLight: DSFoundations.alphaRed24,
    errorLighter: DSFoundations.alphaRed16,

    // Success
    successDark: DSFoundations.green400,
    successBase: DSFoundations.green600,
    successLight: DSFoundations.alphaGreen24,
    successLighter: DSFoundations.alphaGreen16,

    // Away
    awayDark: DSFoundations.yellow400,
    awayBase: DSFoundations.yellow600,
    awayLight: DSFoundations.alphaYellow24,
    awayLighter: DSFoundations.alphaYellow16,

    // Feature
    featureDark: DSFoundations.purple400,
    featureBase: DSFoundations.purple600,
    featureLight: DSFoundations.alphaPurple24,
    featureLighter: DSFoundations.alphaPurple16,

    // Verified
    verifiedDark: DSFoundations.sky400,
    verifiedBase: DSFoundations.sky600,
    verifiedLight: DSFoundations.alphaSky24,
    verifiedLighter: DSFoundations.alphaSky16,

    // Highlighted
    highlightedDark: DSFoundations.pink400,
    highlightedBase: DSFoundations.pink600,
    highlightedLight: DSFoundations.alphaPink24,
    highlightedLighter: DSFoundations.alphaPink16,

    // Stable
    stableDark: DSFoundations.teal400,
    stableBase: DSFoundations.teal600,
    stableLight: DSFoundations.alphaTeal24,
    stableLighter: DSFoundations.alphaTeal16,

    // State
    stateDark: DSFoundations.teal400,

    // Overlay
    overlayGray: const Color(0xFF525866).withAlpha(56),
    overlayState: const Color(0xFF2B303B).withAlpha(56),
    overlayWhite: DSFoundations.neutralGrey950,
    overlayWhite0: DSFoundations.neutralGrey950.withAlpha(0),

    // Neutral
    neutralSoft: DSFoundations.alphaWhite4,
    neutralStrong: DSFoundations.alphaWhite16,

    themeBlueBase: DSFoundations.blue500,
  );

  @override
  DsAppColors copyWith() => this;

  @override
  DsAppColors lerp(ThemeExtension<DsAppColors>? other, double t) {
    if (other is! DsAppColors) return this;
    return this;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../tokens/ds_foundations.dart';
import '../tokens/ds_app_colors.dart';

class DsTheme {
  const DsTheme._();

  static ThemeData light({
    required TextTheme textTheme,
    required Color primaryColor,
  }) => _build(
    colors: DsAppColors.light,
    brightness: Brightness.light,
    textTheme: textTheme,
    primaryColor: primaryColor,
  );

  static ThemeData dark({
    required TextTheme textTheme,
    required Color primaryColor,
  }) => _build(
    colors: DsAppColors.dark,
    brightness: Brightness.dark,
    textTheme: textTheme,
    primaryColor: primaryColor,
  );

  static ThemeData _build({
    required DsAppColors colors,
    required Brightness brightness,
    required TextTheme textTheme,
    required Color primaryColor,
  }) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = ColorScheme(
      brightness: brightness,

      primary: primaryColor,
      onPrimary: DSFoundations.neutralGrey0,
      primaryContainer: isDark
          ? DSFoundations.neutralState800
          : DSFoundations.neutralState100,
      onPrimaryContainer: isDark
          ? DSFoundations.neutralState100
          : DSFoundations.neutralState900,

      secondary: primaryColor,
      onSecondary: DSFoundations.neutralGrey0,
      secondaryContainer: isDark
          ? DSFoundations.neutralState700
          : DSFoundations.neutralState50,
      onSecondaryContainer: isDark
          ? DSFoundations.neutralState200
          : DSFoundations.neutralState800,

      surface: colors.bgWhite0,
      onSurface: colors.textStrong950,
      surfaceContainerHighest: colors.bgSub300,
      surfaceContainerHigh: colors.bgSoft200,
      surfaceContainer: colors.bgSoft100,
      surfaceContainerLow: colors.bgWeek50,
      surfaceContainerLowest: colors.bgWhite0,
      onSurfaceVariant: colors.textSub600,

      error: colors.errorBase,
      onError: DSFoundations.neutralGrey0,
      errorContainer: colors.errorLighter,
      onErrorContainer: colors.errorDark,

      outline: colors.strokeSub300,
      outlineVariant: colors.strokeSoft200,
      shadow: DSFoundations.alphaBlack16,
      scrim: DSFoundations.alphaBlack50,
      inverseSurface: colors.bgStrong950,
      onInverseSurface: colors.bgWhite0,
      inversePrimary: isDark ? primaryColor : DSFoundations.neutralState200,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [colors],
      textTheme: textTheme,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,

      scaffoldBackgroundColor: colors.bgWhite0,

      appBarTheme: AppBarTheme(
        backgroundColor: colors.bgWhite0,
        foregroundColor: colors.textStrong950,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              )
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
      ),

      cardTheme: CardThemeData(
        color: colors.bgSoft100,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.strokeSoft200),
        ),
        margin: EdgeInsets.zero,
      ),

      dividerTheme: DividerThemeData(
        color: colors.strokeSoft200,
        thickness: 1,
        space: 1,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.bgWhite0,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintStyle: TextStyle(color: colors.textDisabled),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.strokeSub300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.strokeSub300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.errorBase),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.errorBase, width: 2),
        ),
        errorStyle: TextStyle(color: colors.errorBase, fontSize: 12),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: DSFoundations.neutralGrey0,
          disabledBackgroundColor: colors.bgDisabled300,
          disabledForegroundColor: colors.textDisabled,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          disabledForegroundColor: colors.textDisabled,
          side: BorderSide(color: colors.strokeSub300),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          disabledForegroundColor: colors.textDisabled,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: colors.iconSub600),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return DSFoundations.neutralGrey0;
          }
          return colors.textDisabled;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryColor;
          return colors.bgSub300;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryColor;
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(DSFoundations.neutralGrey0),
        side: BorderSide(color: colors.strokeSub300, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return primaryColor;
          return colors.strokeSub300;
        }),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.bgWhite0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        indicatorColor: colors.informationLighter,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: primaryColor);
          }
          return IconThemeData(color: colors.iconSoft400);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? primaryColor
              : colors.textSub600;
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          );
        }),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.bgWhite0,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.bgWhite0,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.textStrong950,
        ),
        contentTextStyle: TextStyle(fontSize: 14, color: colors.textSub600),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.bgSoft100,
        selectedColor: colors.informationLighter,
        disabledColor: colors.bgDisabled300,
        labelStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: colors.textSub600,
        ),
        side: BorderSide(color: colors.strokeSoft200),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.bgStrong950,
        contentTextStyle: TextStyle(color: colors.bgWhite0, fontSize: 14),
        actionTextColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),

      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        iconColor: colors.iconSub600,
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colors.textStrong950,
        ),
        subtitleTextStyle: TextStyle(fontSize: 13, color: colors.textSub600),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: colors.bgWhite0,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: colors.strokeSoft200),
        ),
        textStyle: TextStyle(fontSize: 14, color: colors.textStrong950),
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.bgStrong950,
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: TextStyle(fontSize: 12, color: colors.bgWhite0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: colors.bgSub300,
        circularTrackColor: colors.bgSub300,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: DSFoundations.neutralGrey0,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      tabBarTheme: TabBarThemeData(
        labelColor: primaryColor,
        unselectedLabelColor: colors.textSub600,
        indicatorColor: primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: colors.strokeSoft200,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}

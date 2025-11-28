import 'package:yell/core/barrel/barrel.dart';

class AMTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AMColors.royalBlue,
    scaffoldBackgroundColor: AMColors.white,
    colorScheme: ColorScheme.light(
      primary: AMColors.royalBlue,
      secondary: AMColors.teal,
      tertiary: AMColors.amber,
      surface: AMColors.white,
      surfaceContainerHighest: AMColors.lightGray,
      error: AMColors.crimson,
      onPrimary: AMColors.white,
      onSecondary: AMColors.white,
      onSurface: AMColors.charcoal,
      onError: AMColors.white,
      outline: AMColors.gray,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AMColors.cobaltBlue,
    scaffoldBackgroundColor: AMColors.black,
    colorScheme: ColorScheme.dark(
      primary: AMColors.cobaltBlue,
      secondary: AMColors.turquoise,
      tertiary: AMColors.gold,
      surface: AMColors.charcoal,
      surfaceContainerHighest: AMColors.darkGray,
      error: AMColors.tomato,
      onPrimary: AMColors.white,
      onSecondary: AMColors.black,
      onSurface: AMColors.white,
      onError: AMColors.white,
      outline: AMColors.gray,
    ),
  );
}

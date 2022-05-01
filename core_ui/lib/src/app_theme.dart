part of core_ui;

class AppTheme {
  static const Color bgPrimaryColor = AppColors.main;

  //In a MaterialColor object we have to put a swatch property, providing color values for the ten different luminances.
  static MaterialColor colorPrimary = MaterialColor(
    AppColors.black.value,
    const <int, Color>{
      50: AppColors.black,
      100: AppColors.black,
      200: AppColors.black,
      300: AppColors.black,
      400: AppColors.black,
      500: AppColors.black,
      600: AppColors.black,
      700: AppColors.black,
      800: AppColors.black,
      900: AppColors.black,
    },
  );
}

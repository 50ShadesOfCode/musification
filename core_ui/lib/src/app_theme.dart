part of core_ui;

class AppTheme {
  static const Color bgPrimaryColor = AppColors.main;

  //In a MaterialColor object we have to put a swatch property, providing color values for the ten different luminances.
  static MaterialColor colorPrimary = MaterialColor(
    AppColors.main.value,
    const <int, Color>{
      50: AppColors.main,
      100: AppColors.main,
      200: AppColors.main,
      300: AppColors.main,
      400: AppColors.main,
      500: AppColors.main,
      600: AppColors.main,
      700: AppColors.main,
      800: AppColors.main,
      900: AppColors.main,
    },
  );
}

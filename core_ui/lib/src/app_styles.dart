part of core_ui;

class AppStyles {
  static ButtonStyle doneTextButtonStyle = TextButton.styleFrom(
    backgroundColor: AppTheme.accentColor,
    primary: AppTheme.activeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

part of core_ui;

class AppImages {
  static const String _basePngUrl = 'assets/images/png/';
  static const String _baseSvgUrl = 'assets/images/svg/';

  static const String logoPngKey = _basePngUrl + 'logo.png';

  static const String logoSvgKey = _baseSvgUrl + 'logo.svg';

  static List<String> genreImageList = List<String>.generate(
      12, (int index) => 'genre' + index.toString() + '.png');
}

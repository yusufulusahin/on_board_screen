class SVGImagePaths {
  static late final SVGImagePaths _instance;
  static SVGImagePaths get instance {
    if (_instance == null) _instance = SVGImagePaths._init();
    return _instance;
  }

  SVGImagePaths._init();

  final first = "onboard_first".toSvg;
  final second = "onboard_second".toSvg;
  final third = "onboard_third".toSvg;
}

extension _SVGPATH on String {
  String get toSvg => "$this.svg";
}

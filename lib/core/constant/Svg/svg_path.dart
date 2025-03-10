class SVGImagePaths {
  static SVGImagePaths? _instance;

  static SVGImagePaths get instance {
    _instance ??= SVGImagePaths._init();
    return _instance!;
  }

  SVGImagePaths._init();

  final first = "onboard_first".toSvg;
  final second = "onboard_second".toSvg;
  final third = "onboard_third".toSvg;
}

extension _SVGPATH on String {
  String get toSvg => "asset/svg/$this.svg";
}

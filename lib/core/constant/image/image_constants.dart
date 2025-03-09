class ImageConstants {
  static late final ImageConstants _instance;

  static ImageConstants get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();
  String get logo => toPng("yusi");
  String toPng(String name) => "assets/image/$name";
}

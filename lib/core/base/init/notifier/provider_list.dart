import 'package:provider/single_child_widget.dart';

class ApplicationProviders {
  static late final ApplicationProviders _instance;
  static ApplicationProviders get instance {
    if (_instance == null) _instance = ApplicationProviders._init();
    return _instance;
  }

  ApplicationProviders._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [];
  List<SingleChildWidget> uiChangesItems = [];
}

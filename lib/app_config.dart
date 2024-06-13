
class AppConfig {
  AppConfig._internal();

  // define atributos y métodos para cada flavors

  late String _name;

  static final AppConfig _instance = AppConfig._internal();

  static AppConfig get instance => _instance;

  String get name => _name;

  void init({required String name}) {
    _name = name;
  }
}

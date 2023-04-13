

class Singleton {
  Singleton._privateConstructor();
  static Singleton get instance => _instance;

  static final Singleton _instance = Singleton._privateConstructor();
  factory Singleton() {
    return _instance;
  }


  double? currentLat = 0.0;
  double? currentLng = 0.0;
  String? currentAddress = "";



}

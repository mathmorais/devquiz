class AppImages {
  static String get hierarchy => "assets/images/hierarchy.png";
  static String get data => "assets/images/data.png";
  static String get laptop => "assets/images/laptop.png";
  static String get blocks => "assets/images/blocks.png";
  static String get check => "assets/images/check.png";
  static String get error => "assets/images/error.png";
  static String get trophy => "assets/images/trophy.png";
  static String get logo => "assets/images/logo.png";

  Map<String, String> _parseToMap() => {
        'hierarchy': hierarchy,
        'data': data,
        'laptop': laptop,
        'blocks': blocks,
        'check': check,
        'error': error,
        'trophy': trophy,
        'logo': logo
      };

  String getProperty(String property) {
    final imagesMap = _parseToMap();

    if (imagesMap.containsKey(property)) {
      return imagesMap[property]!;
    }

    throw ArgumentError("$property don't exist in AppImages");
  }
}

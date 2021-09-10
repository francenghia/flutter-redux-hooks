class RegExpPattern {
  static const Pattern emailRegExpPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const Pattern mobileRegExpPattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static const Pattern alpha = r'^[a-zA-Z]+$';

  static const Pattern alphanumeric = r'^[a-zA-Z0-9]+$';

  static const Pattern numeric = r'^-?[0-9]+$';

  static const Pattern int = r'^(?:-?(?:0|[1-9][0-9]*))$';
  static const Pattern float =
      r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$';

  static const Pattern base64 =
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$';

  static const Pattern url = r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+";
}

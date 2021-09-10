import 'package:flutter_redux_hooks/core/utils/regexp_pattern.dart';

class ValidateUtils {
  /// check if string [str] is Email
  static bool validateEmail(String value) {
    RegExp regex = RegExp(RegExpPattern.emailRegExpPattern.toString());
    if (regex.hasMatch(value)) {
      return true;
    }
    return false;
  }

  /// check if string [str] is null or whitespace
  static bool isNullEmptyOrWhitespace(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  /// check if string [str] is phone
  static bool validatePhone(String value) {
    RegExp regex = RegExp(RegExpPattern.mobileRegExpPattern.toString());
    if (regex.hasMatch(value)) {
      return true;
    }
    return false;
  }

  /// check if the string contains the seed
  static bool contains(String str, seed) {
    return str.indexOf(seed.toString()) >= 0;
  }

  /// check if string [str] matches the [pattern].
  bool matches(String str, pattern) {
    RegExp re = new RegExp(pattern);
    return re.hasMatch(str);
  }

  /// check if the string matches the comparison
  bool equals(String? str, comparison) {
    return str == comparison.toString();
  }

  /// check if the string [str] is null
  bool isNull(String? str) {
    return str == null || str.length == 0;
  }

  /// check if the string [str] is lowercase
  bool isLowercase(String str) {
    return str == str.toLowerCase();
  }

  /// check if the string [str] is uppercase
  bool isUppercase(String str) {
    return str == str.toUpperCase();
  }

  /// check if the string [str] contains only letters (a-zA-Z).
  bool isAlpha(String str) {
    return RegExp(RegExpPattern.alpha.toString()).hasMatch(str);
  }

  /// check if the string [str] is an integer
  bool isInt(String str) {
    return RegExp(RegExpPattern.int.toString()).hasMatch(str);
  }

  /// check if the string [str] is a float
  bool isFloat(String str) {
    return RegExp(RegExpPattern.float.toString()).hasMatch(str);
  }

  /// check if the string [str] contains only numbers
  bool isNumeric(String str) {
    return RegExp(RegExpPattern.numeric.toString()).hasMatch(str);
  }

  /// check if the string [str] contains only letters and numbers
  bool isAlphanumeric(String str) {
    return RegExp(RegExpPattern.alphanumeric.toString()).hasMatch(str);
  }

  /// check if a string [str] is base64 encoded
  bool isBase64(String str) {
    return RegExp(RegExpPattern.base64.toString()).hasMatch(str);
  }

  /// check if a string [str] is url
  bool isUrl(String value) {
    return RegExp(RegExpPattern.url.toString()).hasMatch(value);
  }
}

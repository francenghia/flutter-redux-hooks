import 'dart:math';

class StringUtils {
  /// Returns the given string or the default string if the given string is null
  static String defaultString(String? str, {String defaultStr = ''}) {
    return str ?? defaultStr;
  }

  /// Reverse the given string [s]
  static String reverse(String s) {
    return String.fromCharCodes(s.runes.toList().reversed);
  }

  /// Removes character with [index] from a String [value]
  static String removeCharAtPosition(String value, int index) {
    try {
      return value.substring(0, -1 + index) +
          value.substring(index, value.length);
    } catch (e) {
      return value;
    }
  }

  ///Remove String[value] with [pattern]
  static String removeExp(String value, String pattern,
      {bool repeat = true,
      bool caseSensitive = true,
      bool multiLine = false,
      bool dotAll = false,
      bool unicode = false}) {
    var result = value;
    if (repeat) {
      result = value
          .replaceAll(
              RegExp(pattern,
                  caseSensitive: caseSensitive,
                  multiLine: multiLine,
                  dotAll: dotAll,
                  unicode: unicode),
              '')
          .replaceAll(RegExp(' +'), ' ')
          .trim();
    } else {
      result = value
          .replaceFirst(
              RegExp(pattern,
                  caseSensitive: caseSensitive,
                  multiLine: multiLine,
                  dotAll: dotAll,
                  unicode: unicode),
              '')
          .replaceAll(RegExp(' +'), ' ')
          .trim();
    }
    return result;
  }

  /// Takes in a String[value] and truncates it with [length]
  static String truncate(String value, int length, {String symbol = '...'}) {
    var result = value;

    try {
      result = value.substring(0, length) + symbol;
    } catch (e) {}
    return result;
  }

  ///Generates a Random string
  ///
  ///[length]: length of string,
  ///
  ///[alphabet]:(boolean) add alphabet to string[uppercase]ABCD and [lowercase]abcd,
  ///
  ///[numeric]:(boolean) add integers to string like 3622737
  ///
  ///[special]:(boolean) add special characters like $#@&^
  ///
  ///[from]:where you want to generate string from
  ///
  static String generateRandomString(int length,
      {bool alphabet = true,
      bool numeric = true,
      bool special = true,
      bool uppercase = true,
      bool lowercase = true,
      String from = ''}) {
    final res = StringBuffer();

    do {
      res.write(
          randomizer(alphabet, numeric, lowercase, uppercase, special, from));
    } while (res.length < length);

    var possible = res.toString().split('');
    possible.shuffle(); //all possible combinations shuffled
    var result = [];

    for (var i = 0; i < length; i++) {
      var randomNumber = Random().nextInt(length);
      result.add(possible[randomNumber]);
    }

    return result.join();
  }

  ///randomizer
  static String randomizer(bool alphabet, bool numeric, bool lowercase,
      bool uppercase, bool special, String from) {
    var a = 'ABCDEFGHIJKLMNOPQRXYZ';
    var la = 'abcdefghijklmnopqrxyz';
    var b = '0123456789';
    var c = '~^!@#\$%^&*;`(=?]:[.)_+-|\{}';
    var result = '';

    if (alphabet) {
      if (lowercase) {
        result += la;
      }
      if (uppercase) {
        result += a;
      }

      if (!uppercase && !lowercase) {
        result += a;
        result += la;
      }
    }
    if (numeric) {
      result += b;
    }

    if (special) {
      result += c;
    }

    if (from != '') {
      //if set return it
      result = from;
    }

    return result;
  }
}

import 'package:uuid/uuid.dart';

class Helper {
  static String get generatedId => const Uuid().v1();

  // Create username from user's email
  static String usernameGenerator(String email) {
    var splitted = email.split('@');
    return splitted.first;
  }

  // Extract hashtags from text
  static List<String> hashTagSystem(String text) {
    List<String> hashtags = [];
    final hashtagRegx = RegExp(r'#\w+');

    final matches = hashtagRegx.allMatches(text);

    for (var matche in matches) {
      if (matche.group(0) != null) {
        hashtags.add(matche.group(0)!);
      }
    }
    return hashtags;
  }

  // Extract urls from text
  static List<String> extractUrls(String text) {
    List<String> urls = [];
    RegExp urlRegExp = RegExp(r"(https?://\S+)", caseSensitive: false);

    Iterable<Match> matches = urlRegExp.allMatches(text);

    for (Match match in matches) {
      urls.add(match.group(0)!);
    }

    return urls;
  }
}

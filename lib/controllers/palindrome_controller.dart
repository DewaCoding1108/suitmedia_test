import 'package:get/get.dart';

class PalindromeController extends GetxController {
  var name = ''.obs;
  var sentence = ''.obs;

  bool isPalindrome(String sentence) {
    String cleanSentence = sentence.replaceAll(' ', '').toLowerCase();
    String reversedSentence = cleanSentence.split('').reversed.join('');
    return cleanSentence == reversedSentence;
  }
}
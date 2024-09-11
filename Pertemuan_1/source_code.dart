import 'dart:io';

void main() {
  String? text = stdin.readLineSync();
  if (text == null || text.isEmpty) {
    print("Kosong bang");
    return;
  }
  bool isPalindrom = true;
  int firstIdx = 0, lastIdx = text.length - 1;
  while (firstIdx < lastIdx) {
    if (text[firstIdx] != text[lastIdx]) {
      isPalindrom = false;
      break;
    }
    firstIdx++;
    lastIdx--;
  }
  isPalindrom ? print("Palindrom!") : print("Yah! Tidak Palindrom :)");
}

import 'package:flutter/services.dart';

Future<String> textToEmojiConverter({required String text}) async {
  List<String> tempList = [];
  List<String> wordSpace = text.split(' ');
  String styledText = '';

  ///Loop for Single word  Eg. Hello World
  for(String word in wordSpace) {
    List<String> charList = word.split('');
    ///Loop for single character  Eg. H e l l o W o r l d
    for(String char in charList) {
      switch (char) {
        case 'A':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/A.txt'));
          break;
        case 'B':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/B.txt'));
          break;
        case 'C':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/C.txt'));
          break;
        case 'D':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/D.txt'));
          break;
        case 'E':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/E.txt'));
          break;
        case 'F':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/F.txt'));
          break;
        case 'G':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/G.txt'));
          break;
        case 'H':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/H.txt'));
          break;
        case 'I':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/I.txt'));
          break;
        case 'J':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/J.txt'));
          break;
        case 'K':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/K.txt'));
          break;
        case 'L':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/L.txt'));
          break;
        case 'M':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/M.txt'));
          break;
        case 'N':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/N.txt'));
          break;
        case 'O':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/O.txt'));
          break;
        case 'P':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/P.txt'));
          break;
        case 'Q':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/Q.txt'));
          break;
        case 'R':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/R.txt'));
          break;
        case 'S':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/S.txt'));
          break;
        case 'T':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/T.txt'));
          break;
        case 'U':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/U.txt'));
          break;
        case 'V':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/V.txt'));
          break;
        case 'W':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/W.txt'));
          break;
        case 'X':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/X.txt'));
          break;
        case 'Y':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/Y.txt'));
          break;
        case 'Z':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/Z.txt'));
          break;
        case 'a':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smla.txt'));
          break;
        case 'b':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlb.txt'));
          break;
        case 'c':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlc.txt'));
          break;
        case 'd':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smld.txt'));
          break;
        case 'e':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smle.txt'));
          break;
        case 'f':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlf.txt'));
          break;
        case 'g':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlg.txt'));
          break;
        case 'h':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlh.txt'));
          break;
        case 'i':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smli.txt'));
          break;
        case 'j':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlj.txt'));
          break;
        case 'k':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlk.txt'));
          break;
        case 'l':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smll.txt'));
          break;
        case 'm':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlm.txt'));;
          break;
        case 'n':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smln.txt'));
          break;
        case 'o':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlo.txt'));
          break;
        case 'p':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlp.txt'));
          break;
        case 'q':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlq.txt'));
          break;
        case 'r':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlr.txt'));
          break;
        case 's':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smls.txt'));
          break;
        case 't':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlt.txt'));
          break;
        case 'u':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlu.txt'));
          break;
        case 'v':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlv.txt'));
          break;
        case 'w':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlw.txt'));
          break;
        case 'x':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlx.txt'));
          break;
        case 'y':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smly.txt'));
          break;
        case 'z':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/smlz.txt'));
          break;
        case '0':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/0.txt'));
          break;
        case '1':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/1.txt'));
          break;
        case '2':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/2.txt'));
          break;
        case '3':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/3.txt'));
          break;
        case '4':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/4.txt'));
          break;
        case '5':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/5.txt'));
          break;
        case '6':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/6.txt'));
          break;
        case '7':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/7.txt'));
          break;
        case '8':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/8.txt'));
          break;
        case '9':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/9.txt'));
          break;
        case '&':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/ampersand.txt'));
          break;
        case '\\':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/backwardslash.txt'));
          break;
        case ':':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/colon.txt'));
          break;
        case ',':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/comma.txt'));
          break;
        case '\$':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/dollar.txt'));
          break;
        case '"':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/doublequotes.txt'));
          break;
        case '=':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/equals.txt'));
          break;
        case '!':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/exclamation.txt'));
          break;
        case '/':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/forwardslash.txt'));
          break;
        case '>':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/greater.txt'));
          break;
        case '#':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/hash.txt'));
          break;
        case '(':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/leftround.txt'));
          break;
        case '<':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/lessthan.txt'));
          break;
        case '-':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/minus.txt'));
          break;
        case '%':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/modulo.txt'));
          break;
        case '+':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/plus.txt'));
          break;
        case '?':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/ques.txt'));
          break;
        case ')':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/rightround.txt'));
          break;
        case ';':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/semicolon.txt'));
          break;
        case '\'':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/singlequote.txt'));
          break;
        case '_':
          tempList.add(await rootBundle.loadString('assets/text-to-emoji/underscore.txt'));
          break;
      }
    }
    ///Add Space after finished single word
    tempList.add(' ');
  }
  styledText = tempList.join('\n \n');
  print('tempList -> ${tempList}');
  return styledText;
}
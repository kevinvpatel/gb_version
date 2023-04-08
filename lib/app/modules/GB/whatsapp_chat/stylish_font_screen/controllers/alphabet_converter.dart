String fontIndex({required String text, required List<String> characters}) {
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
          tempList.add(characters[0]);
          break;
        case 'B':
          tempList.add(characters[1]);
          break;
        case 'C':
          tempList.add(characters[2]);
          break;
        case 'D':
          tempList.add(characters[3]);
          break;
        case 'E':
          tempList.add(characters[4]);
          break;
        case 'F':
          tempList.add(characters[5]);
          break;
        case 'G':
          tempList.add(characters[6]);
          break;
        case 'H':
          tempList.add(characters[7]);
          break;
        case 'I':
          tempList.add(characters[8]);
          break;
        case 'J':
          tempList.add(characters[9]);
          break;
        case 'K':
          tempList.add(characters[10]);
          break;
        case 'L':
          tempList.add(characters[11]);
          break;
        case 'M':
          tempList.add(characters[12]);
          break;
        case 'N':
          tempList.add(characters[13]);
          break;
        case 'O':
          tempList.add(characters[14]);
          break;
        case 'P':
          tempList.add(characters[15]);
          break;
        case 'Q':
          tempList.add(characters[16]);
          break;
        case 'R':
          tempList.add(characters[17]);
          break;
        case 'S':
          tempList.add(characters[18]);
          break;
        case 'T':
          tempList.add(characters[19]);
          break;
        case 'U':
          tempList.add(characters[20]);
          break;
        case 'V':
          tempList.add(characters[21]);
          break;
        case 'W':
          tempList.add(characters[22]);
          break;
        case 'X':
          tempList.add(characters[23]);
          break;
        case 'Y':
          tempList.add(characters[24]);
          break;
        case 'Z':
          tempList.add(characters[25]);
          break;
        case 'a':
          tempList.add(characters[26]);
          break;
        case 'b':
          tempList.add(characters[27]);
          break;
        case 'c':
          tempList.add(characters[28]);
          break;
        case 'd':
          tempList.add(characters[29]);
          break;
        case 'e':
          tempList.add(characters[30]);
          break;
        case 'f':
          tempList.add(characters[31]);
          break;
        case 'g':
          tempList.add(characters[32]);
          break;
        case 'h':
          tempList.add(characters[33]);
          break;
        case 'i':
          tempList.add(characters[34]);
          break;
        case 'j':
          tempList.add(characters[35]);
          break;
        case 'k':
          tempList.add(characters[36]);
          break;
        case 'l':
          tempList.add(characters[37]);
          break;
        case 'm':
          tempList.add(characters[38]);
          break;
        case 'n':
          tempList.add(characters[39]);
          break;
        case 'o':
          tempList.add(characters[40]);
          break;
        case 'p':
          tempList.add(characters[41]);
          break;
        case 'q':
          tempList.add(characters[42]);
          break;
        case 'r':
          tempList.add(characters[43]);
          break;
        case 's':
          tempList.add(characters[44]);
          break;
        case 't':
          tempList.add(characters[45]);
          break;
        case 'u':
          tempList.add(characters[46]);
          break;
        case 'v':
          tempList.add(characters[47]);
          break;
        case 'w':
          tempList.add(characters[48]);
          break;
        case 'x':
          tempList.add(characters[49]);
          break;
        case 'y':
          tempList.add(characters[50]);
          break;
        case 'z':
          tempList.add(characters[51]);
          break;
        case '0':
          tempList.add(characters[52]);
          break;
        case '1':
          tempList.add(characters[53]);
          break;
        case '2':
          tempList.add(characters[54]);
          break;
        case '3':
          tempList.add(characters[55]);
          break;
        case '4':
          tempList.add(characters[56]);
          break;
        case '5':
          tempList.add(characters[57]);
          break;
        case '6':
          tempList.add(characters[58]);
          break;
        case '7':
          tempList.add(characters[59]);
          break;
        case '8':
          tempList.add(characters[60]);
          break;
        case '9':
          tempList.add(characters[61]);
          break;
      }
    }
    ///Add Space after finished single word
    tempList.add(' ');
  }
  styledText = tempList.join('');
  return styledText;
}
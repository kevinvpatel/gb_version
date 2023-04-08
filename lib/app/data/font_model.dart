class FontModel {
  List<Fonts>? fonts;

  FontModel({this.fonts});

  FontModel.fromJson(Map<String, dynamic> json) {
    if (json['fonts'] != null) {
      fonts = <Fonts>[];
      json['fonts'].forEach((v) {
        fonts!.add(Fonts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fonts != null) {
      data['fonts'] = fonts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fonts {
  List<String>? characters;
  bool? reverse;
  bool? pro;
  int? supported_ver;
  bool? language_support;
  String? prefix;
  String? postfix;
  bool? keyboard;
  String? name;

  Fonts(
      {this.characters,
        this.reverse,
        this.pro,
        this.supported_ver,
        this.language_support,
        this.prefix,
        this.postfix,
        this.keyboard,
        this.name});

  Fonts.fromJson(Map<String, dynamic> json) {
    characters = json['characters'].cast<String>();
    reverse = json['reverse'];
    pro = json['pro'];
    supported_ver = json['supported_ver'];
    language_support = json['language_support'];
    prefix = json['prefix'];
    postfix = json['postfix'];
    keyboard = json['keyboard'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['characters'] = characters;
    data['reverse'] = reverse;
    data['pro'] = pro;
    data['supported_ver'] = supported_ver;
    data['language_support'] = language_support;
    data['prefix'] = prefix;
    data['postfix'] = postfix;
    data['keyboard'] = keyboard;
    data['name'] = name;
    return data;
  }
}

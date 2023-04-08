class Emote {
  List<Emoticons>? emoticons;

  Emote({this.emoticons});

  Emote.fromJson(Map<String, dynamic> json) {
    if (json['emoticons'] != null) {
      emoticons = <Emoticons>[];
      json['emoticons'].forEach((v) {
        emoticons!.add(Emoticons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (emoticons != null) {
      data['emoticons'] = emoticons?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Emoticons {
  String? title;
  String? icon;
  List<String>? emote;

  Emoticons({this.title, this.icon, this.emote});

  Emoticons.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    emote = json['emote'] != null ? List<String>.from(json['emote'].map((x) => x)) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    data['emote'] = emote;
    return data;
  }
}


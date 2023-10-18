class BioDigitalResponse {
  String? serviceVersion;
  List<MyHuman>? myhuman;

  BioDigitalResponse({this.serviceVersion, this.myhuman});

  BioDigitalResponse.fromJson(Map<String, dynamic> json) {
    serviceVersion = json['service_version'];
    if (json['myhuman'] != null) {
      myhuman = <MyHuman>[];
      json['myhuman'].forEach((v) {
        myhuman!.add(MyHuman.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_version'] = serviceVersion;
    if (myhuman != null) {
      data['myhuman'] = myhuman!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyHuman {
  ContentFlags? contentFlags;
  String? contentThumbnailUrl;
  String? contentId;
  List<String>? contentAccessibility;
  String? contentUrl;
  String? contentType;
  String? contentAuthoredDate;
  String? contentTitle;

  MyHuman(
      {this.contentFlags,
        this.contentThumbnailUrl,
        this.contentId,
        this.contentAccessibility,
        this.contentUrl,
        this.contentType,
        this.contentAuthoredDate,
        this.contentTitle});

  MyHuman.fromJson(Map<String, dynamic> json) {
    contentFlags = json['content_flags'] != null
        ? ContentFlags.fromJson(json['content_flags'])
        : null;
    contentThumbnailUrl = json['content_thumbnail_url'];
    contentId = json['content_id'];
    contentAccessibility = json['content_accessibility'].cast<String>();
    contentUrl = json['content_url'];
    contentType = json['content_type'];
    contentAuthoredDate = json['content_authored_date'];
    contentTitle = json['content_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contentFlags != null) {
      data['content_flags'] = contentFlags!.toJson();
    }
    data['content_thumbnail_url'] = contentThumbnailUrl;
    data['content_id'] = contentId;
    data['content_accessibility'] = contentAccessibility;
    data['content_url'] = contentUrl;
    data['content_type'] = contentType;
    data['content_authored_date'] = contentAuthoredDate;
    data['content_title'] = contentTitle;
    return data;
  }
}

class ContentFlags {
  bool? isTour;
  bool? isQuiz;
  bool? isAnimated;

  ContentFlags({this.isTour, this.isQuiz, this.isAnimated});

  ContentFlags.fromJson(Map<String, dynamic> json) {
    isTour = json['is_tour'];
    isQuiz = json['is_quiz'];
    isAnimated = json['is_animated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_tour'] = isTour;
    data['is_quiz'] = isQuiz;
    data['is_animated'] = isAnimated;
    return data;
  }
}

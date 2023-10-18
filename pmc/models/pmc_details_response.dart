import 'package:xml/xml.dart';
import 'package:collection/collection.dart';

class PMCDetailsResponse {
  String? journalIdType;
  String? doi;
  String? pmcid;
  String? articleTitle;
  List<ContribModel>? contribs;
  List<String>? authorInformation;
  PMCDate? epub;
  PMCDate? pmcRelease;
  String? volume;
  String? elocationId;
  PMCDate? receivedDate;
  PMCDate? revisedDate;
  PMCDate? acceptedDate;
  String? permissions;
  String? licences;
  List<Section>? abstractSections;
  List<Section>? bodySections;
  List<Section>? back;
  List<ReferenceModel>? references;
  List<FigureModel>? figures;

  PMCDetailsResponse(
      {this.contribs,
      this.journalIdType,
      this.doi,
      this.pmcid,
      this.articleTitle,
      this.authorInformation,
      this.epub,
      this.pmcRelease,
      this.volume,
      this.elocationId,
      this.receivedDate,
      this.revisedDate,
      this.acceptedDate,
      this.permissions,
      this.licences,
      this.abstractSections,
      this.bodySections,
      this.back,
      this.references,
      this.figures});

  factory PMCDetailsResponse.fromXml(String res) {
    final document = XmlDocument.parse(res);

    return PMCDetailsResponse(
      journalIdType:
          document.findAllElements('journal-id').map((e) => e.text).toList()[0],
      doi: document
          .findAllElements('article-id')
          .firstWhere((element) => element.attributes.first.value == "doi",
              orElse: () => XmlElement(XmlName('not-found')))
          .text,
      pmcid: document
          .findAllElements('article-id')
          .firstWhere((element) => element.attributes.first.value == "pmcid")
          .text,
      articleTitle: document.findAllElements('title-group').first.text,
      contribs: document
          .findAllElements('front')
          .first
          .findAllElements('contrib')
          .map((e) => ContribModel.fromXml(e))
          .toList(),
      authorInformation: document
          .findAllElements('front')
          .first
          .findAllElements('aff')
          .map((e) => e.text)
          .toList(),
      epub: PMCDate.fromXML(document
          .findAllElements('front')
          .first
          .findAllElements('pub-date')
          .toList()
          .firstWhereOrNull(
            (element) => element.attributes.first.value == "epub",
          )),
      pmcRelease: PMCDate.fromXML(document
          .findAllElements('front')
          .first
          .findAllElements('pub-date')
          .toList()
          .firstWhereOrNull(
            (element) => element.attributes.first.value == "pmc-release",
          )),
      volume: document.findAllElements('front').isNotEmpty &&
              document
                  .findAllElements('front')
                  .first
                  .findAllElements('volume')
                  .isNotEmpty
          ? document
              .findAllElements('front')
              .first
              .findAllElements('volume')
              .first
              .text
          : null,
      elocationId: document
              .findAllElements('front')
              .first
              .findAllElements('elocation-id')
              .isNotEmpty
          ? document
              .findAllElements('front')
              .first
              .findAllElements('elocation-id')
              .first
              .text
          : null,
      receivedDate: document
              .findAllElements('front')
              .first
              .findAllElements('history')
              .isNotEmpty
          ? PMCDate.fromXML(document
              .findAllElements('front')
              .first
              .findAllElements('history')
              .first
              .findAllElements('date')
              .toList()
              .firstWhereOrNull(
                (element) => element.attributes.first.value == "received",
              ))
          : null,
      revisedDate: document
              .findAllElements('front')
              .first
              .findAllElements('history')
              .isNotEmpty
          ? PMCDate.fromXML(document
              .findAllElements('front')
              .first
              .findAllElements('history')
              .first
              .findAllElements('date')
              .toList()
              .firstWhereOrNull(
                (element) => element.attributes.first.value == "rev-recd",
              ))
          : null,
      acceptedDate: document
              .findAllElements('front')
              .first
              .findAllElements('history')
              .isNotEmpty
          ? PMCDate.fromXML(document
              .findAllElements('front')
              .first
              .findAllElements('history')
              .first
              .findAllElements('date')
              .toList()
              .firstWhereOrNull(
                (element) => element.attributes.first.value == "accepted",
              ))
          : null,
      permissions: document
              .findAllElements('front')
              .first
              .findAllElements('permissions')
              .first
              .findAllElements("copyright-statement")
              .isNotEmpty
          ? document
              .findAllElements('front')
              .first
              .findAllElements('permissions')
              .first
              .findAllElements("copyright-statement")
              .first
              .text
          : null,
      licences: document
          .findAllElements('front')
          .first
          .findAllElements('permissions')
          .first
          .findAllElements("license")
          .first
          .text,
      abstractSections: document
          .findAllElements('front')
          .first
          .findAllElements('abstract')
          // .first
          // .findAllElements("sec")
          .map((e) => Section.fromXML(e))
          .toList(),
      bodySections: document
          .findAllElements('body')
          .first
          .findAllElements("sec")
          .map((e) => Section.fromXML(e))
          .toList(),
      back: document.findAllElements('back').isNotEmpty
          ? document
              .findAllElements('back')
              .first
              .childElements
              .map((e) => Section.fromXML(e))
              .toList()
          : null,
      references: document.findAllElements('back').isNotEmpty &&
              document
                  .findAllElements('back')
                  .first
                  .findAllElements('ref-list')
                  .isNotEmpty
          ? document
              .findAllElements('back')
              .first
              .findAllElements('ref-list')
              .first
              .findAllElements('ref')
              .map((e) => ReferenceModel.fromXML(e))
              .toList()
          : null,
      figures: document.findAllElements('floats-group').isNotEmpty &&
              document
                  .findAllElements('floats-group')
                  .first
                  .findAllElements('fig')
                  .isNotEmpty
          ? document
              .findAllElements('floats-group')
              .first
              .findAllElements('fig')
              .map((e) => FigureModel.fromXml(e))
              .toList()
          : null,
    );
  }
}

class ContribModel {
  String? fullName;

  // String? givenName;
  String? email;
  String? xref;
  String? refType;
  String? refId;
  List<String>? roles;

  ContribModel(
      {this.fullName,
      this.email,
      this.xref,
      this.refType,
      this.roles,
      this.refId});

  factory ContribModel.fromXml(XmlElement element) {
    return ContribModel(
      fullName: element.findElements("name").isNotEmpty
          ? element.findElements("name").first.text
          : "",
      email: element.findElements("email").isNotEmpty
          ? element.findElements("email").first.text
          : "",
      xref: element.findAllElements("xref").isNotEmpty
          ? element.findAllElements("xref").map((e) => e.text).join(",")
          : null,
      refType: element.findElements("xref").isNotEmpty
          ? element
              .findElements("xref")
              .first
              .attributes
              .firstWhere((element) => element.localName == "ref-type")
              .value
          : null,
      roles: element.findAllElements("role").isNotEmpty
          ? element.findAllElements("role").map((e) => e.text).toList()
          : null,
      refId: element.findElements("xref").isNotEmpty
          ? element
              .findElements("xref")
              .first
              .attributes
              .firstWhere((element) => element.localName == "rid")
              .value
          : null,
    );
  }
}

class PMCDate {
  String? day;
  String? month;
  String? year;

  PMCDate({this.day, this.month, this.year});

  factory PMCDate.fromXML(XmlElement? element) {
    if (element == null) {
      return PMCDate();
    }
    return PMCDate(
      day: element.findAllElements('day').first.text,
      year: element.findAllElements('year').first.text,
      month: element.findAllElements('month').first.text,
    );
  }

  @override
  String toString() {
    super.toString();
    return day == null ? "not found" : "$day/$month/$year";
  }
}

class Section {
  String? titles;
  List<String>? paragraphs;
  List<XrefModel>? figures;

  Section({
    this.titles,
    this.paragraphs,
    this.figures,
  });

  factory Section.fromXML(XmlElement element) {
    List<XrefModel>? temp = [];
    temp = element.findAllElements('xref').isNotEmpty
        ? element
            .findAllElements('xref')
            .map((e) => XrefModel.fromJson(e))
            .toList()
        : null;
    List<String>? temp2 = [];
    temp?.forEach((element) {
      if (!temp2.contains(element.rid)) {
        temp2.add(element.rid!);
      }
    });

    return Section(
        titles: element.findAllElements('title').isNotEmpty
            ? element.findAllElements('title').first.text
            : null,
        paragraphs: element.findAllElements('p').isNotEmpty
            ? element.findAllElements('p').map((e) => e.text).toList()
            : null,
        figures: temp);
  }
}

class FigureModel {
  String? id;
  String? label;
  String? caption;
  String? link;

  FigureModel({this.id, this.label, this.caption, this.link});

  factory FigureModel.fromXml(XmlElement element) {
    return FigureModel(
        id: element.attributes.last.value,
        label: element.findAllElements("label").first.text,
        caption: element.findAllElements("caption").first.text,
        link: element.findAllElements("graphic").first.attributes.first.value);
  }
}

class XrefModel {
  String? rid;
  String? refType;
  String? text;

  XrefModel({
    this.rid,
    this.refType,
    this.text,
  });

  factory XrefModel.fromJson(XmlElement element) {
    return XrefModel(
      rid: element.attributes.first.value,
      refType: element.attributes.last.value,
      text: element.text,
    );
  }

  @override
  String toString() {
    super.toString();
    return " ${rid ?? ""} ${refType ?? ""} ${text ?? ""}";
  }
}

class ReferenceModel {
  String? label;
  List<String>? authors;
  String? articleTitle;
  String? source;
  String? year;
  String? volume;
  String? issue;
  String? fpage;
  String? lpage;
  String? doi;
  String? other;
  String? pmid;

  ReferenceModel(
      {this.label,
      this.authors,
      this.articleTitle,
      this.volume,
      this.year,
      this.doi,
      this.source,
      this.fpage,
      this.lpage,
      this.issue,
      this.other,
      this.pmid});

  factory ReferenceModel.fromXML(XmlElement element) {
    return ReferenceModel(
        label: element.findAllElements('label').isNotEmpty
            ? element.findAllElements('label').first.text
            : null,
        authors: element.findAllElements('name').map((e) => e.text).toList(),
        articleTitle: element.findAllElements('article-title').isNotEmpty
            ? element.findAllElements('article-title').first.text
            : null,
        source: element.findAllElements('source').isNotEmpty
            ? element.findAllElements('source').first.text
            : null,
        year: element.findAllElements('year').isNotEmpty
            ? element.findAllElements('year').first.text
            : null,
        volume: element.findAllElements('volume').isNotEmpty
            ? element.findAllElements('volume').first.text
            : null,
        issue: element.findAllElements('issue').isNotEmpty
            ? element.findAllElements('issue').first.text
            : null,
        fpage: element.findAllElements('fpage').isNotEmpty
            ? element.findAllElements('fpage').first.text
            : null,
        lpage: element.findAllElements('lpage').isNotEmpty
            ? element.findAllElements('lpage').first.text
            : null,
        doi: element.findAllElements('pub-id').isNotEmpty
            ? element
                .findAllElements('pub-id')
                .toList()
                .firstWhereOrNull(
                    (element) => element.attributes.first.value == "doi")
                ?.text
            : null,
        other: element.findAllElements('pub-id').isNotEmpty
            ? element
                .findAllElements('pub-id')
                .toList()
                .firstWhereOrNull(
                    (element) => element.attributes.first.value == "other")
                ?.text
            : null,
        pmid: element.findAllElements('pub-id').isNotEmpty
            ? element
                .findAllElements('pub-id')
                .toList()
                .firstWhereOrNull(
                    (element) => element.attributes.first.value == "pmid")
                ?.text
            : null);
  }

  @override
  String toString() {
    super.toString();
    return "${label ?? ""} ${authors?.map((e) => e).toList().join(",") ?? ""} ${articleTitle ?? ""} ${source ?? ""} ${year ?? ""} ${volume ?? ""}(${issue ?? ""}) ${fpage ?? ""}-${lpage ?? ""} ${doi ?? ""} ${other ?? ""} ${pmid ?? ""}";
  }
}

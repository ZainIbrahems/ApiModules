class CTFieldsStudyRes {
  StudyFieldsResponse? studyFieldsResponse;

  CTFieldsStudyRes({this.studyFieldsResponse});

  CTFieldsStudyRes.fromJson(Map<String, dynamic> json) {
    studyFieldsResponse = json['StudyFieldsResponse'] != null
        ? StudyFieldsResponse.fromJson(json['StudyFieldsResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (studyFieldsResponse != null) {
      data['StudyFieldsResponse'] = studyFieldsResponse!.toJson();
    }
    return data;
  }
}

class StudyFieldsResponse {
  String? aPIVrs;
  String? dataVrs;
  String? expression;
  int? nStudiesAvail;
  int? nStudiesFound;
  int? minRank;
  int? maxRank;
  int? nStudiesReturned;
  List<String>? fieldList;
  List<StudyFields>? studyFields;

  StudyFieldsResponse(
      {this.aPIVrs,
      this.dataVrs,
      this.expression,
      this.nStudiesAvail,
      this.nStudiesFound,
      this.minRank,
      this.maxRank,
      this.nStudiesReturned,
      this.fieldList,
      this.studyFields});

  StudyFieldsResponse.fromJson(Map<String, dynamic> json) {
    aPIVrs = json['APIVrs'];
    dataVrs = json['DataVrs'];
    expression = json['Expression'];
    nStudiesAvail = json['NStudiesAvail'];
    nStudiesFound = json['NStudiesFound'];
    minRank = json['MinRank'];
    maxRank = json['MaxRank'];
    nStudiesReturned = json['NStudiesReturned'];
    fieldList = json['FieldList'].cast<String>();
    if (json['StudyFields'] != null) {
      studyFields = <StudyFields>[];
      json['StudyFields'].forEach((v) {
        studyFields!.add(StudyFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['APIVrs'] = aPIVrs;
    data['DataVrs'] = dataVrs;
    data['Expression'] = expression;
    data['NStudiesAvail'] = nStudiesAvail;
    data['NStudiesFound'] = nStudiesFound;
    data['MinRank'] = minRank;
    data['MaxRank'] = maxRank;
    data['NStudiesReturned'] = nStudiesReturned;
    data['FieldList'] = fieldList;
    if (studyFields != null) {
      data['StudyFields'] = studyFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudyFields {
  int? rank;
  List<String>? briefTitle;
  List<String>? condition;
  List<String>? briefSummary;
  List<String>? startDate;
  List<String>? leadSponsorName;
  List<String>? collaboratorName;
  List<String>? phase;
  List<String>? overallStatus;
  List<String>? leadSponsorClass;
  List<String>? ntcId;

  StudyFields(
      {this.rank,
      this.briefTitle,
      this.condition,
      this.briefSummary,
      this.startDate,
      this.leadSponsorName,
      this.collaboratorName,
      this.phase,
      this.overallStatus,
      this.leadSponsorClass,
      this.ntcId});

  StudyFields.fromJson(Map<String, dynamic> json) {
    rank = json['Rank'];
    briefTitle = json['BriefTitle'].cast<String>();
    condition = json['Condition'].cast<String>();
    briefSummary = json['BriefSummary'].cast<String>();
    startDate = json['StartDate'].cast<String>();
    leadSponsorName = json['LeadSponsorName'].cast<String>();
    collaboratorName = json['CollaboratorName'].cast<String>();
    phase = json['Phase'].cast<String>();
    overallStatus = json['OverallStatus'].cast<String>();
    leadSponsorClass = json['LeadSponsorClass'].cast<String>();
    ntcId = json['NCTId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rank'] = rank;
    data['BriefTitle'] = briefTitle;
    data['Condition'] = condition;
    data['BriefSummary'] = briefSummary;
    data['StartDate'] = startDate;
    data['LeadSponsorName'] = leadSponsorName;
    data['CollaboratorName'] = collaboratorName;
    data['Phase'] = phase;
    data['OverallStatus'] = overallStatus;
    data['LeadSponsorClass'] = leadSponsorClass;
    data['NCTId'] = ntcId;
    return data;
  }
}

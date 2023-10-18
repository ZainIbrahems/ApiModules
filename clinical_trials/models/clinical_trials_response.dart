class StudyResponse {
  FullStudiesResponse? fullStudiesResponse;

  StudyResponse({this.fullStudiesResponse});

  StudyResponse.fromJson(Map<String, dynamic> json) {
    fullStudiesResponse = json['FullStudiesResponse'] != null
        ? FullStudiesResponse.fromJson(json['FullStudiesResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fullStudiesResponse != null) {
      data['FullStudiesResponse'] = fullStudiesResponse!.toJson();
    }
    return data;
  }
}

class FullStudiesResponse {
  String? aPIVrs;
  String? dataVrs;
  String? expression;
  int? nStudiesAvail;
  int? nStudiesFound;
  int? minRank;
  int? maxRank;
  int? nStudiesReturned;
  List<FullStudies>? fullStudies;

  FullStudiesResponse(
      {this.aPIVrs,
      this.dataVrs,
      this.expression,
      this.nStudiesAvail,
      this.nStudiesFound,
      this.minRank,
      this.maxRank,
      this.nStudiesReturned,
      this.fullStudies});

  FullStudiesResponse.fromJson(Map<String, dynamic> json) {
    aPIVrs = json['APIVrs'];
    dataVrs = json['DataVrs'];
    expression = json['Expression'];
    nStudiesAvail = json['NStudiesAvail'];
    nStudiesFound = json['NStudiesFound'];
    minRank = json['MinRank'];
    maxRank = json['MaxRank'];
    nStudiesReturned = json['NStudiesReturned'];
    if (json['FullStudies'] != null) {
      fullStudies = <FullStudies>[];
      json['FullStudies'].forEach((v) {
        fullStudies!.add(FullStudies.fromJson(v));
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
    if (fullStudies != null) {
      data['FullStudies'] = fullStudies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FullStudies {
  int? rank;
  Study? study;

  FullStudies({this.rank, this.study});

  FullStudies.fromJson(Map<String, dynamic> json) {
    rank = json['Rank'];
    study = json['Study'] != null ? Study.fromJson(json['Study']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rank'] = rank;
    if (study != null) {
      data['Study'] = study!.toJson();
    }
    return data;
  }
}

class Study {
  ProtocolSection? protocolSection;
  DerivedSection? derivedSection;

  Study({this.protocolSection, this.derivedSection});

  Study.fromJson(Map<String, dynamic> json) {
    protocolSection = json['ProtocolSection'] != null
        ? ProtocolSection.fromJson(json['ProtocolSection'])
        : null;
    derivedSection = json['DerivedSection'] != null
        ? DerivedSection.fromJson(json['DerivedSection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (protocolSection != null) {
      data['ProtocolSection'] = protocolSection!.toJson();
    }
    if (derivedSection != null) {
      data['DerivedSection'] = derivedSection!.toJson();
    }
    return data;
  }
}

class ProtocolSection {
  IdentificationModule? identificationModule;
  StatusModule? statusModule;
  SponsorCollaboratorsModule? sponsorCollaboratorsModule;
  OversightModule? oversightModule;
  DescriptionModule? descriptionModule;
  ConditionsModule? conditionsModule;
  DesignModule? designModule;
  ArmsInterventionsModule? armsInterventionsModule;
  OutcomesModule? outcomesModule;
  EligibilityModule? eligibilityModule;
  ContactsLocationsModule? contactsLocationsModule;
  IPDSharingStatementModule? iPDSharingStatementModule;

  ProtocolSection(
      {this.identificationModule,
      this.statusModule,
      this.sponsorCollaboratorsModule,
      this.oversightModule,
      this.descriptionModule,
      this.conditionsModule,
      this.designModule,
      this.armsInterventionsModule,
      this.outcomesModule,
      this.eligibilityModule,
      this.contactsLocationsModule,
      this.iPDSharingStatementModule});

  ProtocolSection.fromJson(Map<String, dynamic> json) {
    identificationModule = json['IdentificationModule'] != null
        ? IdentificationModule.fromJson(json['IdentificationModule'])
        : null;
    statusModule = json['StatusModule'] != null
        ? StatusModule.fromJson(json['StatusModule'])
        : null;
    sponsorCollaboratorsModule = json['SponsorCollaboratorsModule'] != null
        ? SponsorCollaboratorsModule.fromJson(
            json['SponsorCollaboratorsModule'])
        : null;
    oversightModule = json['OversightModule'] != null
        ? OversightModule.fromJson(json['OversightModule'])
        : null;
    descriptionModule = json['DescriptionModule'] != null
        ? DescriptionModule.fromJson(json['DescriptionModule'])
        : null;
    conditionsModule = json['ConditionsModule'] != null
        ? ConditionsModule.fromJson(json['ConditionsModule'])
        : null;
    designModule = json['DesignModule'] != null
        ? DesignModule.fromJson(json['DesignModule'])
        : null;
    armsInterventionsModule = json['ArmsInterventionsModule'] != null
        ? ArmsInterventionsModule.fromJson(json['ArmsInterventionsModule'])
        : null;
    outcomesModule = json['OutcomesModule'] != null
        ? OutcomesModule.fromJson(json['OutcomesModule'])
        : null;
    eligibilityModule = json['EligibilityModule'] != null
        ? EligibilityModule.fromJson(json['EligibilityModule'])
        : null;
    contactsLocationsModule = json['ContactsLocationsModule'] != null
        ? ContactsLocationsModule.fromJson(json['ContactsLocationsModule'])
        : null;
    iPDSharingStatementModule = json['IPDSharingStatementModule'] != null
        ? IPDSharingStatementModule.fromJson(json['IPDSharingStatementModule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (identificationModule != null) {
      data['IdentificationModule'] = identificationModule!.toJson();
    }
    if (statusModule != null) {
      data['StatusModule'] = statusModule!.toJson();
    }
    if (sponsorCollaboratorsModule != null) {
      data['SponsorCollaboratorsModule'] = sponsorCollaboratorsModule!.toJson();
    }
    if (oversightModule != null) {
      data['OversightModule'] = oversightModule!.toJson();
    }
    if (descriptionModule != null) {
      data['DescriptionModule'] = descriptionModule!.toJson();
    }
    if (conditionsModule != null) {
      data['ConditionsModule'] = conditionsModule!.toJson();
    }
    if (designModule != null) {
      data['DesignModule'] = designModule!.toJson();
    }
    if (armsInterventionsModule != null) {
      data['ArmsInterventionsModule'] = armsInterventionsModule!.toJson();
    }
    if (outcomesModule != null) {
      data['OutcomesModule'] = outcomesModule!.toJson();
    }
    if (eligibilityModule != null) {
      data['EligibilityModule'] = eligibilityModule!.toJson();
    }
    if (contactsLocationsModule != null) {
      data['ContactsLocationsModule'] = contactsLocationsModule!.toJson();
    }
    if (iPDSharingStatementModule != null) {
      data['IPDSharingStatementModule'] = iPDSharingStatementModule!.toJson();
    }
    return data;
  }
}

class IdentificationModule {
  String? nCTId;
  OrgStudyIdInfo? orgStudyIdInfo;
  SecondaryIdInfoList? secondaryIdInfoList;
  Organization? organization;
  String? briefTitle;
  String? officialTitle;
  String? acronym;

  IdentificationModule(
      {this.nCTId,
      this.orgStudyIdInfo,
      this.secondaryIdInfoList,
      this.organization,
      this.briefTitle,
      this.officialTitle,
      this.acronym});

  IdentificationModule.fromJson(Map<String, dynamic> json) {
    nCTId = json['NCTId'];
    orgStudyIdInfo = json['OrgStudyIdInfo'] != null
        ? OrgStudyIdInfo.fromJson(json['OrgStudyIdInfo'])
        : null;
    secondaryIdInfoList = json['SecondaryIdInfoList'] != null
        ? SecondaryIdInfoList.fromJson(json['SecondaryIdInfoList'])
        : null;
    organization = json['Organization'] != null
        ? Organization.fromJson(json['Organization'])
        : null;
    briefTitle = json['BriefTitle'];
    officialTitle = json['OfficialTitle'];
    acronym = json['Acronym'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NCTId'] = nCTId;
    if (orgStudyIdInfo != null) {
      data['OrgStudyIdInfo'] = orgStudyIdInfo!.toJson();
    }
    if (secondaryIdInfoList != null) {
      data['SecondaryIdInfoList'] = secondaryIdInfoList!.toJson();
    }
    if (organization != null) {
      data['Organization'] = organization!.toJson();
    }
    data['BriefTitle'] = briefTitle;
    data['OfficialTitle'] = officialTitle;
    data['Acronym'] = acronym;
    return data;
  }
}

class OrgStudyIdInfo {
  String? orgStudyId;

  OrgStudyIdInfo({this.orgStudyId});

  OrgStudyIdInfo.fromJson(Map<String, dynamic> json) {
    orgStudyId = json['OrgStudyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrgStudyId'] = orgStudyId;
    return data;
  }
}

class SecondaryIdInfoList {
  List<SecondaryIdInfo>? secondaryIdInfo;

  SecondaryIdInfoList({this.secondaryIdInfo});

  SecondaryIdInfoList.fromJson(Map<String, dynamic> json) {
    if (json['SecondaryIdInfo'] != null) {
      secondaryIdInfo = <SecondaryIdInfo>[];
      json['SecondaryIdInfo'].forEach((v) {
        secondaryIdInfo!.add(SecondaryIdInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (secondaryIdInfo != null) {
      data['SecondaryIdInfo'] =
          secondaryIdInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SecondaryIdInfo {
  String? secondaryId;
  String? secondaryIdType;
  String? secondaryIdDomain;

  SecondaryIdInfo(
      {this.secondaryId, this.secondaryIdType, this.secondaryIdDomain});

  SecondaryIdInfo.fromJson(Map<String, dynamic> json) {
    secondaryId = json['SecondaryId'];
    secondaryIdType = json['SecondaryIdType'];
    secondaryIdDomain = json['SecondaryIdDomain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SecondaryId'] = secondaryId;
    data['SecondaryIdType'] = secondaryIdType;
    data['SecondaryIdDomain'] = secondaryIdDomain;
    return data;
  }
}

class Organization {
  String? orgFullName;
  String? orgClass;

  Organization({this.orgFullName, this.orgClass});

  Organization.fromJson(Map<String, dynamic> json) {
    orgFullName = json['OrgFullName'];
    orgClass = json['OrgClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OrgFullName'] = orgFullName;
    data['OrgClass'] = orgClass;
    return data;
  }
}

class StatusModule {
  String? statusVerifiedDate;
  String? overallStatus;
  ExpandedAccessInfo? expandedAccessInfo;
  StartDateStruct? startDateStruct;
  PrimaryCompletionDateStruct? primaryCompletionDateStruct;
  CompletionDateStruct? completionDateStruct;
  String? studyFirstSubmitDate;
  String? studyFirstSubmitQCDate;
  StudyFirstPostDateStruct? studyFirstPostDateStruct;
  String? lastUpdateSubmitDate;
  LastUpdatePostDateStruct? lastUpdatePostDateStruct;

  StatusModule(
      {this.statusVerifiedDate,
      this.overallStatus,
      this.expandedAccessInfo,
      this.startDateStruct,
      this.primaryCompletionDateStruct,
      this.completionDateStruct,
      this.studyFirstSubmitDate,
      this.studyFirstSubmitQCDate,
      this.studyFirstPostDateStruct,
      this.lastUpdateSubmitDate,
      this.lastUpdatePostDateStruct});

  StatusModule.fromJson(Map<String, dynamic> json) {
    statusVerifiedDate = json['StatusVerifiedDate'];
    overallStatus = json['OverallStatus'];
    expandedAccessInfo = json['ExpandedAccessInfo'] != null
        ? ExpandedAccessInfo.fromJson(json['ExpandedAccessInfo'])
        : null;
    startDateStruct = json['StartDateStruct'] != null
        ? StartDateStruct.fromJson(json['StartDateStruct'])
        : null;
    primaryCompletionDateStruct = json['PrimaryCompletionDateStruct'] != null
        ? PrimaryCompletionDateStruct.fromJson(
            json['PrimaryCompletionDateStruct'])
        : null;
    completionDateStruct = json['CompletionDateStruct'] != null
        ? CompletionDateStruct.fromJson(json['CompletionDateStruct'])
        : null;
    studyFirstSubmitDate = json['StudyFirstSubmitDate'];
    studyFirstSubmitQCDate = json['StudyFirstSubmitQCDate'];
    studyFirstPostDateStruct = json['StudyFirstPostDateStruct'] != null
        ? StudyFirstPostDateStruct.fromJson(json['StudyFirstPostDateStruct'])
        : null;
    lastUpdateSubmitDate = json['LastUpdateSubmitDate'];
    lastUpdatePostDateStruct = json['LastUpdatePostDateStruct'] != null
        ? LastUpdatePostDateStruct.fromJson(json['LastUpdatePostDateStruct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusVerifiedDate'] = statusVerifiedDate;
    data['OverallStatus'] = overallStatus;
    if (expandedAccessInfo != null) {
      data['ExpandedAccessInfo'] = expandedAccessInfo!.toJson();
    }
    if (startDateStruct != null) {
      data['StartDateStruct'] = startDateStruct!.toJson();
    }
    if (primaryCompletionDateStruct != null) {
      data['PrimaryCompletionDateStruct'] =
          primaryCompletionDateStruct!.toJson();
    }
    if (completionDateStruct != null) {
      data['CompletionDateStruct'] = completionDateStruct!.toJson();
    }
    data['StudyFirstSubmitDate'] = studyFirstSubmitDate;
    data['StudyFirstSubmitQCDate'] = studyFirstSubmitQCDate;
    if (studyFirstPostDateStruct != null) {
      data['StudyFirstPostDateStruct'] = studyFirstPostDateStruct!.toJson();
    }
    data['LastUpdateSubmitDate'] = lastUpdateSubmitDate;
    if (lastUpdatePostDateStruct != null) {
      data['LastUpdatePostDateStruct'] = lastUpdatePostDateStruct!.toJson();
    }
    return data;
  }
}

class ExpandedAccessInfo {
  String? hasExpandedAccess;

  ExpandedAccessInfo({this.hasExpandedAccess});

  ExpandedAccessInfo.fromJson(Map<String, dynamic> json) {
    hasExpandedAccess = json['HasExpandedAccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['HasExpandedAccess'] = hasExpandedAccess;
    return data;
  }
}

class StartDateStruct {
  String? startDate;
  String? startDateType;

  StartDateStruct({this.startDate, this.startDateType});

  StartDateStruct.fromJson(Map<String, dynamic> json) {
    startDate = json['StartDate'];
    startDateType = json['StartDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StartDate'] = startDate;
    data['StartDateType'] = startDateType;
    return data;
  }
}

class PrimaryCompletionDateStruct {
  String? primaryCompletionDate;
  String? primaryCompletionDateType;

  PrimaryCompletionDateStruct(
      {this.primaryCompletionDate, this.primaryCompletionDateType});

  PrimaryCompletionDateStruct.fromJson(Map<String, dynamic> json) {
    primaryCompletionDate = json['PrimaryCompletionDate'];
    primaryCompletionDateType = json['PrimaryCompletionDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PrimaryCompletionDate'] = primaryCompletionDate;
    data['PrimaryCompletionDateType'] = primaryCompletionDateType;
    return data;
  }
}

class CompletionDateStruct {
  String? completionDate;
  String? completionDateType;

  CompletionDateStruct({this.completionDate, this.completionDateType});

  CompletionDateStruct.fromJson(Map<String, dynamic> json) {
    completionDate = json['CompletionDate'];
    completionDateType = json['CompletionDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CompletionDate'] = completionDate;
    data['CompletionDateType'] = completionDateType;
    return data;
  }
}

class StudyFirstPostDateStruct {
  String? studyFirstPostDate;
  String? studyFirstPostDateType;

  StudyFirstPostDateStruct(
      {this.studyFirstPostDate, this.studyFirstPostDateType});

  StudyFirstPostDateStruct.fromJson(Map<String, dynamic> json) {
    studyFirstPostDate = json['StudyFirstPostDate'];
    studyFirstPostDateType = json['StudyFirstPostDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StudyFirstPostDate'] = studyFirstPostDate;
    data['StudyFirstPostDateType'] = studyFirstPostDateType;
    return data;
  }
}

class LastUpdatePostDateStruct {
  String? lastUpdatePostDate;
  String? lastUpdatePostDateType;

  LastUpdatePostDateStruct(
      {this.lastUpdatePostDate, this.lastUpdatePostDateType});

  LastUpdatePostDateStruct.fromJson(Map<String, dynamic> json) {
    lastUpdatePostDate = json['LastUpdatePostDate'];
    lastUpdatePostDateType = json['LastUpdatePostDateType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LastUpdatePostDate'] = lastUpdatePostDate;
    data['LastUpdatePostDateType'] = lastUpdatePostDateType;
    return data;
  }
}

class SponsorCollaboratorsModule {
  ResponsibleParty? responsibleParty;
  LeadSponsor? leadSponsor;
  CollaboratorList? collaboratorList;

  SponsorCollaboratorsModule(
      {this.responsibleParty, this.leadSponsor, this.collaboratorList});

  SponsorCollaboratorsModule.fromJson(Map<String, dynamic> json) {
    responsibleParty = json['ResponsibleParty'] != null
        ? ResponsibleParty.fromJson(json['ResponsibleParty'])
        : null;
    leadSponsor = json['LeadSponsor'] != null
        ? LeadSponsor.fromJson(json['LeadSponsor'])
        : null;
    collaboratorList = json['CollaboratorList'] != null
        ? CollaboratorList.fromJson(json['CollaboratorList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (responsibleParty != null) {
      data['ResponsibleParty'] = responsibleParty!.toJson();
    }
    if (leadSponsor != null) {
      data['LeadSponsor'] = leadSponsor!.toJson();
    }
    if (collaboratorList != null) {
      data['CollaboratorList'] = collaboratorList!.toJson();
    }
    return data;
  }
}

class ResponsibleParty {
  String? responsiblePartyType;

  ResponsibleParty({this.responsiblePartyType});

  ResponsibleParty.fromJson(Map<String, dynamic> json) {
    responsiblePartyType = json['ResponsiblePartyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ResponsiblePartyType'] = responsiblePartyType;
    return data;
  }
}

class LeadSponsor {
  String? leadSponsorName;
  String? leadSponsorClass;

  LeadSponsor({this.leadSponsorName, this.leadSponsorClass});

  LeadSponsor.fromJson(Map<String, dynamic> json) {
    leadSponsorName = json['LeadSponsorName'];
    leadSponsorClass = json['LeadSponsorClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LeadSponsorName'] = leadSponsorName;
    data['LeadSponsorClass'] = leadSponsorClass;
    return data;
  }
}

class CollaboratorList {
  List<Collaborator>? collaborator;

  CollaboratorList({this.collaborator});

  CollaboratorList.fromJson(Map<String, dynamic> json) {
    if (json['Collaborator'] != null) {
      collaborator = <Collaborator>[];
      json['Collaborator'].forEach((v) {
        collaborator!.add(Collaborator.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (collaborator != null) {
      data['Collaborator'] = collaborator!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Collaborator {
  String? collaboratorName;
  String? collaboratorClass;

  Collaborator({this.collaboratorName, this.collaboratorClass});

  Collaborator.fromJson(Map<String, dynamic> json) {
    collaboratorName = json['CollaboratorName'];
    collaboratorClass = json['CollaboratorClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CollaboratorName'] = collaboratorName;
    data['CollaboratorClass'] = collaboratorClass;
    return data;
  }
}

class OversightModule {
  String? oversightHasDMC;
  String? isFDARegulatedDrug;
  String? isFDARegulatedDevice;
  String? isUSExport;

  OversightModule(
      {this.oversightHasDMC,
      this.isFDARegulatedDrug,
      this.isFDARegulatedDevice,
      this.isUSExport});

  OversightModule.fromJson(Map<String, dynamic> json) {
    oversightHasDMC = json['OversightHasDMC'];
    isFDARegulatedDrug = json['IsFDARegulatedDrug'];
    isFDARegulatedDevice = json['IsFDARegulatedDevice'];
    isUSExport = json['IsUSExport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OversightHasDMC'] = oversightHasDMC;
    data['IsFDARegulatedDrug'] = isFDARegulatedDrug;
    data['IsFDARegulatedDevice'] = isFDARegulatedDevice;
    data['IsUSExport'] = isUSExport;
    return data;
  }
}

class DescriptionModule {
  String? briefSummary;
  String? detailedDescription;

  DescriptionModule({this.briefSummary, this.detailedDescription});

  DescriptionModule.fromJson(Map<String, dynamic> json) {
    briefSummary = json['BriefSummary'];
    detailedDescription = json['DetailedDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BriefSummary'] = briefSummary;
    data['DetailedDescription'] = detailedDescription;
    return data;
  }
}

class ConditionsModule {
  ConditionList? conditionList;
  KeywordList? keywordList;

  ConditionsModule({this.conditionList, this.keywordList});

  ConditionsModule.fromJson(Map<String, dynamic> json) {
    conditionList = json['ConditionList'] != null
        ? ConditionList.fromJson(json['ConditionList'])
        : null;
    keywordList = json['KeywordList'] != null
        ? KeywordList.fromJson(json['KeywordList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (conditionList != null) {
      data['ConditionList'] = conditionList!.toJson();
    }
    if (keywordList != null) {
      data['KeywordList'] = keywordList!.toJson();
    }
    return data;
  }
}

class ConditionList {
  List<String>? condition;

  ConditionList({this.condition});

  ConditionList.fromJson(Map<String, dynamic> json) {
    condition = json['Condition'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Condition'] = condition;
    return data;
  }
}

class KeywordList {
  List<String>? keyword;

  KeywordList({this.keyword});

  KeywordList.fromJson(Map<String, dynamic> json) {
    keyword = json['Keyword'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Keyword'] = keyword;
    return data;
  }
}

class DesignModule {
  String? studyType;
  PhaseList? phaseList;
  DesignInfo? designInfo;
  EnrollmentInfo? enrollmentInfo;

  DesignModule(
      {this.studyType, this.phaseList, this.designInfo, this.enrollmentInfo});

  DesignModule.fromJson(Map<String, dynamic> json) {
    studyType = json['StudyType'];
    phaseList = json['PhaseList'] != null
        ? PhaseList.fromJson(json['PhaseList'])
        : null;
    designInfo = json['DesignInfo'] != null
        ? DesignInfo.fromJson(json['DesignInfo'])
        : null;
    enrollmentInfo = json['EnrollmentInfo'] != null
        ? EnrollmentInfo.fromJson(json['EnrollmentInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StudyType'] = studyType;
    if (phaseList != null) {
      data['PhaseList'] = phaseList!.toJson();
    }
    if (designInfo != null) {
      data['DesignInfo'] = designInfo!.toJson();
    }
    if (enrollmentInfo != null) {
      data['EnrollmentInfo'] = enrollmentInfo!.toJson();
    }
    return data;
  }
}

class PhaseList {
  List<String>? phase;

  PhaseList({this.phase});

  PhaseList.fromJson(Map<String, dynamic> json) {
    phase = json['Phase'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Phase'] = phase;
    return data;
  }
}

class DesignInfo {
  String? designAllocation;
  String? designInterventionModel;
  String? designPrimaryPurpose;
  DesignMaskingInfo? designMaskingInfo;

  DesignInfo(
      {this.designAllocation,
      this.designInterventionModel,
      this.designPrimaryPurpose,
      this.designMaskingInfo});

  DesignInfo.fromJson(Map<String, dynamic> json) {
    designAllocation = json['DesignAllocation'];
    designInterventionModel = json['DesignInterventionModel'];
    designPrimaryPurpose = json['DesignPrimaryPurpose'];
    designMaskingInfo = json['DesignMaskingInfo'] != null
        ? DesignMaskingInfo.fromJson(json['DesignMaskingInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DesignAllocation'] = designAllocation;
    data['DesignInterventionModel'] = designInterventionModel;
    data['DesignPrimaryPurpose'] = designPrimaryPurpose;
    if (designMaskingInfo != null) {
      data['DesignMaskingInfo'] = designMaskingInfo!.toJson();
    }
    return data;
  }
}

class DesignMaskingInfo {
  String? designMasking;

  DesignMaskingInfo({this.designMasking});

  DesignMaskingInfo.fromJson(Map<String, dynamic> json) {
    designMasking = json['DesignMasking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DesignMasking'] = designMasking;
    return data;
  }
}

class EnrollmentInfo {
  String? enrollmentCount;
  String? enrollmentType;

  EnrollmentInfo({this.enrollmentCount, this.enrollmentType});

  EnrollmentInfo.fromJson(Map<String, dynamic> json) {
    enrollmentCount = json['EnrollmentCount'];
    enrollmentType = json['EnrollmentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EnrollmentCount'] = enrollmentCount;
    data['EnrollmentType'] = enrollmentType;
    return data;
  }
}

class ArmsInterventionsModule {
  ArmGroupList? armGroupList;
  InterventionList? interventionList;

  ArmsInterventionsModule({this.armGroupList, this.interventionList});

  ArmsInterventionsModule.fromJson(Map<String, dynamic> json) {
    armGroupList = json['ArmGroupList'] != null
        ? ArmGroupList.fromJson(json['ArmGroupList'])
        : null;
    interventionList = json['InterventionList'] != null
        ? InterventionList.fromJson(json['InterventionList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (armGroupList != null) {
      data['ArmGroupList'] = armGroupList!.toJson();
    }
    if (interventionList != null) {
      data['InterventionList'] = interventionList!.toJson();
    }
    return data;
  }
}

class ArmGroupList {
  List<ArmGroup>? armGroup;

  ArmGroupList({this.armGroup});

  ArmGroupList.fromJson(Map<String, dynamic> json) {
    if (json['ArmGroup'] != null) {
      armGroup = <ArmGroup>[];
      json['ArmGroup'].forEach((v) {
        armGroup!.add(ArmGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (armGroup != null) {
      data['ArmGroup'] = armGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArmGroup {
  String? armGroupLabel;
  String? armGroupType;
  String? armGroupDescription;
  ArmGroupInterventionList? armGroupInterventionList;

  ArmGroup(
      {this.armGroupLabel,
      this.armGroupType,
      this.armGroupDescription,
      this.armGroupInterventionList});

  ArmGroup.fromJson(Map<String, dynamic> json) {
    armGroupLabel = json['ArmGroupLabel'];
    armGroupType = json['ArmGroupType'];
    armGroupDescription = json['ArmGroupDescription'];
    armGroupInterventionList = json['ArmGroupInterventionList'] != null
        ? ArmGroupInterventionList.fromJson(json['ArmGroupInterventionList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ArmGroupLabel'] = armGroupLabel;
    data['ArmGroupType'] = armGroupType;
    data['ArmGroupDescription'] = armGroupDescription;
    if (armGroupInterventionList != null) {
      data['ArmGroupInterventionList'] = armGroupInterventionList!.toJson();
    }
    return data;
  }
}

class ArmGroupInterventionList {
  List<String>? armGroupInterventionName;

  ArmGroupInterventionList({this.armGroupInterventionName});

  ArmGroupInterventionList.fromJson(Map<String, dynamic> json) {
    armGroupInterventionName = json['ArmGroupInterventionName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ArmGroupInterventionName'] = armGroupInterventionName;
    return data;
  }
}

class InterventionList {
  List<Intervention>? intervention;

  InterventionList({this.intervention});

  InterventionList.fromJson(Map<String, dynamic> json) {
    if (json['Intervention'] != null) {
      intervention = <Intervention>[];
      json['Intervention'].forEach((v) {
        intervention!.add(Intervention.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (intervention != null) {
      data['Intervention'] = intervention!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Intervention {
  String? interventionType;
  String? interventionName;
  String? interventionDescription;
  InterventionArmGroupLabelList? interventionArmGroupLabelList;
  InterventionOtherNameList? interventionOtherNameList;

  Intervention(
      {this.interventionType,
      this.interventionName,
      this.interventionDescription,
      this.interventionArmGroupLabelList,
      this.interventionOtherNameList});

  Intervention.fromJson(Map<String, dynamic> json) {
    interventionType = json['InterventionType'];
    interventionName = json['InterventionName'];
    interventionDescription = json['InterventionDescription'];
    interventionArmGroupLabelList =
        json['InterventionArmGroupLabelList'] != null
            ? InterventionArmGroupLabelList.fromJson(
                json['InterventionArmGroupLabelList'])
            : null;
    interventionOtherNameList = json['InterventionOtherNameList'] != null
        ? InterventionOtherNameList.fromJson(json['InterventionOtherNameList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['InterventionType'] = interventionType;
    data['InterventionName'] = interventionName;
    data['InterventionDescription'] = interventionDescription;
    if (interventionArmGroupLabelList != null) {
      data['InterventionArmGroupLabelList'] =
          interventionArmGroupLabelList!.toJson();
    }
    if (interventionOtherNameList != null) {
      data['InterventionOtherNameList'] = interventionOtherNameList!.toJson();
    }
    return data;
  }
}

class InterventionArmGroupLabelList {
  List<String>? interventionArmGroupLabel;

  InterventionArmGroupLabelList({this.interventionArmGroupLabel});

  InterventionArmGroupLabelList.fromJson(Map<String, dynamic> json) {
    interventionArmGroupLabel =
        json['InterventionArmGroupLabel'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['InterventionArmGroupLabel'] = interventionArmGroupLabel;
    return data;
  }
}

class InterventionOtherNameList {
  List<String>? interventionOtherName;

  InterventionOtherNameList({this.interventionOtherName});

  InterventionOtherNameList.fromJson(Map<String, dynamic> json) {
    interventionOtherName = json['InterventionOtherName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['InterventionOtherName'] = interventionOtherName;
    return data;
  }
}

class OutcomesModule {
  PrimaryOutcomeList? primaryOutcomeList;

  OutcomesModule({this.primaryOutcomeList});

  OutcomesModule.fromJson(Map<String, dynamic> json) {
    primaryOutcomeList = json['PrimaryOutcomeList'] != null
        ? PrimaryOutcomeList.fromJson(json['PrimaryOutcomeList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (primaryOutcomeList != null) {
      data['PrimaryOutcomeList'] = primaryOutcomeList!.toJson();
    }
    return data;
  }
}

class PrimaryOutcomeList {
  List<PrimaryOutcome>? primaryOutcome;

  PrimaryOutcomeList({this.primaryOutcome});

  PrimaryOutcomeList.fromJson(Map<String, dynamic> json) {
    if (json['PrimaryOutcome'] != null) {
      primaryOutcome = <PrimaryOutcome>[];
      json['PrimaryOutcome'].forEach((v) {
        primaryOutcome!.add(PrimaryOutcome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (primaryOutcome != null) {
      data['PrimaryOutcome'] = primaryOutcome!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrimaryOutcome {
  String? primaryOutcomeMeasure;
  String? primaryOutcomeDescription;
  String? primaryOutcomeTimeFrame;

  PrimaryOutcome(
      {this.primaryOutcomeMeasure,
      this.primaryOutcomeDescription,
      this.primaryOutcomeTimeFrame});

  PrimaryOutcome.fromJson(Map<String, dynamic> json) {
    primaryOutcomeMeasure = json['PrimaryOutcomeMeasure'];
    primaryOutcomeDescription = json['PrimaryOutcomeDescription'];
    primaryOutcomeTimeFrame = json['PrimaryOutcomeTimeFrame'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PrimaryOutcomeMeasure'] = primaryOutcomeMeasure;
    data['PrimaryOutcomeDescription'] = primaryOutcomeDescription;
    data['PrimaryOutcomeTimeFrame'] = primaryOutcomeTimeFrame;
    return data;
  }
}

class EligibilityModule {
  String? eligibilityCriteria;
  String? healthyVolunteers;
  String? gender;
  String? minimumAge;
  StdAgeList? stdAgeList;

  EligibilityModule(
      {this.eligibilityCriteria,
      this.healthyVolunteers,
      this.gender,
      this.minimumAge,
      this.stdAgeList});

  EligibilityModule.fromJson(Map<String, dynamic> json) {
    eligibilityCriteria = json['EligibilityCriteria'];
    healthyVolunteers = json['HealthyVolunteers'];
    gender = json['Gender'];
    minimumAge = json['MinimumAge'];
    stdAgeList = json['StdAgeList'] != null
        ? StdAgeList.fromJson(json['StdAgeList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EligibilityCriteria'] = eligibilityCriteria;
    data['HealthyVolunteers'] = healthyVolunteers;
    data['Gender'] = gender;
    data['MinimumAge'] = minimumAge;
    if (stdAgeList != null) {
      data['StdAgeList'] = stdAgeList!.toJson();
    }
    return data;
  }
}

class StdAgeList {
  List<String>? stdAge;

  StdAgeList({this.stdAge});

  StdAgeList.fromJson(Map<String, dynamic> json) {
    stdAge = json['StdAge'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StdAge'] = stdAge;
    return data;
  }
}

class ContactsLocationsModule {
  OverallOfficialList? overallOfficialList;
  LocationList? locationList;

  ContactsLocationsModule({this.overallOfficialList, this.locationList});

  ContactsLocationsModule.fromJson(Map<String, dynamic> json) {
    overallOfficialList = json['OverallOfficialList'] != null
        ? OverallOfficialList.fromJson(json['OverallOfficialList'])
        : null;
    locationList = json['LocationList'] != null
        ? LocationList.fromJson(json['LocationList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (overallOfficialList != null) {
      data['OverallOfficialList'] = overallOfficialList!.toJson();
    }
    if (locationList != null) {
      data['LocationList'] = locationList!.toJson();
    }
    return data;
  }
}

class OverallOfficialList {
  List<OverallOfficial>? overallOfficial;

  OverallOfficialList({this.overallOfficial});

  OverallOfficialList.fromJson(Map<String, dynamic> json) {
    if (json['OverallOfficial'] != null) {
      overallOfficial = <OverallOfficial>[];
      json['OverallOfficial'].forEach((v) {
        overallOfficial!.add(OverallOfficial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (overallOfficial != null) {
      data['OverallOfficial'] =
          overallOfficial!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OverallOfficial {
  String? overallOfficialName;
  String? overallOfficialAffiliation;
  String? overallOfficialRole;

  OverallOfficial(
      {this.overallOfficialName,
      this.overallOfficialAffiliation,
      this.overallOfficialRole});

  OverallOfficial.fromJson(Map<String, dynamic> json) {
    overallOfficialName = json['OverallOfficialName'];
    overallOfficialAffiliation = json['OverallOfficialAffiliation'];
    overallOfficialRole = json['OverallOfficialRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OverallOfficialName'] = overallOfficialName;
    data['OverallOfficialAffiliation'] = overallOfficialAffiliation;
    data['OverallOfficialRole'] = overallOfficialRole;
    return data;
  }
}

class LocationList {
  List<Location>? location;

  LocationList({this.location});

  LocationList.fromJson(Map<String, dynamic> json) {
    if (json['Location'] != null) {
      location = <Location>[];
      json['Location'].forEach((v) {
        location!.add(Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['Location'] = location!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? locationFacility;
  String? locationCity;
  String? locationState;
  String? locationZip;
  String? locationCountry;

  Location(
      {this.locationFacility,
      this.locationCity,
      this.locationState,
      this.locationZip,
      this.locationCountry});

  Location.fromJson(Map<String, dynamic> json) {
    locationFacility = json['LocationFacility'];
    locationCity = json['LocationCity'];
    locationState = json['LocationState'];
    locationZip = json['LocationZip'];
    locationCountry = json['LocationCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LocationFacility'] = locationFacility;
    data['LocationCity'] = locationCity;
    data['LocationState'] = locationState;
    data['LocationZip'] = locationZip;
    data['LocationCountry'] = locationCountry;
    return data;
  }
}

class IPDSharingStatementModule {
  String? iPDSharing;

  IPDSharingStatementModule({this.iPDSharing});

  IPDSharingStatementModule.fromJson(Map<String, dynamic> json) {
    iPDSharing = json['IPDSharing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IPDSharing'] = iPDSharing;
    return data;
  }
}

class DerivedSection {
  MiscInfoModule? miscInfoModule;
  InterventionBrowseModule? interventionBrowseModule;

  DerivedSection({this.miscInfoModule, this.interventionBrowseModule});

  DerivedSection.fromJson(Map<String, dynamic> json) {
    miscInfoModule = json['MiscInfoModule'] != null
        ? MiscInfoModule.fromJson(json['MiscInfoModule'])
        : null;
    interventionBrowseModule = json['InterventionBrowseModule'] != null
        ? InterventionBrowseModule.fromJson(json['InterventionBrowseModule'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (miscInfoModule != null) {
      data['MiscInfoModule'] = miscInfoModule!.toJson();
    }
    if (interventionBrowseModule != null) {
      data['InterventionBrowseModule'] = interventionBrowseModule!.toJson();
    }
    return data;
  }
}

class MiscInfoModule {
  String? versionHolder;

  MiscInfoModule({this.versionHolder});

  MiscInfoModule.fromJson(Map<String, dynamic> json) {
    versionHolder = json['VersionHolder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VersionHolder'] = versionHolder;
    return data;
  }
}

class InterventionBrowseModule {
  InterventionBrowseLeafList? interventionBrowseLeafList;
  InterventionBrowseBranchList? interventionBrowseBranchList;

  InterventionBrowseModule(
      {this.interventionBrowseLeafList, this.interventionBrowseBranchList});

  InterventionBrowseModule.fromJson(Map<String, dynamic> json) {
    interventionBrowseLeafList = json['InterventionBrowseLeafList'] != null
        ? InterventionBrowseLeafList.fromJson(
            json['InterventionBrowseLeafList'])
        : null;
    interventionBrowseBranchList = json['InterventionBrowseBranchList'] != null
        ? InterventionBrowseBranchList.fromJson(
            json['InterventionBrowseBranchList'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (interventionBrowseLeafList != null) {
      data['InterventionBrowseLeafList'] = interventionBrowseLeafList!.toJson();
    }
    if (interventionBrowseBranchList != null) {
      data['InterventionBrowseBranchList'] =
          interventionBrowseBranchList!.toJson();
    }
    return data;
  }
}

class InterventionBrowseLeafList {
  List<InterventionBrowseLeaf>? interventionBrowseLeaf;

  InterventionBrowseLeafList({this.interventionBrowseLeaf});

  InterventionBrowseLeafList.fromJson(Map<String, dynamic> json) {
    if (json['InterventionBrowseLeaf'] != null) {
      interventionBrowseLeaf = <InterventionBrowseLeaf>[];
      json['InterventionBrowseLeaf'].forEach((v) {
        interventionBrowseLeaf!.add(InterventionBrowseLeaf.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (interventionBrowseLeaf != null) {
      data['InterventionBrowseLeaf'] =
          interventionBrowseLeaf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InterventionBrowseLeaf {
  String? interventionBrowseLeafId;
  String? interventionBrowseLeafName;
  String? interventionBrowseLeafRelevance;

  InterventionBrowseLeaf(
      {this.interventionBrowseLeafId,
      this.interventionBrowseLeafName,
      this.interventionBrowseLeafRelevance});

  InterventionBrowseLeaf.fromJson(Map<String, dynamic> json) {
    interventionBrowseLeafId = json['InterventionBrowseLeafId'];
    interventionBrowseLeafName = json['InterventionBrowseLeafName'];
    interventionBrowseLeafRelevance = json['InterventionBrowseLeafRelevance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['InterventionBrowseLeafId'] = interventionBrowseLeafId;
    data['InterventionBrowseLeafName'] = interventionBrowseLeafName;
    data['InterventionBrowseLeafRelevance'] = interventionBrowseLeafRelevance;
    return data;
  }
}

class InterventionBrowseBranchList {
  List<InterventionBrowseBranch>? interventionBrowseBranch;

  InterventionBrowseBranchList({this.interventionBrowseBranch});

  InterventionBrowseBranchList.fromJson(Map<String, dynamic> json) {
    if (json['InterventionBrowseBranch'] != null) {
      interventionBrowseBranch = <InterventionBrowseBranch>[];
      json['InterventionBrowseBranch'].forEach((v) {
        interventionBrowseBranch!.add(InterventionBrowseBranch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (interventionBrowseBranch != null) {
      data['InterventionBrowseBranch'] =
          interventionBrowseBranch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InterventionBrowseBranch {
  String? interventionBrowseBranchAbbrev;
  String? interventionBrowseBranchName;

  InterventionBrowseBranch(
      {this.interventionBrowseBranchAbbrev, this.interventionBrowseBranchName});

  InterventionBrowseBranch.fromJson(Map<String, dynamic> json) {
    interventionBrowseBranchAbbrev = json['InterventionBrowseBranchAbbrev'];
    interventionBrowseBranchName = json['InterventionBrowseBranchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['InterventionBrowseBranchAbbrev'] = interventionBrowseBranchAbbrev;
    data['InterventionBrowseBranchName'] = interventionBrowseBranchName;
    return data;
  }
}

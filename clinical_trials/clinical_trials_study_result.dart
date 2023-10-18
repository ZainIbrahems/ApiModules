import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/shared_widgets.dart';
import 'package:mena/modules/clinical_trials/cubit/clinical_trials_cubit.dart';

import '../openi/widgets/article_item.dart';

class ClinicalTrialsStudyResult extends StatelessWidget {
  const ClinicalTrialsStudyResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clinicalTrialsCubit = ClinicalTrialsCubit.get(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0.h),
        child: DefaultBackTitleAppBar(title: "Study Result"),
      ),
      body: BlocBuilder<ClinicalTrialsCubit, ClinicalTrialsState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(10),
            child: state is LoadingStudyDataState
                ? DefaultLoaderGrey()
                : DefaultShadowedContainer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    childWidget: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.identificationModule
                                    ?.briefTitle !=
                                null)
                              Text(
                                clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .identificationModule!
                                    .briefTitle!,
                                style: mainStyle(context, 14.sp,
                                    weight: FontWeight.bold,
                                    color: mainBlueColor),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.overallStatus !=
                                null)
                              BCSpanText(
                                text1: 'Overall Status',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .statusModule!
                                    .overallStatus!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.identificationModule
                                    ?.acronym !=
                                null)
                              BCSpanText(
                                text1: 'Acronym',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .identificationModule!
                                    .acronym!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.sponsorCollaboratorsModule
                                    ?.leadSponsor
                                    ?.leadSponsorName !=
                                null)
                              BCSpanText(
                                text1: 'Information provided By',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .sponsorCollaboratorsModule!
                                    .leadSponsor!
                                    .leadSponsorName!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.lastUpdatePostDateStruct
                                    ?.lastUpdatePostDate !=
                                null)
                              BCSpanText(
                                text1: 'Last Update Posted',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .statusModule!
                                    .lastUpdatePostDateStruct!
                                    .lastUpdatePostDate!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.identificationModule
                                    ?.nCTId !=
                                null)
                              BCSpanText(
                                text1: 'NCTId',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .identificationModule!
                                    .nCTId!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.studyFirstSubmitDate !=
                                null)
                              BCSpanText(
                                text1: 'First Submitted',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .statusModule!
                                    .studyFirstSubmitDate!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.studyFirstPostDateStruct
                                    ?.studyFirstPostDate !=
                                null)
                              BCSpanText(
                                text1: 'First Posted',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .statusModule!
                                    .studyFirstPostDateStruct!
                                    .studyFirstPostDate!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.studyFirstSubmitQCDate !=
                                null)
                              BCSpanText(
                                text1: 'FIRST SUBMITTED THAT MET QC CRITERIA',
                                text2: clinicalTrialsCubit
                                    .currentStudy!
                                    .fullStudies![0]
                                    .study!
                                    .protocolSection!
                                    .statusModule!
                                    .studyFirstSubmitQCDate!,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.lastUpdateSubmitDate !=
                                null)
                              BCSpanText(
                                  text1:
                                      'LAST UPDATE SUBMITTED THAT MET QC CRITERIA',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .statusModule!
                                      .lastUpdateSubmitDate!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.statusVerifiedDate !=
                                null)
                              BCSpanText(
                                  text1: 'LAST VERIFIED',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .statusModule!
                                      .statusVerifiedDate!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.statusModule
                                    ?.lastUpdatePostDateStruct
                                    ?.lastUpdatePostDate !=
                                null)
                              BCSpanText(
                                  text1: 'LAST UPDATE POSTED',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .statusModule!
                                      .lastUpdatePostDateStruct!
                                      .lastUpdatePostDate!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.descriptionModule
                                    ?.briefSummary !=
                                null)
                              BCSpanText(
                                  text1: 'Brief Summary',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .descriptionModule!
                                      .briefSummary!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.descriptionModule
                                    ?.detailedDescription !=
                                null)
                              BCSpanText(
                                  text1: 'Detailed Description',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .descriptionModule!
                                      .detailedDescription!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.identificationModule
                                    ?.officialTitle !=
                                null)
                              BCSpanText(
                                  text1: 'Official title',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .identificationModule!
                                      .officialTitle!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.conditionsModule
                                    ?.conditionList
                                    ?.condition !=
                                null)
                              BCSpanText(
                                  text1: 'Conditions',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .conditionsModule!
                                      .conditionList!
                                      .condition!
                                      .join(",")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.studyType !=
                                null)
                              BCSpanText(
                                  text1: 'Study Type',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .studyType!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.enrollmentInfo
                                    ?.enrollmentCount !=
                                null)
                              BCSpanText(
                                  text1:
                                      'Enrollment ${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.designModule!.enrollmentInfo!.enrollmentType!}',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .enrollmentInfo!
                                      .enrollmentCount!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.armsInterventionsModule
                                    ?.armGroupList
                                    ?.armGroup?[0]
                                    .armGroupInterventionList
                                    ?.armGroupInterventionName !=
                                null)
                              BCSpanText(
                                  text1: 'INTERVENTION / TREATMENT',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .armsInterventionsModule!
                                      .armGroupList!
                                      .armGroup![0]
                                      .armGroupInterventionList!
                                      .armGroupInterventionName!
                                      .join(",")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.phaseList
                                    ?.phase !=
                                null)
                              BCSpanText(
                                  text1: 'PHASE',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .phaseList!
                                      .phase!
                                      .join(",")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.identificationModule
                                        ?.orgStudyIdInfo
                                        ?.orgStudyId !=
                                    null &&
                                clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.identificationModule
                                        ?.secondaryIdInfoList
                                        ?.secondaryIdInfo?[0]
                                        .secondaryId !=
                                    null)
                              BCSpanText(
                                  text1: 'OTHER STUDY ID NUMBERS',
                                  text2:
                                      "${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.identificationModule!.orgStudyIdInfo!.orgStudyId!}\n${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.identificationModule!.secondaryIdInfoList!.secondaryIdInfo![0].secondaryId!}"),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.statusModule
                                        ?.startDateStruct
                                        ?.startDateType !=
                                    null &&
                                clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.statusModule
                                        ?.startDateStruct
                                        ?.startDate !=
                                    null)
                              BCSpanText(
                                  text1:
                                      'STUDY START ${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.statusModule!.startDateStruct!.startDateType!}',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .statusModule!
                                      .startDateStruct!
                                      .startDate!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.statusModule
                                        ?.primaryCompletionDateStruct
                                        ?.primaryCompletionDateType !=
                                    null &&
                                clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.statusModule
                                        ?.primaryCompletionDateStruct
                                        ?.primaryCompletionDate !=
                                    null)
                              BCSpanText(
                                  text1:
                                      'PRIMARY COMPLETION ${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.statusModule!.primaryCompletionDateStruct!.primaryCompletionDateType!}',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .statusModule!
                                      .primaryCompletionDateStruct!
                                      .primaryCompletionDate!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                        .currentStudy!
                                        .fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.statusModule
                                        ?.completionDateStruct
                                        ?.completionDateType !=
                                    null &&
                                clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.statusModule
                                        ?.completionDateStruct
                                        ?.completionDate !=
                                    null)
                              BCSpanText(
                                  text1:
                                      'STUDY COMPLETION ${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.statusModule!.completionDateStruct!.completionDateType!}',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .statusModule!
                                      .completionDateStruct!
                                      .completionDate!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.contactsLocationsModule
                                    ?.locationList
                                    ?.location !=
                                null)
                              BCSpanText(
                                  text1: 'Location',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .contactsLocationsModule!
                                      .locationList!
                                      .location!
                                      .map((e) {
                                        return "${e.locationCity ?? ""},${e.locationState ?? ""},${e.locationCountry ?? ""},${e.locationZip ?? ""},${e.locationFacility ?? ""}\n";
                                      })
                                      .toList()
                                      .join(",")),
                            const SizedBox(
                              height: 10,
                            ),
                            // if (controller
                            //         .s
                            //         .value
                            //         ?.fullStudiesResponse
                            //         ?.fullStudies?[0]
                            //         .study
                            //         ?.protocolSection
                            //         ?.contactsLocationsModule
                            //         ?.locationList
                            //         ?.location !=
                            //     null)
                            //   BCSpanText(
                            //       text1: 'Participation criteria',
                            //       text2: controller
                            //           .s
                            //           .value!
                            //           .fullStudiesResponse!
                            //           .fullStudies![0]
                            //           .study!
                            //           .protocolSection!
                            //           .contactsLocationsModule!
                            //           .locationList!
                            //           .location!
                            //           .map((e) {
                            //             return "${e.locationCity!},${e.locationState!},${e.locationCountry!},${e.locationZip!},${e.locationFacility}\n";
                            //           })
                            //           .toList()
                            //           .join(",")),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            if (clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.eligibilityModule
                                        ?.minimumAge !=
                                    null &&
                                clinicalTrialsCubit
                                        .currentStudy
                                        ?.fullStudies?[0]
                                        .study
                                        ?.protocolSection
                                        ?.eligibilityModule
                                        ?.stdAgeList
                                        ?.stdAge !=
                                    null)
                              BCSpanText(
                                  text1: 'Minimum age',
                                  text2:
                                      "${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.eligibilityModule!.minimumAge!} (${clinicalTrialsCubit.currentStudy!.fullStudies![0].study!.protocolSection!.eligibilityModule!.stdAgeList!.stdAge!.join(",")})"),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.eligibilityModule
                                    ?.healthyVolunteers !=
                                null)
                              BCSpanText(
                                  text1: 'Healthy Volunteers',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .eligibilityModule!
                                      .healthyVolunteers!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.eligibilityModule
                                    ?.gender !=
                                null)
                              BCSpanText(
                                  text1: 'SEXES ELIGIBLE FOR STUDY',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .eligibilityModule!
                                      .gender!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.eligibilityModule
                                    ?.eligibilityCriteria !=
                                null)
                              BCSpanText(
                                  text1: 'DESCRIPTION',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .eligibilityModule!
                                      .eligibilityCriteria!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.designInfo
                                    ?.designPrimaryPurpose !=
                                null)
                              BCSpanText(
                                  text1: 'Primary Purpose',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .designInfo!
                                      .designPrimaryPurpose!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.designInfo
                                    ?.designAllocation !=
                                null)
                              BCSpanText(
                                  text1: 'Allocations',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .designInfo!
                                      .designAllocation!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.designInfo
                                    ?.designInterventionModel !=
                                null)
                              BCSpanText(
                                  text1: 'Interventional model',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .designInfo!
                                      .designInterventionModel!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.designModule
                                    ?.designInfo
                                    ?.designMaskingInfo
                                    ?.designMasking !=
                                null)
                              BCSpanText(
                                  text1: 'Masking',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .designModule!
                                      .designInfo!
                                      .designMaskingInfo!
                                      .designMasking!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.armsInterventionsModule
                                    ?.armGroupList
                                    ?.armGroup !=
                                null)
                              BCSpanText(
                                  text1: 'Arms and interventions',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .armsInterventionsModule!
                                      .armGroupList!
                                      .armGroup!
                                      .map((e) {
                                        return '${e.armGroupLabel ?? ""}\n${e.armGroupType ?? ""}\n${e.armGroupDescription ?? ""}\n${e.armGroupInterventionList?.armGroupInterventionName?.join(",")}';
                                      })
                                      .toList()
                                      .join(",")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.outcomesModule
                                    ?.primaryOutcomeList
                                    ?.primaryOutcome !=
                                null)
                              BCSpanText(
                                  text1: 'PRIMARY OUTCOME MEASURES',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .outcomesModule!
                                      .primaryOutcomeList!
                                      .primaryOutcome!
                                      .map((e) {
                                        return "${e.primaryOutcomeMeasure ?? ""}        ${e.primaryOutcomeDescription ?? ""}         ${e.primaryOutcomeTimeFrame ?? ""}";
                                      })
                                      .toList()
                                      .join("\n")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.identificationModule
                                    ?.organization
                                    ?.orgFullName !=
                                null)
                              BCSpanText(
                                  text1: 'SPONSOR',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .identificationModule!
                                      .organization!
                                      .orgFullName!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.sponsorCollaboratorsModule
                                    ?.collaboratorList
                                    ?.collaborator !=
                                null)
                              BCSpanText(
                                  text1: 'Collaborators',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .sponsorCollaboratorsModule!
                                      .collaboratorList!
                                      .collaborator!
                                      .map((e) {
                                        return e.collaboratorName!;
                                      })
                                      .toList()
                                      .join("\n")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.contactsLocationsModule
                                    ?.overallOfficialList
                                    ?.overallOfficial !=
                                null)
                              BCSpanText(
                                  text1: 'INVESTIGATORS',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .contactsLocationsModule!
                                      .overallOfficialList!
                                      .overallOfficial!
                                      .map((e) {
                                        return "${e.overallOfficialRole}: ${e.overallOfficialAffiliation!}, ${e.overallOfficialName!}";
                                      })
                                      .toList()
                                      .join("\n")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.conditionsModule
                                    ?.keywordList
                                    ?.keyword !=
                                null)
                              BCSpanText(
                                  text1: 'KEYWORDS',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .conditionsModule!
                                      .keywordList!
                                      .keyword!
                                      .join(",")),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.iPDSharingStatementModule
                                    ?.iPDSharing !=
                                null)
                              BCSpanText(
                                  text1: 'IPD',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .iPDSharingStatementModule!
                                      .iPDSharing!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.oversightModule
                                    ?.isFDARegulatedDrug !=
                                null)
                              BCSpanText(
                                  text1:
                                      'STUDIES A U.S. FDA-REGULATED DRUG PRODUCT',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .oversightModule!
                                      .isFDARegulatedDrug!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.oversightModule
                                    ?.isFDARegulatedDevice !=
                                null)
                              BCSpanText(
                                  text1:
                                      'STUDIES A U.S. FDA-REGULATED DEVICE PRODUCT',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .oversightModule!
                                      .isFDARegulatedDevice!),
                            const SizedBox(
                              height: 10,
                            ),
                            if (clinicalTrialsCubit
                                    .currentStudy
                                    ?.fullStudies?[0]
                                    .study
                                    ?.protocolSection
                                    ?.oversightModule
                                    ?.isUSExport !=
                                null)
                              BCSpanText(
                                  text1:
                                      'PRODUCT MANUFACTURED IN AND EXPORTED FROM THE U.S.',
                                  text2: clinicalTrialsCubit
                                      .currentStudy!
                                      .fullStudies![0]
                                      .study!
                                      .protocolSection!
                                      .oversightModule!
                                      .isUSExport!),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

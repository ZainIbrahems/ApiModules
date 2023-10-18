import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/shared_widgets.dart';
import 'package:mena/modules/clinical_trials/clinical_trials_study_result.dart';
import 'package:mena/modules/clinical_trials/cubit/clinical_trials_cubit.dart';
import 'package:mena/modules/feeds_screen/feeds_screen.dart';

import '../openi/widgets/article_item.dart';
import 'models/clinical_trials_fields_study.dart';

class ClinicalTrialsResult extends StatelessWidget {
  const ClinicalTrialsResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clinicalTrialsCubit = ClinicalTrialsCubit.get(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0.h),
          child: DefaultBackTitleAppBar(
              title: getTranslatedStrings(context).searchResult)),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView.separated(
            itemBuilder: (c, i) {
              StudyFields fullStudies = clinicalTrialsCubit
                  .ctFieldsStudyRes!.studyFieldsResponse!.studyFields![i];
              return GestureDetector(
                onTap: () async {
                  navigateToWithoutNavBar(
                      context, ClinicalTrialsStudyResult(), '');
                  await clinicalTrialsCubit
                      .getStudyDetails(fullStudies.ntcId![0]);
                },
                child: DefaultShadowedContainer(
                  childWidget: Container(
                    // height: 293.h,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (fullStudies.briefTitle!.isNotEmpty)
                          Text(
                            fullStudies.briefTitle![0],
                            style: mainStyle(context, 14.sp,
                                weight: FontWeight.bold, color: mainBlueColor),
                          ),
                        if (fullStudies.condition!.isNotEmpty)
                          BCSpanText(
                            text2: fullStudies.condition![0],
                            text1: 'Condition Or Disease',
                          ),
                        if (fullStudies.startDate!.isNotEmpty)
                          BCSpanText(
                            text2: fullStudies.startDate![0],
                            text1: 'Start Date',
                          ),
                        if (fullStudies.briefSummary!.isNotEmpty)
                          Text(
                            fullStudies.briefSummary![0],
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: mainStyle(
                              context,
                              12.sp,
                            ),
                          ),
                        if (fullStudies.phase!.isNotEmpty)
                          BCSpanText(
                            text2: fullStudies.phase![0],
                            text1: 'Study Phase',
                          ),
                        if (fullStudies.overallStatus!.isNotEmpty)
                          BCSpanText(
                            text2: fullStudies.overallStatus![0],
                            text1: 'Status',
                          ),
                        if (fullStudies.collaboratorName!.isNotEmpty)
                          BCSpanText(
                            text2: fullStudies.collaboratorName![0] +
                                " / " +
                                fullStudies.leadSponsorName![0],
                            text1: 'Collaborator / Sponsor',
                          ),
                        // if (fullStudies.leadSponsorName!.isNotEmpty)
                        //   BCSpanText(
                        //     text2: fullStudies.leadSponsorName![0],
                        //     text1: 'Sponsor',
                        //   ),
                        if (fullStudies.collaboratorName!.isNotEmpty)
                          BCSpanText(
                              text1: 'Funder Type',
                              text2: fullStudies.leadSponsorClass![0]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BCSpanText(
                                text1: 'Study No',
                                text2: fullStudies.rank!.toString()),
                            DefaultButton(
                              text: 'More Details',
                              borderColor: mainBlueColor,
                              onClick: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (c, i) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemCount: clinicalTrialsCubit
                .ctFieldsStudyRes!.studyFieldsResponse!.studyFields!.length),
      ),
    );
  }
}

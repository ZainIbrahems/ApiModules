import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/shared_widgets.dart';
import 'package:mena/modules/feeds_screen/feeds_screen.dart';
import 'package:mena/modules/pmc/cubit/pmc_cubit.dart';
import 'package:mena/modules/pmc/models/pmc_summary_response.dart';
import 'package:mena/modules/pmc/pmc_study_result.dart';

class PMCResult extends StatelessWidget {
  const PMCResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pmcCubit = PMCCubit.get(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0.h),
          child: DefaultBackTitleAppBar(title: "Search Result")),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView.separated(
            itemBuilder: (c, i) {
              return GestureDetector(
                  onTap: () async {
                    // if (pmcCubit.pmcSummaryRes?.summary?[i].values.first.uid !=
                    //     null) {
                    navigateToWithoutNavBar(context, PMCStudyResult(), '');
                    await pmcCubit.getStudyDetails(
                        pmcCubit.pmcSummaryRes!.summary![i].values.first.uid!);
                    // }
                  },
                  child: PMCItem(
                    article: pmcCubit.pmcSummaryRes!.summary![i].values.first,
                    callback: () async {
                      navigateToWithoutNavBar(context, PMCStudyResult(), '');
                      await pmcCubit.getStudyDetails(pmcCubit
                          .pmcSummaryRes!.summary![i].values.first.uid!);
                    },
                  ));
            },
            separatorBuilder: (c, i) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemCount: pmcCubit.pmcSummaryRes!.summary!.length),
      ),
    );
  }
}

class PMCItem extends StatelessWidget {
  final Article article;
  final VoidCallback callback;

  const PMCItem({
    required this.callback,
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultShadowedContainer(
      childWidget: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.title != null)
              Text(
                article.title!,
                style: mainStyle(context, 14.sp,
                    weight: FontWeight.bold, color: mainBlueColor),
              ),
            const SizedBox(
              height: 10,
            ),
            // if (article.uid != null)
            //   BCSpanText(text1: 'uid', text2: article.uid!),
            // const SizedBox(
            //   height: 10,
            // ),
            // if (article.articleids != null && article.articleids!.isNotEmpty)
            //   BCSpanText(
            //       text1: 'Article ids',
            //       text2: article.articleids!
            //           .map((e) => "${e.idtype!} --- ${e.value!}")
            //           .toList()
            //           .join("\n")
            //           .toString()),
            // const SizedBox(
            //   height: 10,
            // ),
            if (article.pubdate != null)
              Text(
                article.pubdate!,
                style: mainStyle(context, 10.sp,
                    weight: FontWeight.w500, color: newLightGreyColor),
              ),
            const SizedBox(
              height: 10,
            ),
            // if (article.epubdate != null)
            //   BCSpanText(text1: 'E Publish Date', text2: article.epubdate!),
            // const SizedBox(
            //   height: 10,
            // ),
            // if (article.source != null)
            //   BCSpanText(text1: 'source', text2: article.source!),
            // const SizedBox(
            //   height: 10,
            // ),
            // if (article.volume != null)
            //   BCSpanText(text1: 'volume', text2: article.volume!),
            // const SizedBox(
            //   height: 10,
            // ),
            // if (article.pages != null)
            //   BCSpanText(text1: 'pages', text2: article.pages!),
            // const SizedBox(
            //   height: 10,
            // ),
            // if (article.fulljournalname != null)
            //   BCSpanText(
            //       text1: 'full journal name',
            //       text2: article.fulljournalname!),
            // const SizedBox(
            //   height: 10,
            // ),
            // if (article.pmclivedate != null)
            //   BCSpanText(text1: 'PMC live date', text2: article.pmclivedate!),
            // const SizedBox(
            //   height: 10,
            // ),
            if (article.authors != null)
              Text(
                article.authors!
                    .map((e) => "${e.name!}")
                    .toList()
                    .join(", ")
                    .toString(),
                style: mainStyle(context, 10.sp,
                    weight: FontWeight.w500, color: blackColor),
              ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 36.h,
              child: DefaultButton(
                text: 'More Details',
                borderColor: mainBlueColor,
                onClick: callback,
              ),
            )
          ],
        ),
      ),
    );
  }
}

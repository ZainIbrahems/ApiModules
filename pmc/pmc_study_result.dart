import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/shared_widgets.dart';
import 'package:mena/modules/pmc/cubit/pmc_cubit.dart';

import '../openi/widgets/article_item.dart';

class PMCStudyResult extends StatelessWidget {
  const PMCStudyResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pmcCubit = PMCCubit.get(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0.h),
        child: DefaultBackTitleAppBar(title: "Study Result"),
      ),
      body: BlocBuilder<PMCCubit, PMCState>(
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
                            if (pmcCubit.currentStudy?.doi != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.doi!,
                                  text1: "DOI"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.pmcid != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.pmcid!,
                                  text1: "PMCID"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.epub != null)
                              BCSpanText(
                                  text2:
                                      pmcCubit.currentStudy!.epub!.toString(),
                                  text1: "Published Online "),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.pmcRelease != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.pmcRelease!
                                      .toString(),
                                  text1: "PMC Release"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.volume != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.volume!,
                                  text1: "Volume"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.elocationId != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.elocationId!,
                                  text1: "elocation ID"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.receivedDate != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.receivedDate!
                                      .toString(),
                                  text1: "Received Date"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.revisedDate != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.revisedDate!
                                      .toString(),
                                  text1: "Revised Date"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.acceptedDate != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.acceptedDate!
                                      .toString(),
                                  text1: "Accepted Date"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit.currentStudy?.permissions != null)
                              BCSpanText(
                                  text2: pmcCubit.currentStudy!.permissions!,
                                  text1: "copyrights"),
                            SizedBox(
                              height: 10.h,
                            ),
                            BCSpanText(
                                text2: pmcCubit.currentStudy!.licences!.trim(),
                                text1: "license"),
                            SizedBox(
                              height: 10.h,
                            ),
                            BCSpanText(
                                text2: pmcCubit.currentStudy!.articleTitle!,
                                text1: "title"),
                            SizedBox(
                              height: 10.h,
                            ),
                            BCSpanText(
                                text2: pmcCubit.currentStudy!.journalIdType!,
                                text1: "journal type"),
                            SizedBox(
                              height: 10.h,
                            ),
                            BCSpanText(
                                text2: pmcCubit.currentStudy!.contribs!
                                    .map((e) =>
                                        "${e.fullName!} ${e.roles?.map((e) => e).toList().join(",") ?? ""} ${e.email!} ${e.xref}")
                                    .toList()
                                    .join("\n"),
                                text1: "authors"),
                            SizedBox(
                              height: 10.h,
                            ),
                            BCSpanText(
                                text2: pmcCubit.currentStudy!.authorInformation!
                                    .join("\n"),
                                text1: "authors information"),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (pmcCubit
                                .currentStudy!.abstractSections!.isNotEmpty)
                              Text(
                                'Abstract',
                                style: mainStyle(context, 20.sp).copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            for (var i
                                in pmcCubit.currentStudy!.abstractSections!)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  if (i.titles != null)
                                    Text(
                                      i.titles!,
                                      style: mainStyle(context, 14.sp).copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  if (i.paragraphs != null)
                                    Text(i.paragraphs![0],
                                        style: mainStyle(context, 14.sp))
                                ],
                              ),
                            SizedBox(
                              height: 10.h,
                            ),
                            for (var i in pmcCubit.currentStudy!.bodySections!)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  if (i.titles != null)
                                    Text(
                                      i.titles!,
                                      style: mainStyle(context, 14.sp).copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  if (i.paragraphs != null)
                                    for (var j in i.paragraphs!)
                                      Column(
                                        children: [
                                          Text(j,
                                              style: mainStyle(context, 14.sp)),
                                          SizedBox(
                                            height: 10.h,
                                          )
                                        ],
                                      ),
                                  // if (i.figures != null)
                                  //   for (var j in i.figures!)
                                  //     if (j.refType == "fig" &&
                                  //         controller.s.value!.figures != null)
                                  //       Column(
                                  //         children: [
                                  //           CachedNetworkImage(
                                  //             imageUrl:
                                  //                 "https://www.ncbi.nlm.nih.gov/pmc/articles/${controller.s.value!.pmcid}/bin/${controller.s.value!.figures!.firstWhere((element) => element.id == j.rid).link}.jpg",
                                  //           ),
                                  //           Text(
                                  //               controller.s.value!.figures!
                                  //                   .firstWhere((element) =>
                                  //                       element.id == j.rid)
                                  //                   .caption!,
                                  //               style: TextStyles.titlesTextStyles),
                                  //           SizedBox(
                                  //             height: 30.h,
                                  //           )
                                  //         ],
                                  //       ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            if (pmcCubit.currentStudy!.figures != null)
                              for (var j in pmcCubit.currentStudy!.figures!)
                                Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://www.ncbi.nlm.nih.gov/pmc/articles/${pmcCubit.currentStudy!.pmcid}/bin/${j.link}.jpg",
                                    ),
                                    Text(j.caption!,
                                        style: mainStyle(context, 14.sp)),
                                    SizedBox(
                                      height: 30.h,
                                    )
                                  ],
                                ),
                            if (pmcCubit.currentStudy!.back != null)
                              for (var i in pmcCubit.currentStudy!.back!)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    if (i.titles != null)
                                      Text(
                                        i.titles!,
                                        style: mainStyle(context, 14.sp)
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    if (i.paragraphs != null)
                                      for (var j in i.paragraphs!)
                                        Column(
                                          children: [
                                            Text(j,
                                                style:
                                                    mainStyle(context, 14.sp)),
                                            SizedBox(
                                              height: 10.h,
                                            )
                                          ],
                                        ),
                                    SizedBox(
                                      height: 10.h,
                                    )
                                  ],
                                ),
                            if (pmcCubit.currentStudy!.references != null)
                              for (var i in pmcCubit.currentStudy!.references!)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      i.toString(),
                                      style: mainStyle(context, 14.sp).copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    )
                                  ],
                                ),
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

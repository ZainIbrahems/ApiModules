import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/modules/feeds_screen/feeds_screen.dart';
import 'package:mena/modules/pmc/cubit/pmc_cubit.dart';
import 'package:mena/modules/pmc/pmc_result_screen.dart';

import '../../core/shared_widgets/shared_widgets.dart';
import '../home_screen/sections_widgets/sections_widgets.dart';

class PMCScreen extends StatelessWidget {
  const PMCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pmcCubit = PMCCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0.h),
            child: DefaultBackTitleAppBar(title: "Research")),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/research.png",
                height: 150.h,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 22.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      """Find More than 34 million citations for biomedical literature, life science journals, and online books. Citations may include links to full text content from publisher websites.""",
                      textAlign: TextAlign.center,
                      style: mainStyle(
                        context,
                        10.sp,
                        weight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    BlocListener<PMCCubit, PMCState>(
                      listener: (context, state) {
                        if (state is DataFieldsLoadedSuccessState) {
                          navigateToWithoutNavBar(context, PMCResult(), '');
                        }
                      },
                      child: Container(
                        height: 45.h,
                        child: DefaultInputField(
                          label: 'Search by ISBN, author, Publisher, title, country',
                          suffixIcon: Icon(
                            Icons.search,
                            color: mainBlueColor,
                            size: 25.h,
                          ),
                          onFieldChanged: (s) {
                            pmcCubit.setExpression(s);
                          },
                          onFieldSubmitted: (s) async {
                            await pmcCubit.getPMCIds();
                          },
                        ),
                      ),
                    ),
                    BlocBuilder<PMCCubit, PMCState>(
                      builder: (context, state) {
                        return Container(
                            height: 56.h,
                            color: Colors.transparent,
                            child: state is LoadingDataFieldsState
                                ? DefaultLoaderGrey()
                                : null);
                      },
                    ),
                    // CategoriesSection(
                    //     categoriesSection: [],
                    //     homeSectionTitle: "All Refereed medical Journals",
                    //     style: '3_1'),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // DefaultButton(
                    //   text: "iD ORCID your Connect",
                    //   onClick: () {},
                    //   height: 36.h,
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // DefaultButton(
                    //   height: 36.h,
                    //   text: '+Submit Manuscript',
                    //   borderColor: mainBlueColor,
                    //   onClick: () {},
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 44.h),
                      child: Image.asset("assets/images/research_partners.png"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

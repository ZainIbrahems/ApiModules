import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/modules/clinical_trials/clinial_trials_result_screen.dart';
import 'package:mena/modules/clinical_trials/cubit/clinical_trials_cubit.dart';
import 'package:mena/modules/feeds_screen/feeds_screen.dart';

import '../../core/shared_widgets/shared_widgets.dart';

class ClinicalTrialsScreen extends StatelessWidget {
  const ClinicalTrialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clinicalTrialsCubit = ClinicalTrialsCubit.get(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0.h),
            child: DefaultBackTitleAppBar(title: "Clinical Trials")),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/clinical_trials.svg",
                  height: 150.h,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Explore Millions research studies in 221 countries.',
                        textAlign: TextAlign.center,
                        style:
                            mainStyle(context, 12.sp, weight: FontWeight.w700),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        """IMPORTANT: Listing a study does not mean it has been evaluated , Before participating in a study, talk to your health care provider""",
                        textAlign: TextAlign.center,
                        style:
                            mainStyle(context, 10.sp, weight: FontWeight.w400),
                      ),
                      SizedBox(height: 20.h),
                      BlocListener<ClinicalTrialsCubit, ClinicalTrialsState>(
                        listener: (context, state) {
                          if (state is DataFieldsLoadedSuccessState) {
                            navigateToWithoutNavBar(
                                context, ClinicalTrialsResult(), '');
                          }
                        },
                        child: SearchBar(
                          borderRadius: 30,
                          onFieldChanged: (s) {
                            clinicalTrialsCubit.setExpression(s);
                          },
                          onFieldSubmitted: (s) async {
                            await clinicalTrialsCubit.getSearchResult();
                          },
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        """Search by Disease, condition, title, description, Intervention...""",
                        textAlign: TextAlign.center,
                        style: mainStyle(context, 7.sp,
                            weight: FontWeight.w400, color: mainBlueColor),
                      ),
                      BlocBuilder<ClinicalTrialsCubit, ClinicalTrialsState>(
                        builder: (context, state) {
                          return Container(
                              height: 56.h,
                              color: Colors.transparent,
                              child: state is LoadingDataFieldsState
                                  ? DefaultLoaderGrey()
                                  : null);
                        },
                      ),
                      Text(
                        'Discussion Clinical cases',
                        textAlign: TextAlign.center,
                        style:
                            mainStyle(context, 12.sp, weight: FontWeight.w700),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        """Mena Platforms and its members believe that discussion clinical cases is in the best interests of patients, clinicians and medical research, and Medicine students""",
                        textAlign: TextAlign.center,
                        style:
                            mainStyle(context, 10.sp, weight: FontWeight.w400),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 36.h,
                        width: 181.w,
                        child: DefaultButton(
                          text: "Join the discussion now",
                          borderColor: mainBlueColor,
                          onClick: () {
                           viewMySnackBar(context, 'coming soon', 'ok', () => null) ;
                          },
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        """Our Data Partners""",
                        textAlign: TextAlign.center,
                        style: mainStyle(context, 12.sp,
                            weight: FontWeight.w700, color: mainBlueColor),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Image.asset(
                              "assets/images/nih.png",
                              // width: 85.w,
                              // height: 63.h,
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              "assets/images/fda.png",
                              // width: 85.w,
                              // height: 63.h,
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              "assets/images/nih.png",
                              // width: 85.w,
                              // height: 63.h,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

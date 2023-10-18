import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/modules/bio_digital/bio_digital_models_screen.dart';
import 'package:mena/modules/chat_gpt/widgets/rounded_expantion.dart';
import 'package:mena/modules/openi/openi_screen.dart';

import '../../core/responsive/responsive.dart';
import '../../core/shared_widgets/shared_widgets.dart';

class OpenIIntro extends StatefulWidget {
  const OpenIIntro({super.key});

  @override
  State<OpenIIntro> createState() => _OpenIIntroState();
}

class _OpenIIntroState extends State<OpenIIntro> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newLightGreyColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            SvgPicture.asset(
              'assets/svg/mena8.svg',
              height: Responsive.isMobile(context) ? 22.w : 12.w,
            ),
            LottieBuilder.asset(
              "assets/json/x-ray.json",
              width: 250.w,
              height: 250.h,
            ),
            Text(
              getTranslatedStrings(context).openiIntro,
              style: mainStyle(context, 12, isBold: true),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: RoundedExpansionPanel(
                  items: {
                    getTranslatedStrings(context).overMillionBiomedicalImages:
                        "",
                    getTranslatedStrings(context).chestXraysWithRadiologyReports:
                        "",
                    getTranslatedStrings(context).imagesFromNLMHistoryOfMedicineCollection:
                        "",
                    getTranslatedStrings(context)
                            .orthopedicIllustrations:
                        "",
                    getTranslatedStrings(context).copyright :
                        getTranslatedStrings(context).copyrightPhrase,
                  },
                ),
              ),
            ),
            DefaultButton(
                text: getTranslatedStrings(context).startSearch,
                onClick: () {
                  navigateToWithoutNavBar(context, OpenIScreen(), 'routeName');
                }),
            SizedBox(
              height: 10.h,
            ),
            Text(
              getTranslatedStrings(context).resources,
              style: mainStyle(context, 12, isBold: true),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/nih.png",
                  height: Responsive.isMobile(context) ? 32.w : 22.w,
                ),
                Image.asset(
                  "assets/images/openi.png",
                  height: Responsive.isMobile(context) ? 32.w : 22.w,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

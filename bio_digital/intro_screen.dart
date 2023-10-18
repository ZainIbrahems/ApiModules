import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/modules/bio_digital/bio_digital_models_screen.dart';
import 'package:mena/modules/chat_gpt/widgets/rounded_expantion.dart';

import '../../core/responsive/responsive.dart';
import '../../core/shared_widgets/shared_widgets.dart';

class BioDigitalIntro extends StatefulWidget {
  const BioDigitalIntro({super.key});

  @override
  State<BioDigitalIntro> createState() => _BioDigitalIntroState();
}

class _BioDigitalIntroState extends State<BioDigitalIntro> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newLightGreyColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svg/mena8.svg',
                  height: Responsive.isMobile(context) ? 22.w : 12.w,
                ),
                Image.asset(
                  "assets/images/bio_digital.png",
                  height: Responsive.isMobile(context) ? 22.w : 12.w,
                )
              ],
            ),
            Image.asset(
              "assets/images/bio_digital_intro.png",
              height: 250.h,
              width: 250.h,
            ),
            Text(
              getTranslatedStrings(context).bio_digital_intro,
              style: mainStyle(context, 12, isBold: true),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: RoundedExpansionPanel(
                  items: {
                    getTranslatedStrings(context).comprehensive3DAnatomy:
                    getTranslatedStrings(context)
                        .comprehensive3DAnatomyPhrase,
                    getTranslatedStrings(context).scientificAccuracy:
                    getTranslatedStrings(context).scientificAccuracyPhrase,
                    getTranslatedStrings(context).alwaysEvolving:
                    getTranslatedStrings(context).alwaysEvolvingPhrase,
                    getTranslatedStrings(context).conditions:
                    getTranslatedStrings(context).conditionsPhrase,
                    getTranslatedStrings(context).treatments:
                    getTranslatedStrings(context).treatmentsPhrase,
                    getTranslatedStrings(context).quizBuilder:
                    getTranslatedStrings(context).quizBuilderPhrase,
                  },
                ),
              ),
            ),
            DefaultButton(
                text: getTranslatedStrings(context).tryItNow,
                onClick: () {
                  navigateToWithoutNavBar(
                      context, BioDigitalModelsScreen(), 'routeName');
                }),
          ]),
        ),
      ),
    );
  }
}

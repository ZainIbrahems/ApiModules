import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/modules/chat_gpt/widgets/rounded_expantion.dart';

import '../../core/responsive/responsive.dart';
import '../../core/shared_widgets/shared_widgets.dart';
import 'books_search_screen.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
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
              "assets/json/book_anim.json",
              width: 250.w,
              height: 250.h,
            ),
            Text(
              getTranslatedStrings(context).books_intro,
              style: mainStyle(context, 12, isBold: true),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: RoundedExpansionPanel(
                  items: {
                    getTranslatedStrings(context).millionsOfBooksAndTexts:
                        getTranslatedStrings(context)
                            .millionsOfBooksAndTextsPhrase,
                    getTranslatedStrings(context).booksInAllLanguagesOfTheWorld:
                        getTranslatedStrings(context)
                            .booksInAllLanguagesOfTheWorldPhrase,
                    getTranslatedStrings(context).toBorrowBooksYouNeedToLogin:
                        getTranslatedStrings(context)
                            .toBorrowBooksYouNeedToLoginPhrase,
                    getTranslatedStrings(context)
                            .millionsBooksInTheScienceOfMedicine:
                        getTranslatedStrings(context)
                            .millionsBooksInTheScienceOfMedicinePhrase,
                    getTranslatedStrings(context).searchInsideBooks:
                        getTranslatedStrings(context).searchInsideBooksPhrase,
                  },
                ),
              ),
            ),
            DefaultButton(
                text: getTranslatedStrings(context).goToLibrary,
                onClick: () {
                  navigateToWithoutNavBar(
                      context, BooksSearchScreen(), 'routeName');
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
                  "assets/images/open_library.png",
                  height: Responsive.isMobile(context) ? 22.w : 12.w,
                ),
                Image.asset(
                  "assets/images/internet_archive.png",
                  height: Responsive.isMobile(context) ? 22.w : 12.w,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

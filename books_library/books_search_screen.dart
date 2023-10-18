import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/shared_widgets.dart';
import 'package:mena/modules/books_library/books_result_screen.dart';
import 'package:mena/modules/books_library/cubit/books_cubit.dart';

import '../../core/constants/constants.dart';
import '../../core/responsive/responsive.dart';
import 'cubit/books_state.dart';

class BooksSearchScreen extends StatefulWidget {
  const BooksSearchScreen({super.key});

  @override
  State<BooksSearchScreen> createState() => _BooksSearchScreenState();
}

class _BooksSearchScreenState extends State<BooksSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newLightGreyColor,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            SvgPicture.asset(
              'assets/svg/mena8.svg',
              height: Responsive.isMobile(context) ? 22.w : 12.w,
            ),
            SizedBox(height: 50.h),
            BlocBuilder<BooksCubit, BooksState>(
                builder: (BuildContext context, state) {
              var booksCubit = BooksCubit.get(context);
              return DefaultInputField(
                prefixWidget: GestureDetector(
                  onTap: () {
                    navigateToWithoutNavBar(
                        context, BooksScreenResults(), "");
                  },
                  child: Icon(
                    Icons.search,
                    color: mainBlueColor,
                    size: 30,
                  ),
                ),
                onFieldChanged: (s) {
                  booksCubit.setQuery(s);
                },
                unFocusedBorderColor: disabledGreyColor,
                fillColor: Colors.white,
                label: getTranslatedStrings(context)
                    .searchForBooksByTitleTextSubject,
              );
            }),
            SizedBox(height: 50.h),
            Text(
              getTranslatedStrings(context).or,
              style: mainStyle(context, 18, color: mainBlueColor, isBold: true),
            ),
            SizedBox(height: 50.h),
            DefaultInputField(
              prefixWidget: Icon(
                Icons.search,
                color: mainBlueColor,
                size: 30,
              ),
              unFocusedBorderColor: disabledGreyColor,
              fillColor: Colors.white,
              label: getTranslatedStrings(context).searchInsideBooks,
            ),
          ]),
        ),
      ),
    );
  }
}

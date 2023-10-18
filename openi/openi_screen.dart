import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/modules/openi/cubit/openi_state.dart';
import 'package:mena/modules/openi/widgets/mena_drop_down.dart';

import '../../core/constants/constants.dart';
import '../../core/responsive/responsive.dart';
import '../../core/shared_widgets/shared_widgets.dart';
import 'cubit/openi_cubit.dart';

class OpenIScreen extends StatefulWidget {
  const OpenIScreen({super.key});

  @override
  State<OpenIScreen> createState() => _OpenIScreenState();
}

class _OpenIScreenState extends State<OpenIScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OpenICubit(),
      child: BlocBuilder<OpenICubit, OpenIState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0.h),
              child: DefaultBackTitleAppBar(
                title: getTranslatedStrings(context).back,
              ),
            ),
            backgroundColor: newLightGreyColor,
            body: SafeArea(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/mena8.svg',
                      height: Responsive.isMobile(context) ? 22.w : 12.w,
                    ),
                    heightBox(20),
                    DefaultInputField(
                      prefixWidget: Icon(
                        Icons.search,
                        color: mainBlueColor,
                        size: 30,
                      ),
                      onFieldChanged: (s) {
                        context.read<OpenICubit>().body.queryString = s;
                      },
                      error: context.read<OpenICubit>().errors['query'],
                      unFocusedBorderColor: disabledGreyColor,
                      fillColor: Colors.white,
                      label: getTranslatedStrings(context).searchTerm,
                    ),
                    heightBox(20),
                    MenaDropDown(
                      items: context.read<OpenICubit>().articles,
                      hint: getTranslatedStrings(context).articleType,
                      onChange: (s) {
                        context.read<OpenICubit>().body.articles =
                            context.read<OpenICubit>().articles[s]!;
                      },
                      labelKey: context.read<OpenICubit>().body.articles,
                    ),
                    heightBox(20),
                    MenaDropDown(
                      items: context.read<OpenICubit>().collections,
                      hint: getTranslatedStrings(context).collections,
                      onChange: (s) {
                        context.read<OpenICubit>().body.collections =
                            context.read<OpenICubit>().collections[s]!;
                      },
                      labelKey: context.read<OpenICubit>().body.collections,
                    ),
                    heightBox(20),
                    MenaDropDown(
                      items: context.read<OpenICubit>().imageType,
                      hint: getTranslatedStrings(context).imageType,
                      onChange: (s) {
                        context.read<OpenICubit>().body.imageType =
                            context.read<OpenICubit>().imageType[s]!;
                      },
                      labelKey: context.read<OpenICubit>().body.imageType,
                    ),
                    heightBox(20),
                    MenaDropDown(
                      items: context.read<OpenICubit>().specialists,
                      hint: getTranslatedStrings(context).specialities,
                      onChange: (s) {
                        context.read<OpenICubit>().body.specialists =
                            context.read<OpenICubit>().specialists[s]!;
                      },
                      labelKey: context.read<OpenICubit>().body.specialists,
                    ),
                    heightBox(20),
                    state is OpenILoadingDataState
                        ? DefaultLoaderColor()
                        : DefaultButton(
                            height: 40.h,
                            text: getTranslatedStrings(context).apply,
                            onClick: () {
                              print(context.read<OpenICubit>().body.toMap());
                              context.read<OpenICubit>().getArticles(context);
                            }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/in_app_web.dart';
import 'package:mena/modules/bio_digital/cubit/bio_digital_state.dart';

import '../../core/constants/constants.dart';
import '../../core/shared_widgets/shared_widgets.dart';
import 'cubit/bio_digital_cubit.dart';

class BioDigitalModelsScreen extends StatefulWidget {
  const BioDigitalModelsScreen({super.key});

  @override
  State<BioDigitalModelsScreen> createState() => _BioDigitalModelsScreenState();
}

class _BioDigitalModelsScreenState extends State<BioDigitalModelsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BioDigitalCubit(),
      child: BlocBuilder<BioDigitalCubit, BioDigitalState>(
        builder: (context, state) {
          var bioDigitalCubit = BioDigitalCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0.h),
          child: DefaultBackTitleAppBar(
            title: "Bio Digital",
          ),
            ),
            backgroundColor: newLightGreyColor,
            body: SafeArea(
              child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: state is BioDigitalLoadingDataState
                  ? Center(
                      child: DefaultLoaderColor(),
                    )
                  :
                  // state is BioDigitalErrorLoadingDataState
                  //         ? ErrorWidget("Error")
                  //         :
                  MasonryGridView(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      children: [
                        if (state is BioDigitalDataLoadedSuccessState)
                          for (var i in bioDigitalCubit.res!.myhuman!)
                            DefaultContainer(
                              withBoxShadow: true,
                              withoutBorder: true,
                              childWidget: GestureDetector(
                                onTap: () {
                                  navigateToWithoutNavBar(
                                      context,
                                      InAppWebViewScreen(url: i.contentUrl!),
                                      'routeName');
                                  // AppNavigator.toWebView(
                                  //   i.contentUrl!,
                                  //   title: i.contentTitle,
                                  // );
                                },
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      width: 2000,
                                      height: 200.h,
                                      fit: BoxFit.fitHeight,
                                      imageUrl: i.contentThumbnailUrl!,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        i.contentTitle!,
                                        textAlign: TextAlign.center,
                                        style: mainStyle(context, 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                      ],
                    )),
            ),
          );
        },
      ),
    );
  }
}

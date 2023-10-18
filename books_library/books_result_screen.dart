import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mena/core/constants/constants.dart';
import 'package:mena/modules/books_library/cubit/books_cubit.dart';

import '../../core/functions/main_funcs.dart';
import '../../core/shared_widgets/in_app_web.dart';
import '../../core/shared_widgets/shared_widgets.dart';
import 'cubit/books_state.dart';

class BooksScreenResults extends StatefulWidget {
  const BooksScreenResults({super.key});

  @override
  State<BooksScreenResults> createState() => _BooksScreenResultsState();
}

class _BooksScreenResultsState extends State<BooksScreenResults> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(pagination);
  }

  void pagination() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent / 1.5 &&
        BooksCubit.get(context).state is! LoadingDataState &&
        BooksCubit.get(context).res!.numFound! >
            BooksCubit.get(context).currentOffset) {
      BooksCubit.get(context).getBooks();
    }
  }

  @override
  Widget build(BuildContext context) {
    BooksCubit.get(context)..currentOffset = 0;
    BooksCubit.get(context)..list.clear();

    BooksCubit.get(context)..getBooks();

    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        //   var bioDigitalCubit = BooksCubit.get(context);
        //   bioDigitalCubit.getBooks();
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0.h),
            child: DefaultBackTitleAppBar(
              title: getTranslatedStrings(context).searchResult,
            ),
          ),
          backgroundColor: newLightGreyColor,
          body: SafeArea(
            child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                child: state is LoadingDataState &&
                        context.read<BooksCubit>().currentOffset == 0
                    ? Center(
                        child: DefaultLoaderColor(),
                      )
                    : SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            MasonryGridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 10.h,
                              itemCount: context.read<BooksCubit>().list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return DefaultContainer(
                                  withBoxShadow: true,
                                  withoutBorder: true,
                                  childWidget: GestureDetector(
                                    onTap: () {
                                      navigateToWithoutNavBar(
                                          context,
                                          InAppWebViewScreen(
                                              url: "https://openlibrary.org/" +
                                                  (context
                                                          .read<BooksCubit>()
                                                          .list[index]
                                                          .key ??
                                                      "")),
                                          'routeName');
                                    },
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          width: 2000,
                                          height: 200.h,
                                          fit: BoxFit.fitHeight,
                                          // placeholder: (c,s){
                                          //   return Image.asset("assets/images/");
                                          // },
                                          imageUrl:
                                              "https://covers.openlibrary.org/b/${context.read<BooksCubit>().list[index].availability?.isbn != null ? "isbn" : "id"}/${context.read<BooksCubit>().list[index].availability?.isbn ?? context.read<BooksCubit>().list[index].coverId}-L.jpg",
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            context
                                                .read<BooksCubit>()
                                                .list[index]
                                                .title!,
                                            textAlign: TextAlign.center,
                                            style: mainStyle(context, 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (state is LoadingDataState &&
                                context.read<BooksCubit>().currentOffset > 0)
                              Center(
                                child: DefaultLoaderColor(),
                              )
                          ],
                        ),
                      )),
          ),
        );
      },
    );
  }
}

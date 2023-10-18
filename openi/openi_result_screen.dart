import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mena/modules/openi/models/articles_response.dart';
import 'package:mena/modules/openi/widgets/article_item.dart';

import '../../core/constants/constants.dart';
import '../../core/shared_widgets/shared_widgets.dart';

class OpenIResult extends StatelessWidget {
  final List<ArticleModel> list;

  const OpenIResult({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
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
          child: (list.isEmpty)
              ? Center(child: Text('No Articles Found'))
              : ListView.separated(
                  itemBuilder: (_, index) {
                    return ArticleItem(
                      title: list[index].title ?? "",
                      imagUrl: list[index].imgLarge ?? "",
                      affiliate: list[index].affiliate ?? "",
                      authors: list[index].authors ?? "",
                      url: list[index].pmcUrl ?? "",
                    );
                  },
                  itemCount: list.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

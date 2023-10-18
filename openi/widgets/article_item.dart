import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/shared_widgets/in_app_web.dart';

import '../../../core/constants/constants.dart';

class ArticleItem extends StatelessWidget {
  String title;
  String imagUrl;
  String affiliate;
  String authors;
  String url;

  ArticleItem(
      {Key? key,
      required this.url,
      required this.title,
      required this.imagUrl,
      required this.affiliate,
      required this.authors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (url.isNotEmpty)
          navigateToWithoutNavBar(
              context, InAppWebViewScreen(url: url), 'routeName');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultRadiusVal),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: "https://openi.nlm.nih.gov/" + imagUrl),
            if (title.isNotEmpty) const SizedBox(height: 10),
            if (title.isNotEmpty) BCSpanText(text1: 'Title', text2: title),
            if (affiliate.isNotEmpty) const SizedBox(height: 10),
            if (affiliate.isNotEmpty)
              BCSpanText(text1: 'Affiliate', text2: affiliate),
            if (authors.isNotEmpty) const SizedBox(height: 10),
            if (authors.isNotEmpty)
              BCSpanText(text1: 'Authors', text2: authors),
          ],
        ),
      ),
    );
  }
}

class BCSpanText extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback? onPressed;
  final TextStyle? style1;
  final TextStyle? style2;
  final bool reverse;

  const BCSpanText(
      {Key? key,
      required this.text1,
      required this.text2,
      this.onPressed,
      this.style1,
      this.style2,
      this.reverse = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: reverse ? text2 : text1,
        style: style1 ??
            (reverse
                ? mainStyle(context, 14, isBold: false)
                : mainStyle(context, 14, isBold: true)),
        children: <InlineSpan>[
          TextSpan(
            text: reverse ? ': $text1' : ': $text2',
            recognizer: TapGestureRecognizer()..onTap = onPressed,
            style: style2 ??
                (reverse
                    ? mainStyle(context, 14, isBold: true)
                    : mainStyle(context, 14, isBold: false)),
          ),
        ],
      ),
    );
  }
}

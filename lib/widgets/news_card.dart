import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/color_constants.dart';
import '../constants/size_constants.dart';
import '../constants/ui_constants.dart';

class NewsCard extends StatelessWidget {
  final String title, desc, postUrl, publishAt;

  const NewsCard(
      {Key? key,
      required this.desc,
      required this.title,
      required this.postUrl,
      required this.publishAt});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Sizes.dimen_4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10))),
      margin: const EdgeInsets.fromLTRB(
          Sizes.dimen_16, 0, Sizes.dimen_16, Sizes.dimen_16),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.dimen_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            vertical15,
            Text(
              title,
              maxLines: null,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            vertical5,
            Divider(
              color: AppColors.burgundy,
              thickness: 2.5,
            ),
            vertical15,
            Text(
              desc,
              maxLines: null,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
            vertical15,
            Text(
              DateFormat.yMMMd().format(DateTime.parse(publishAt)),
              style: TextStyle(color: AppColors.burgundy, fontSize: 12),
            ),
            vertical15,
          ],
        ),
      ),
    );
  }
}

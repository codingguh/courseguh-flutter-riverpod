import 'package:courseguh/common/utils/app_colors.dart';
import 'package:courseguh/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {String title = ""}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}

AppBar buildGlobalAppBar(BuildContext context, {String title = ""}) {
  return AppBar(
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}

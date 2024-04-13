import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:flutter/material.dart';

import '../../../advanced_learning/presentation/widgets/custom_appBar.dart';

class NonMuslimTopicView extends StatelessWidget {
  final String header;
  final String body;

  const NonMuslimTopicView(
      {super.key, required this.header, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBarCustom(title: header).customAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kWhiteColor,
        ),
        child: SingleChildScrollView(
            child: SelectableText(
          body,
          style: const TextStyle(color: AppColors.kBlackColor, fontSize: 17),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/components/appbar/direction_aware.dart';

class AppBarCustom {
  final String title;
  const AppBarCustom({
    required this.title,
  });

  AppBar customAppBar(BuildContext context) {
    navigatorBack() {
      Get.back();
    }

    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              // من شان تدوير الايقونة بزاوية 90
              //DirectionAware for rotate the icon to other side rtl or ltr
              child: IconButton(
                onPressed: navigatorBack,
                // child: Padding(
                //   padding: const EdgeInsets.only(
                //     left: 10,
                //     right: 25,
                //   ),
                icon: SvgPicture.asset(
                  AppAssets.kBackIcon,
                  color: AppColors.kWhiteColor,
                ),
                // ),
              ),
            ),
      title: Text(
        title.trim(),
        style: const TextStyle(
            color: AppColors.kGoldenColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

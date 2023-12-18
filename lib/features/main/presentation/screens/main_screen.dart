import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';
import 'package:elresala/features/main/presentation/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kGoldenColor,
                  ),
                ),
                SvgPicture.asset(AppAssets.logo),
              ],
            ),
            GetBuilder<MainController>(
              builder: (controller) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 30),
                itemCount: controller.homeCardsData.length,
                itemBuilder: (context, index) => HomeCard(
                  homeCardData: controller.homeCardsData[index],
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(
                  height: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

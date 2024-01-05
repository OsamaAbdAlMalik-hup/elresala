import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:elresala/features/non_muslim/presentation/screens/non_muslim_topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonMuslimSectionScreen extends GetView<NonMuslimController> {
  const NonMuslimSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            isSearch: true,
          ),
          GetBuilder<NonMuslimController>(builder: (c) {
            if (c.hadithes.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            var topics = c.hadithes;

            return SliverList.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(
                    () => NonMuslimTopicsScreen(topic: topics[index].topics),
                    transition: Transition.cupertino,
                  ),
                  child: Card(
                    color: AppColors.kGreenColor,
                    child: ListTile(
                      // onTap: () {
                      //   Get.to(() =>
                      //       NonMuslimTopicsScreen(topic: topics[index].topics));
                      // },
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: VerticalDivider(
                          thickness: 2,
                          color: AppColors.white,
                        ),
                      ),
                      title: Text(
                        topics[index].sectionName,
                        style: Styles.textStyle18Godlen,
                      ),
                      subtitle: Text(
                        topics[index].topics.first.header,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.info,
                            color: AppColors.white,
                          ),
                          Container(
                            width: 10,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

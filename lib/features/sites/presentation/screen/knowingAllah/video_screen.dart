import 'package:elresala/features/sites/presentation/controller/knowingallah_controller.dart';
import 'package:elresala/features/sites/presentation/screen/knowingAllah/video_contain_screen.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'KnowingAllah video')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    // itemCount: controller.video[0].length,
                    itemCount: controller.articals.isNotEmpty
                        ? controller.articals[0].catigory.length
                        : 0,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                
                        dataText: controller.articals[0].catigory[index].name,
                        onTap: () {         
                            Get.to(VideoContainScreen(
                              dataText: controller
                                  .articals[0].catigory[index].subCatigory,
                              itemCount: controller
                                  .articals[0].catigory[index].subCatigory.length,
                            ));
                        },
                      );
                    }))));
  }
}

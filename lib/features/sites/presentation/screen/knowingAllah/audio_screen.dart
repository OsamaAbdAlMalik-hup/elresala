
import 'package:elresala/features/sites/presentation/controller/knowingallah_controller.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'audio_contain_screen.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'KnowingAllah  audio')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.articals[1].catigory.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.articals[1].catigory[index].name,
                        onTap: () {
                        
                            // Get.to(controller.articals[1].catigory[index].subCatigory);
                          Get.to(AudioContainScreen(
                            dataText: controller
                                .articals[1].catigory[index].subCatigory,
                            itemCount: controller
                                .articals[1].catigory[index].subCatigory.length,
                          ));
                        },
                      );
                    }))));
  }
}
import 'package:elresala/features/sites/presentation/controller/knowingallah_controller.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'artical_contain_screen.dart';
class ArticalScreen extends StatelessWidget {
  const ArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'KnowingAllah Artical')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.articals[3].catigory.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.articals[3].catigory[index].name,
                        onTap: () {
                     
                          Get.to(ArticalContainScreen(
                              dataText: controller.articals[3].catigory[index].subCatigory,
                            itemCount: controller
                                .articals[3].catigory[index].subCatigory.length,
                          ));
                        },
                      );
                    }))));
  }
}
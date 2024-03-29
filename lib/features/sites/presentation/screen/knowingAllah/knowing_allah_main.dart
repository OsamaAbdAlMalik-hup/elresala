
import 'package:elresala/features/sites/presentation/controller/knowingallah_controller.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class KnowingAllahMainScreen extends StatelessWidget {
  const KnowingAllahMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Knowing Allah").customAppBar(context),
      body: GetBuilder<KnowingAllahControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.title.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: true,
                      iconData: controller.icons[index],
                      dataText: controller.title[index],
                      onTap: () {
                        Get.to(controller.page[index]);
                      },
                    );
                  }))),
    );
  }
}
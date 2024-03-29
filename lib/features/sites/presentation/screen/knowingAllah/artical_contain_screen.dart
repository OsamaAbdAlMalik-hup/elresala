import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import 'package:elresala/features/sites/presentation/controller/knowingallah_controller.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/artical_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ArticalContainScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  const ArticalContainScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index].name,
                        onTap: () {
                          Get.to(ArticalCustom(
                            dataText: dataText[index].content,
                          ));
                        },
                      );
                    })))));
  }
}
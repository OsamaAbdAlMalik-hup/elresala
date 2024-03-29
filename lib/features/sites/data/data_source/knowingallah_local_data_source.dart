import 'dart:async';
import 'dart:convert';
import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import 'package:elresala/features/sites/domain/entities/islam_for_christians_entities.dart';
import 'package:elresala/features/sites/domain/entities/knowingallah_entities.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class KnowingAllahLocalDataSource {
  Future<List<KnowingAllahEntity>> getContent();
 Future<List<FixedEntities>> getBook();

}

class KnowingAllahLocalDataSourceImpl extends KnowingAllahLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  KnowingAllahLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<KnowingAllahEntity>> getContent() async {
    Get.find<Logger>()
        .i("Start `getContent` in |KnowingAllahLocalDataSourceImpl|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.knowingAllah);
    List<KnowingAllahEntity> articles = [];

    if (fileContent != null) {
      Map<String, dynamic> jsonData = json.decode(fileContent);

      if (jsonData.containsKey('knowing-Allah')) {
        jsonData['knowing-Allah'].forEach((key, value) {
          List<IslamForChristiansEntities> category = [];

          if (value is Map<String, dynamic>) {
            value.forEach((subKey, subValue) {
              List<FixedEntities> subCategory = [];
              if (subValue is Map<String, dynamic>) {
                subValue.forEach((subSubKey, subSubValue) {
                  subCategory.add(
                      FixedEntities(name: subSubKey, content: subSubValue));
                });
              }
              category.add(IslamForChristiansEntities(
                name: subKey,
                subCatigory: subCategory,
            
              ));
            });
          }
          articles.add(KnowingAllahEntity(
            name: key,
            catigory: category, 
          ));
        });
      }
    }

    Get.find<Logger>()
        .w("End `getContent` in |KnowingAllahLocalDataSourceImpl|");
    return articles;
  }
  
  @override
  Future<List<FixedEntities>> getBook()async {
Get.find<Logger>().i("Start `getBook` in |KnowingAllahLocalDataSourceImpl|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.knowingAllah);
    List<FixedEntities> book = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['knowing-Allah']['Books'].forEach((key, value) {
        book.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
    }
    Get.find<Logger>().w("End `getBook` in |KnowingAllahLocalDataSourceImpl|");
    return Future.value(book);
  }
}
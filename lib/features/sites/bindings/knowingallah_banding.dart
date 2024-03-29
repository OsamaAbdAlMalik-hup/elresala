import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/features/sites/data/data_source/knowingallah_local_data_source.dart';
import 'package:elresala/features/sites/data/repository/knowing_allah_repo_impl.dart';
import 'package:elresala/features/sites/domain/repository/knowingallah_repository.dart';
import 'package:elresala/features/sites/presentation/controller/knowingallah_controller.dart';

import 'package:get/get.dart';


class KnowingAllahindings extends Bindings {
  @override
  dependencies() async {
    Get.put<KnowingAllahLocalDataSource>(
      KnowingAllahLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<KnowingAllahRepository>(
      KnowingAllahRepositoryImp(
        knowingallahLocalDataSource: Get.find(),
      ),
    );

    Get.put( KnowingAllahControllerImp ());
  }
}

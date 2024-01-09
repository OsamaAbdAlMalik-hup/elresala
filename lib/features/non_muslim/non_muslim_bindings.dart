import 'package:elresala/features/non_muslim/data/data_sources/non_muslim_local_data_source.dart';
import 'package:elresala/features/non_muslim/data/data_sources/non_muslim_remote_data_source.dart';
import 'package:elresala/features/non_muslim/data/repository/non_muslim_repo_impl.dart';
import 'package:elresala/features/non_muslim/domain/repository/non_muslim_repo.dart';
import 'package:elresala/features/non_muslim/presentation/controller/non_muslimController.dart';
import 'package:get/get.dart';

class NonMuslimBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<NonMuslimRemoteDataSource>(
      NonMuslimRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<NonMuslimLocalDataSource>(
      NonMuslimLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        firebaseStorageService: Get.find(),
      ),
    );
    Get.put<NonMuslimRepo>(
      NonMuslimRepoImpl(
        nonMuslimLocalDataSource: Get.find(),
        nonMuslimRemoteDataSource: Get.find(),
      ),
    );

    Get.put(NonMuslimController());
  }
}

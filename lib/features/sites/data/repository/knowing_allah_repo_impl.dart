import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/core/helpers/get_failure_from_exception.dart';
import 'package:elresala/features/sites/data/data_source/knowingallah_local_data_source.dart';
import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import 'package:elresala/features/sites/domain/entities/knowingallah_entities.dart';
import 'package:elresala/features/sites/domain/repository/knowingallah_repository.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

class KnowingAllahRepositoryImp extends KnowingAllahRepository {
  final KnowingAllahLocalDataSource knowingallahLocalDataSource;
  KnowingAllahRepositoryImp({required this.knowingallahLocalDataSource});

  @override
  Future<Either<Failure, List<KnowingAllahEntity>>> getContent() async {
    await knowingallahLocalDataSource.getContent();
    try {
      Get.find<Logger>().i("Start `getContent` in |KnowingAllahRepositoryImp|");
      var content = await knowingallahLocalDataSource.getContent();
      Get.find<Logger>()
          .w("End `getContent` in |KnowingAllahRepositoryImp| ${content.length}");
      return Right(content);
    } catch (e) {
      Get.find<Logger>().e(
          "End `getContent` in |KnowingAllahRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<FixedEntities>>> getBook() async {
    await knowingallahLocalDataSource.getBook();
    try {
      Get.find<Logger>().i("Start `getbook` in |KnowingAllahRepositoryImp|");
      var book = await knowingallahLocalDataSource.getBook();
      Get.find<Logger>()
          .w("End `getContent` in |KnowingAllahRepositoryImp| ${book.length}");
      return Right(book);
    } catch (e) { Get.find<Logger>().e(
          "End `getbook` in |KnowingAllahRepositoryImp| Exception: ${e.runtimeType}");
      return Left(getFailureFromException(e));}
  }
}
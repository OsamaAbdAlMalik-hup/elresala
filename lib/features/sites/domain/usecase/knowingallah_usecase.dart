import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import 'package:elresala/features/sites/domain/entities/knowingallah_entities.dart';
import 'package:elresala/features/sites/domain/repository/knowingallah_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class KnowingAllahUseCase {
  final KnowingAllahRepository knowingallahRepository;
  KnowingAllahUseCase(this.knowingallahRepository);


  Future<Either<Failure,List<KnowingAllahEntity>>> call() async {
    Get.find<Logger>().i("Call KnowingAllahUseCase");
    return knowingallahRepository.getContent();
    // return knowingallahRepository.getContent();
  }

  Future<Either<Failure, List<FixedEntities>>> callbook() async {
    Get.find<Logger>().i("Callbook KnowingAllahUseCase");
    return knowingallahRepository.getBook();
  }
}
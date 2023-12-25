import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/quran/domain/entities/surah_entity.dart';
import 'package:elresala/features/quran/domain/repository/quran_repo.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetSurahsUseCase {
  final QuranRepo quranRepo;

  GetSurahsUseCase(this.quranRepo);

  Future<Either<Failure, List<Surah>>> call({required Function(double progress) onProgress}) async {
    Get.find<Logger>().i("Call GetSurahsUseCase");
    return await quranRepo.getSurahs(onProgress: onProgress);
  }
}


import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import 'package:elresala/features/sites/domain/entities/knowingallah_entities.dart';
import 'package:elresala/features/sites/domain/usecase/knowingallah_usecase.dart';

import 'package:elresala/features/sites/presentation/screen/knowingAllah/artical_screen.dart';
import 'package:elresala/features/sites/presentation/screen/knowingAllah/audio_screen.dart';
import 'package:elresala/features/sites/presentation/screen/knowingAllah/book_screen.dart';
import 'package:elresala/features/sites/presentation/screen/knowingAllah/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
class KnowingAllahControllerImp extends GetxController {
  List title = ['Videos', 'Audios', 'Books', 'Articales'];
  List<IconData> icons = [
    Icons.headphones_outlined,
    Icons.tv_outlined,
    Icons.book_outlined,
    Icons.article_rounded,
  ];
  List<Widget> page = [
    const VideoScreen(),
    const AudioScreen(),
    const BookScreen(),
    const ArticalScreen(),
  ];

  List<FixedEntities> book = [];
  List<KnowingAllahEntity> articals = [];



  StateType getBookState = StateType.init;
  StateType getArticalsState = StateType.init;
  



  // Primitive
  String validationMessage = '';
  //  Future<void> getVedio() async {

    Future<void> getBook() async {
    KnowingAllahUseCase knowingallahUseCase = KnowingAllahUseCase(Get.find());
    var result = await knowingallahUseCase.callbook();
    result.fold(
      (l) async {
        getBookState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getBookState = StateType.init;
      },
      (r) {
        getBookState = StateType.success;
        book = r;
        update();
      },
    );
  }
  Future<void> getArtical() async {
    KnowingAllahUseCase knowingallahUseCase = KnowingAllahUseCase(Get.find());
    var result = await knowingallahUseCase();
    result.fold(
      (l) async {
        getArticalsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getArticalsState = StateType.init;
      },
      (r) {
        getArticalsState = StateType.success;
        articals = r;
        update();
      },
    );
  }
  @override
  void onInit() async {
    super.onInit();    
    await getArtical();
   await getBook();
  }
}
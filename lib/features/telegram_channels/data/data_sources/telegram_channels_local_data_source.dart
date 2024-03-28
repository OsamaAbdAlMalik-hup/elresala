import 'dart:convert';

import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/telegram_channels/data/models/telegram_channels_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class TelegramChannelsModelLocalDataSource {
  Future<TelegramChannels> getTelegramChannels();
}

class TelegramChannelsModelLocalDataSourceImpl
    extends TelegramChannelsModelLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  TelegramChannelsModelLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<TelegramChannels> getTelegramChannels() async {
    try {
      Get.find<Logger>().i(
          "Start `getTelegramChannels` in |TelegramChannelsModelLocalDataSourceImpl|");
      // Read the local JSON file
      String? fileContent =
          await archiveService.readFile(name: AppKeys.telegram);
      // Call the readFile method
       Map<String, dynamic> jsonData = json.decode(fileContent!);
        jsonData['ahlulsunnahve'];
      TelegramChannels channelsModel = TelegramChannels.fromJson(jsonData);
      Get.find<Logger>().w(
          "End `getTelegramChannels` in |TelegramChannelsModelLocalDataSourceImpl|");
      return channelsModel;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getChannels` in |TelegramChannelsModelLocalDataSourceImpl| Exception: $e",
      );
      rethrow;
    }
  }
}

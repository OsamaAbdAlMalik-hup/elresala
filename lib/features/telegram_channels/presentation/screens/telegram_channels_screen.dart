import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/direction_aware.dart';
import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/telegram_channels/presentation/controller/telegram_channels_controller.dart';
import 'package:elresala/features/telegram_channels/presentation/screens/telegram_channels_messages_screen.dart';
import 'package:elresala/features/telegram_channels/presentation/widgets/telegram_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TelegramChannelsScreen extends StatelessWidget {
  const TelegramChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TelegramChannelsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          appBar: AppBar(
            elevation: 0,
            leading: !Navigator.canPop(context)
                ? null
                : DirectionAware(
                    // من شان تدوير الايقونة بزاوية 90
                    //DirectionAware for rotate the icon to other side rtl or ltr
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 25,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.kBackIcon,
                          color: AppColors.gray,
                        ),
                      ),
                    ),
                  ),
            backgroundColor: AppColors.kPrimaryColor,
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: TelegramSearchDelegate(
                      channelsNameList: controller.channelsNames,
                      channelMessagesList: controller.channelMessagesList,
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: HandleStatesWidget(
            stateType: controller.getTelegramChannelsState,
            child: ListView(
              children: [
                const ListTile(
                  leading: Text(
                    'Groups',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kGoldenColor),
                  ),
                ),
                ListView.builder(
                  itemCount: controller.channelsNames.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => TelegramChannelsMessagesScreen(
                            channelMessages:
                                controller.channelMessagesList[index],
                            channelName: controller.channelsNames[index],
                          ),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        color: AppColors.kPrimaryColor,
                        child: ListTile(
                          //  isThreeLine: true,
                          title: Text(
                            controller.channelsNames[index],
                            style: Styles.textStyle18White,
                          ),
                          leading: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/svg/images/zaghrafa.png'),
                            backgroundColor: AppColors.kGreenColor,
                          ),
                          subtitle: Text(
                            '${controller.channelMessagesList[index].messages.values.toList().last} Messages',
                            maxLines: 2,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: Container(
                            height: 20,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.kGreenColor,
                            ),
                            child: Center(
                              child: Text(
                                '${controller.channelMessagesList[index].messages.length}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

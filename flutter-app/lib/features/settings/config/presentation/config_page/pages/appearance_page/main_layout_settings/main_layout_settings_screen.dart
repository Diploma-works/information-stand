import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:information_stand/ui/ui_kit/widgets/app_bar/setting_app_bar/setting_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../global/di.dart';
import '../../../../../../../../services/file_service/app_file_service/app_file_service.dart';
import '../../../../../../../../ui/ui_kit/widgets/button/circle_button.dart';
import '../../../../../../../../ui/ui_kit/widgets/wait/wait_progress.dart';
import '../../../../../../../home/presentation/home_page/state/home_state/home_state_mock.dart';
import '../../../../../state/uticlock_config_state.dart';
import '../../../widgets/custom_color_picker/custom_color_picker.dart';
import '../../../widgets/image_picker_container/image_picker_container.dart';
import '../../../widgets/info_container.dart';
import '../widgets/main_layout_preview.dart';

@RoutePage()
class MainLayoutSettingsScreen extends StatelessWidget {
  const MainLayoutSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ConfigState>();
    final homeState = context.read<HomeStateForSettings>();
    final appFileService = getIt<AppFileService>();

    return Scaffold(
      backgroundColor: context.style.color.backgroundScaffoldDark,
      appBar: SettingAppBar(
        left: CircleButton(
          onTap: context.router.pop,
          child: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        center: const Text(
          'Настройки внешнего вида',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.style.padding.medium,
        child: Row(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.5,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: const IgnorePointer(
                                    child: MainLayoutPreview())),
                          ),
                        ),
                        context.style.padding.w.medium,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            context.style.padding.w.small,
            const VerticalDivider(),
            context.style.padding.w.small,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoContainer(widgetName: 'Выбор основной картинки', list: [
                      Row(
                        children: [
                          Expanded(
                            child: FutureBuilder<File>(
                              future: appFileService.getBackGround(),
                              builder: (context, data) {
                                if (data.hasData) {
                                  return ImagePickerContainer(
                                    onPick: state.changeBackground,
                                    file: data.data!,
                                  );
                                } else {
                                  return const Center(child: WaitProgress());
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: FutureBuilder<File>(
                              future: appFileService.getLogo(),
                              builder: (context, data) {
                                if (data.hasData) {
                                  return ImagePickerContainer(
                                    onPick: state.changeLogo,
                                    file: data.data!,
                                  );
                                } else {
                                  return const Center(child: WaitProgress());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
                    InfoContainer(widgetName: 'Статус бар', list: [
                      CustomColorPicker(
                        text: 'Цвет статус бара',
                        pickColor: context.style.mainLayout.color.appBar,
                        onColorChanged: state.changeAppBarColor,
                      ),
                      CustomColorPicker(
                        text: 'Цвет часов',
                        pickColor: context.style.mainLayout.color.clock,
                        onColorChanged: state.mainLayoutSettings.changeClockColor,
                        //onColorSelected:
                      ),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

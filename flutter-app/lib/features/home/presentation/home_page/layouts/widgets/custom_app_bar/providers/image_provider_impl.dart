import 'dart:io';

import 'package:flutter/material.dart';
import 'package:information_stand/global/di.dart';
import 'package:information_stand/services/file_service/app_file_service/app_file_service.dart';
import '../../../providers/images_provider_rep.dart';

class ImageProviderImpl with ChangeNotifier implements ImageProviderRep {

  @override
  Image background;

  @override
  Image logo;

  final appFileService = getIt<AppFileService>();

  ImageProviderImpl()
      : background = Image.asset('assets/images/background.jpg'),
        logo = Image.asset('assets/images/logo.png'){
    loadImages();
  }

  void loadImages() async {

    final background = await appFileService.getBackGround();
    final logo = await appFileService.getLogo();

    changeBackground(background);
    changeLogo(logo);

  }

  @override
  changeBackground(File file) {
    background = Image.file(file);
    notifyListeners();
  }

  @override
  changeLogo(File file) {
    logo = Image.file(file);
    notifyListeners();
  }

}

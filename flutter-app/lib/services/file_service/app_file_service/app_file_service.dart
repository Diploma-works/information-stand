import 'dart:io';

import 'package:injectable/injectable.dart';

import '../file_service.dart';

@Singleton()
class AppFileService{

  FileService service;

  AppFileService(this.service);

  Future<File> getLogo() async {
    return await service.getFile(dirName: 'assets', fileName: 'logo.png');

  }

  Future<void> changeLogo(File? file) async{

   if(file != null){
     await service.saveFile(file: file, dirName: 'assets', fileName: 'logo.png');
   }

  }

  Future<File> getBackGround() async{
    return await service.getFile(dirName: 'assets', fileName: 'background.jpg');
  }

  Future<void> changeBackground(File? file) async{

    if(file != null){
      await service.saveFile(file: file, dirName: 'assets', fileName: 'background.jpg');
    }

  }


}
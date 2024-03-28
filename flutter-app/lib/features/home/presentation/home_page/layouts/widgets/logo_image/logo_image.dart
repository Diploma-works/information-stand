import 'dart:io';
import 'package:flutter/material.dart';
import '../../providers/images_provider_rep.dart';
import '/global/di.dart';
import '/services/file_service/app_file_service/app_file_service.dart';

class LogoImage extends StatelessWidget {

  final AppFileService service = getIt<AppFileService>();
  final ImageProviderRep imageProvider;

  LogoImage({Key? key, required this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.getLogo(),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if(snapshot.hasData){
          return imageProvider.logo;
        }else{
          return Image.asset('assets/images/logo.png');
        }
      },
    );
  }
}

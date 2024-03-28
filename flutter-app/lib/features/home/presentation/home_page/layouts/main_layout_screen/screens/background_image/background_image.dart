import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../../../../global/di.dart';
import '../../../../../../../../services/file_service/app_file_service/app_file_service.dart';
import '../../../providers/images_provider_rep.dart';


class BackGroundImage extends StatelessWidget {

  final AppFileService service = getIt<AppFileService>();
  final ImageProviderRep imageProvider;


  BackGroundImage({super.key, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.getBackGround(),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider.background.image,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
              ),
            ),
          );
        } else {
          return Image.asset('assets/images/background.jpg');
        }
      },
    );
  }
}

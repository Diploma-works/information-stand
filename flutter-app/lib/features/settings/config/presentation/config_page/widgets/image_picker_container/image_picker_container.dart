import 'dart:io';
import 'package:information_stand/services/file_service/file_service.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../../global/di.dart';

class ImagePickerContainer extends StatefulWidget {
  const ImagePickerContainer({
    Key? key,
    required this.file,
    required this.onPick,
  }) : super(key: key);

  final Function(File? file) onPick;
  final File file;

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  final fileService = getIt<FileService>();

  late Image image;
  @override
  void initState() {
    image = Image.file(widget.file);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: image.image,
          )),
      margin: context.style.padding.medium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final File? file = await fileService.pickImage();
                onPick(file);
              },
              child: const Text('Выбрать'),
            ),
          ),
        ],
      ),
    );
  }
  void onPick(File? file) {
    widget.onPick(file);
    if (file != null) {
      imageCache.clear();
      image.image.evict();
      setState(() {
        image = Image.file(file);
      });
    }
  }
}

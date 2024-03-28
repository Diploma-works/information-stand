import 'dart:io';
import 'package:flutter/cupertino.dart';

abstract class ImageProviderRep {

  late Image logo;

  late Image background;

  changeLogo(File file);

  changeBackground(File file);


}
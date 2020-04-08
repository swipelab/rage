import 'package:flutter/material.dart';
import 'package:rant/matrix/matrix.dart';
import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/matrix/types/mx_image.dart';
//import 'package:rant/util/util.dart';

class ImagePresenter extends StatelessWidget {
  final MxEvent event;
  final MxImage image;
  ImagePresenter(this.event) : image = event.content as MxImage;

  Widget build(BuildContext context) {
    return Image.network(Matrix.mxcToUrl(image.url));
  }
}

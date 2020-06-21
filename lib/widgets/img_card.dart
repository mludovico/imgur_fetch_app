import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageCard extends StatelessWidget {

  String url;

  ImageCard({this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: FadeInImage.memoryNetwork(
        fadeInDuration: Duration(seconds: 1),
        placeholder: kTransparentImage,
        image: url,
        fit: BoxFit.cover,
        ),
    );
  }
}

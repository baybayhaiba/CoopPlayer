import 'package:flutter/material.dart';

class ImageCircle extends StatelessWidget {
  final ImageProvider? imageProvider;
  final double radius;

  const ImageCircle({Key? key, this.imageProvider, this.radius = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        backgroundImage: imageProvider,
        radius: radius - 5,
      ),
    );
  }
}

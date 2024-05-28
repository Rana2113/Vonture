import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 218,
        decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(image)),
        ));
  }
}

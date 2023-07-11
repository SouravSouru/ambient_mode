import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  String image;
  FullScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Hero(
        tag: "image",
        child: Container(
          height: _mediaQuery.height,
          width: _mediaQuery.width,
          child: Image(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

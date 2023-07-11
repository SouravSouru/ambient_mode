import 'package:ambient_mode/constant/appConstant.dart';
import 'package:ambient_mode/controller/mainPageController.dart';
import 'package:ambient_mode/screens/fullScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:provider/provider.dart';

class Ambient_Screen extends StatelessWidget {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<MainPageController>(builder: (context, value, _) {
        return ImagePixels.container(
          imageProvider: NetworkImage(AppConstants.images[value.currentIndex]),
          child: PageView.builder(
              controller: _controller,
              itemCount: AppConstants.images.length,
              onPageChanged: (value) {
                Provider.of<MainPageController>(context, listen: false)
                    .onPageChange(value);
              },
              itemBuilder: (context, index) {
                return Center(
                  child: GestureDetector(
                    onLongPress: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FullScreen(
                            image: AppConstants.images[value.currentIndex]),
                      ));
                    },
                    child: Hero(
                      tag: "image",
                      child: Container(
                        color: Colors.transparent,
                        margin: EdgeInsets.all(10),
                        height: _mediaQuery.height / 3,
                        width: _mediaQuery.width / 1.1,
                        child: Image(
                          image: NetworkImage(
                              AppConstants.images[value.currentIndex]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}

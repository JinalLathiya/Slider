import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageChanger extends StatefulWidget {
  const ImageChanger({Key? key, carouselController, options, items})
      : super(key: key);

  @override
  State<ImageChanger> createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  CarouselController carouselbuttonController = CarouselController();
  int initialpage = 0;
  double _height = 6;
  double _width = 6;

  List<String> image = <String>[
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
    "assets/5.jpg",
    "assets/6.jpg",
    "assets/7.jpg",
    "assets/8.jpg",
    "assets/9.jpg",
    "assets/10.jpg",
    "assets/11.jpg",
    "assets/12.jpg",
    "assets/13.jpg",
    "assets/14.jpg",
    "assets/15.jpg",
    "assets/16.jpg",
    "assets/17.jpg",
    "assets/18.jpg",
    "assets/19.jpg",
    "assets/20.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Changer",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselbuttonController,
              options: CarouselOptions(
                  height: 500,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 0.8,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 200),
                  initialPage: initialpage,
                  onPageChanged: (val, _) {
                    setState(() {
                      initialpage = val;
                    });
                  }),
              items: image
                  .map(
                    (e) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: image
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          int i = image.indexOf(e);
                          carouselbuttonController.animateToPage(
                            i,
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 200),
                          );
                        },
                        child: Container(
                          height:  _height,
                          width: _width,
                          decoration: BoxDecoration(
                            color: (image.indexOf(e) != initialpage)
                                ? Colors.white.withOpacity(0.4)
                                : Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

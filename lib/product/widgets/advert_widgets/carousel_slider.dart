import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final List<String> images;
  const CarouselSlider({super.key, required this.images});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late PageController _pageController;
  int activePage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: widget.images.length,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, index) {
            return Image.network(
              widget.images[index],
              fit: BoxFit.cover,
              // TODO errorBuilder
              // TODO loadingBuilder
            );
          },
        ),
        // INDICATORS
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.lowValue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(widget.images.length, activePage),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: context.paddingLow * .3,
        width: 7,
        height: 7,
        decoration: BoxDecoration(color: currentIndex == index ? ColorName.white : ColorName.lightGrey, shape: BoxShape.circle),
      );
    });
  }
}

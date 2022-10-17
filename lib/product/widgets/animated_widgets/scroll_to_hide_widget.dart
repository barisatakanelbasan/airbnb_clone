import 'package:airbnb_clone/view/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const ScrollToHideWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  var bottomBarHeight = kBottomNavigationBarHeight + MediaQueryData.fromWindow(ui.window).padding.bottom;

  @override
  void initState() {
    super.initState();
    draggableScrollController.addListener(listen);
  }

  @override
  void dispose() {
    draggableScrollController.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final size = draggableScrollController.size;
    setState(() {
      if (size < 0.121) {
        bottomBarHeight = 0;
      } else {
        bottomBarHeight = size * (kBottomNavigationBarHeight + MediaQueryData.fromWindow(ui.window).padding.bottom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: bottomBarHeight,
      child: Wrap(
        children: [widget.child],
      ),
    );
  }
}

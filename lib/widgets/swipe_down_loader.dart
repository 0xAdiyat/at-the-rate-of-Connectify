import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class SwipeDownLoader extends StatefulWidget {
  final double scrollOffset;

  const SwipeDownLoader({Key? key, required this.scrollOffset})
      : super(key: key);

  @override
  _SwipeDownLoaderState createState() => _SwipeDownLoaderState();
}

class _SwipeDownLoaderState extends State<SwipeDownLoader>
    with SingleTickerProviderStateMixin {
  late final FlutterGifController _controller;
  final double minSize = 50.0;
  final double maxSize = 120.0;

  @override
  void initState() {
    super.initState();

    _controller = FlutterGifController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _calculateSize() {
    final double sizeDifference = maxSize - minSize;
    final double scrollPercentage =
        widget.scrollOffset / MediaQuery.of(context).size.height;
    final double sizeChange = scrollPercentage * sizeDifference;
    return minSize + sizeChange.clamp(0, sizeDifference);
  }

  @override
  void didUpdateWidget(SwipeDownLoader oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.scrollOffset > 29) {
      _controller.value = 0;
      _controller.animateTo(14.9);
    } else {
      _controller.value = widget.scrollOffset;
      _controller.animateTo(29);
      if (widget.scrollOffset == -0.0) {
        _controller.value = 0;
        _controller.animateTo(14.9);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double loaderSize = _calculateSize();

    return GifImage(
      controller: _controller,
      height: loaderSize,
      width: loaderSize,
      image: const AssetImage("assets/gifs/thread_loading_animation.gif"),
    );
  }
}

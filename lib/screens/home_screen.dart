import 'package:at_the_rate_of_connectify/widgets/swipe_down_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_updateScrollOffset);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollOffset() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              if (_scrollOffset == 0)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SwipeDownLoader(
                    scrollOffset: -_scrollOffset,
                  ),
                ),
              if (_scrollOffset < 0)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 10,
                    right: 10,
                  ),
                  child: SwipeDownLoader(
                    scrollOffset: -_scrollOffset,
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 300,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

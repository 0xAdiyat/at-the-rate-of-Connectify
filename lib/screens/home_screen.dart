import 'dart:ffi';

import 'package:at_the_rate_of_connectify/utils/constants.dart';
import 'package:at_the_rate_of_connectify/widgets/swipe_down_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  itemCount: 5,
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      // color: Colors.white12,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                kGblPadding, 10, kGblPadding, 3),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundImage: NetworkImage(
                                                    "https://avatars.githubusercontent.com/u/67780459?v=4"),
                                              ),
                                              Positioned(
                                                top: 15,
                                                left: 15,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      size: 18,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 14.0),
                                          child: Text(
                                            "0xadiyat",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "2h",
                                          style: TextStyle(
                                              color: Color(0xff4A4A4A)),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.more_horiz_rounded,
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    const Positioned(
                                      left: 22,
                                      child: SizedBox(
                                        height: 405,
                                        child: VerticalDivider(
                                          color: Colors.white24,
                                          thickness: 1.5,
                                          width: 4,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          60, 0, 10, 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            offset: const Offset(0, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Text(
                                              "Cinematographer Greig Fraser's next 3 projects",
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  offset: Offset(0, 1),
                                                  blurRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                "https://michaelkilman.files.wordpress.com/2022/12/raven7straygos_it_is_an_ancient_thing_when_the_leaves_take_thei_a1c8ef7e-e531-4d0d-8bcf-e5714b420f8e.png",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 40.0, top: 20),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  CupertinoIcons.heart,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Icon(
                                                  CupertinoIcons.chat_bubble,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Icon(
                                                  CupertinoIcons.repeat,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Icon(
                                                  Icons.send_rounded,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  right: 3,
                                                  top: 0,
                                                  child: CircleAvatar(
                                                    radius: 12,
                                                    backgroundImage: NetworkImage(
                                                        "https://e1.pxfuel.com/desktop-wallpaper/419/318/desktop-wallpaper-cute-anime-boy-ipad-anime-for-ipad.jpg"),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 12,
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundImage: NetworkImage(
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVUBsZ7b9UC8jtrlzSbjf1H1M2Zeh8DM9xwQ&usqp=CAU"),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 7,
                                                  right: 15,
                                                  child: CircleAvatar(
                                                    radius: 7,
                                                    backgroundImage: NetworkImage(
                                                        "https://p4.wallpaperbetter.com/wallpaper/745/67/618/jujutsu-kaisen-anime-boys-anime-hd-wallpaper-preview.jpg"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "10 replies",
                                            style: TextStyle(
                                                color: Color(0xff4A4A4A),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 2,
                                              width: 2,
                                              color: Color(0xff4A4A4A),
                                            ),
                                          ),
                                          Text(
                                            "86 likes",
                                            style: TextStyle(
                                                color: Color(0xff4A4A4A),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.white12,
                          ),
                        ],
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

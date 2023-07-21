import 'dart:ffi';

import 'package:at_the_rate_of_connectify/utils/constants.dart';
import 'package:at_the_rate_of_connectify/widgets/swipe_down_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
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
                  padding: const EdgeInsets.only(top: 15.0),
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
                  itemCount: usernames.length,
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  kGblPadding, 0, kGblPadding, 3),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50,
                                                            top: 15.0),
                                                    child: Text(
                                                      usernames[index],
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 15.0),
                                            child: Text(
                                              "2h",
                                              style: TextStyle(
                                                  color: Color(0xff4A4A4A)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0, top: 15),
                                            child: Icon(
                                              Icons.more_horiz_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 10, 20),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          28, 0, 10, 0),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                        color: Colors.white12,
                                        width: 3,
                                      ))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            postCaptions[index],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset:
                                                          const Offset(0, 1),
                                                      blurRadius: 2,
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(0.4),
                                                          width: 1,
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    0, 1),
                                                            blurRadius: 2,
                                                          ),
                                                        ],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          postImages[index],
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Icon(
                                                            CupertinoIcons
                                                                .heart,
                                                            color: Colors.white,
                                                            size: 28,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Image.asset(
                                                            'assets/icons/edd.webp', // Replace 'your_image.webp' with your actual image file name
                                                            width: 24,
                                                            fit: BoxFit.cover,
                                                            height: 24,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Image.asset(
                                                            'assets/icons/repost.webp', // Replace 'your_image.webp' with your actual image file name
                                                            width: 24,
                                                            height: 24,
                                                            fit: BoxFit.cover,

                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Image.asset(
                                                            'assets/icons/share.webp', // Replace 'your_image.webp' with your actual image file name
                                                            width: 24,
                                                            fit: BoxFit.cover,

                                                            height: 24,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 10, 0),
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
                                      width: 6,
                                    ),
                                    const Text(
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
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 15,
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage:
                                          NetworkImage(profilePics[index]),
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add_circle,
                                            size: 18,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white12,
                        ),
                      ],
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

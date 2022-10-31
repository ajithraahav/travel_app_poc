import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travelslide/pages/detail_page.dart';
import 'package:travelslide/widgets/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelslide/widgets/custom_page_route.dart';
import 'package:travelslide/widgets/gradient_icon.dart';

import '../widgets/dot_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int gottenStars = 4;
  bool isBookmarked = false;
  List images = [
    'img-slide1.jpg',
    'img-slide2.jpg',
    'img-slide3.jpg',
    'img-slide4.jpg',
    'img-slide5.jpg',
    'img-slide6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          title: AppText(
            size: 30,
            text: 'Explore',
            color: Colors.black,
            weight: FontWeight.w500,
          ),
          toolbarHeight: 100,
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 50,
              height: 50,
              child: SvgPicture.asset('assets/images/avatar.svg'),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator:
                        DotIndicator(color: Colors.blueAccent, radius: 3),
                    tabs: [
                      Tab(
                        text: 'Sights',
                      ),
                      Tab(
                        text: 'Tours',
                      ),
                      Tab(
                        text: 'Adventures',
                      ),
                    ]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 350,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    AppText(
                      text: '23 sights',
                      size: 12,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute(
                                          child: DetailPage(),
                                          direction: AxisDirection.up));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  padding: EdgeInsets.fromLTRB(20, 10, 10, 25),
                                  width: 250,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/${images[index]}'),
                                          fit: BoxFit.cover)),
                                  child: Align(
                                    child: Stack(children: [
                                      Positioned(
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isBookmarked = !isBookmarked;
                                            });
                                          },
                                          child: GradientIcon(
                                            bgSize: 40,
                                            icon: isBookmarked
                                                ? Icons.bookmark
                                                : Icons
                                                    .bookmark_outline_outlined,
                                            startColor: isBookmarked
                                                ? Color.fromARGB(
                                                    255, 14, 71, 214)
                                                : Colors.white,
                                            endColor: isBookmarked
                                                ? Color.fromARGB(
                                                    255, 160, 186, 253)
                                                : Colors.white,
                                            radius: 30,
                                            iconColor: isBookmarked
                                                ? Colors.white
                                                : Colors.blue,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Wrap(
                                                children:
                                                    List.generate(5, (index) {
                                                  return Icon(
                                                    index < gottenStars
                                                        ? Icons.star
                                                        : Icons
                                                            .star_border_outlined,
                                                    color: Colors.amber,
                                                    size: 16,
                                                  );
                                                }),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              AppText(
                                                text: '4.0',
                                                color: Colors.white,
                                                size: 12,
                                                weight: FontWeight.w500,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          AppText(
                                            text: 'LightHouse Excursions',
                                            color: Colors.white,
                                            weight: FontWeight.w500,
                                            size: 22,
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Text('There'),
                const Text('Bye'),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: AppText(
                  text: 'Popular',
                  color: Colors.black,
                  weight: FontWeight.w600,
                  size: 20,
                )),
            Card(
                margin: EdgeInsets.all(20),
                elevation: 10,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                                image: AssetImage('assets/images/img1.jpg')),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: 'European Tour',
                                weight: FontWeight.w500,
                                size: 18,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              AppText(
                                text: '14 april . 2 april 2022',
                                weight: FontWeight.w500,
                                size: 12,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}

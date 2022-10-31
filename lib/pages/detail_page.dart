import 'package:flutter/material.dart';
import 'package:travelslide/widgets/app_text.dart';
import 'package:travelslide/widgets/bottom_sheet1.dart';
import 'package:travelslide/widgets/gradient_icon.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  int gottenStars = 4;
  bool isBookmarked = false;
  int persons = 30;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnimationController controller =
        AnimationController(
          vsync: this, 
          duration: Duration(milliseconds: 700),
          reverseDuration: Duration(milliseconds: 700));
    return Scaffold(
        body: Container(
            width: double.maxFinite,
            child: Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 60),
                  width: double.maxFinite,
                  height: 470,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/img-slide2.jpg'),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(
                              index < gottenStars
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: Colors.amber,
                              size: 16,
                            );
                          })),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: '4.0',
                            color: Colors.white,
                            size: 16,
                            weight: FontWeight.w500,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppText(
                        text: 'LightHouse\nExcursions',
                        color: Colors.white,
                        weight: FontWeight.w500,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 30,
                        ),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.file_upload_outlined,
                          size: 30,
                        ),
                        color: Colors.white,
                      )
                    ],
                  )),
              Positioned(
                  top: 440,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text:
                                'Newhaven Lighthouse in\nEdinburgh, United Kingdom',
                            size: 20,
                            weight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              AppText(
                                text: 'Available: ',
                                size: 14,
                                weight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              AppText(
                                text: '10:00 - 18:00 . Mon - Sat',
                                size: 16,
                                weight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              AppText(
                                text: 'Duration: ',
                                size: 14,
                                weight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              AppText(
                                text: '4 hours',
                                size: 16,
                                weight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              AppText(
                                text: 'Price: ',
                                size: 14,
                                weight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              AppText(
                                text: '\u20B9 20',
                                size: 16,
                                weight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Slider(
                            thumbColor: Colors.blue[900],
                            activeColor: Colors.blue,
                            inactiveColor: Colors.lightBlue.shade50,
                            value: persons.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                persons = value.toInt();
                              });
                            },
                            min: 1,
                            max: 100,
                          ),
                          AppText(
                            text: '${persons.toString()} Persons',
                            size: 14,
                            weight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: 'Total:\u20B9 60',
                                weight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              Material(
                                elevation: 13,
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    bottomSheet1(context, controller);
                                  },
                                  child: Ink(
                                    padding: EdgeInsets.all(40),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 14, 71, 214),
                                              Color.fromARGB(255, 128, 164, 255)
                                            ])),
                                    child: AppText(
                                      text: 'Book Now',
                                      color: Colors.white,
                                      size: 16,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ))),
              Positioned(
                right: 20,
                top: 410,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: GradientIcon(
                    bgSize: 50,
                    icon: isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_outline_outlined,
                    startColor: isBookmarked
                        ? Color.fromARGB(255, 14, 71, 214)
                        : Colors.white,
                    endColor: isBookmarked
                        ? Color.fromARGB(255, 160, 186, 253)
                        : Colors.white,
                    radius: 30,
                    iconColor: isBookmarked ? Colors.white : Colors.blue,
                    size: 20,
                  ),
                ),
              ),
            ])));
  }
}

import 'package:flutter/material.dart';
import 'package:travelslide/widgets/app_text.dart';

Future<void> bottomSheet2(context, controller) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet<void>(
    transitionAnimationController: controller,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        color: Colors.transparent,
        height: size.height * 0.7,
        child: Stack(
          children: [
            Positioned(
                left: 20,
                right: 20,
                bottom: 100,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      AppText(
                        text: 'Excursion',
                        size: 12,
                        weight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppText(
                        text: 'Lighthouse',
                        size: 20,
                        weight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          AppText(
                            text: 'Time: ',
                            size: 14,
                            weight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          AppText(
                            text: '24 Nov, 10:00 AM ',
                            size: 16,
                            weight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          AppText(
                            text: ' . Person: ',
                            size: 14,
                            weight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          AppText(
                            text: '3',
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
                            text: '\u20B9 60',
                            size: 16,
                            weight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(thickness: 1),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Open Excursion'))
                    ],
                  ),
                )),
            Positioned(
              bottom: size.height * 0.43,
              left: size.width * 0.25,
              child:
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img-slide1.jpg'),
                    fit: BoxFit.cover
                    )
                ))),
            SizedBox(
              height: 30,
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: SizedBox(
                height: 60,
                width: size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      animationDuration: Duration(seconds: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.white),
                  child: AppText(
                    text: 'Done',
                    size: 16,
                    weight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

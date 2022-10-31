import 'package:flutter/material.dart';
import 'package:travelslide/widgets/app_text.dart';
import 'package:travelslide/widgets/bottom_sheet_2.dart';
import 'package:travelslide/widgets/calendar_widget.dart';
import 'package:travelslide/widgets/timing_checkbox.dart';



Future<void> bottomSheet1(context, controller) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet<void>(
    transitionAnimationController: controller,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        height: size.height * 0.9,
        // color: Colors.amber,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      )),
                  AppText(
                    text: "Booking",
                    color: Colors.black,
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                  AppText(
                    text: "Done",
                    color: Colors.blue,
                    weight: FontWeight.w400,
                    size: 14,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CalendarTable(),
            SizedBox(
              height: 20,
            ),
            Divider(thickness: 1),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return TimingCheckbox(
                        title: '10:00 - 14:00',
                        subtitle: 'Lasst spot remaining');
                  }),
                  separatorBuilder: ((context, index) {
                    return SizedBox(
                      height: 15,
                    );
                  }),
                  itemCount: 3),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  bottomSheet2(context, controller);
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    text: 'Checkout',
                    color: Colors.white,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      );
    },
  );
}

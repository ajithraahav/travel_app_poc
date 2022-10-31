import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelslide/widgets/app_text.dart';

class CalendarTable extends StatefulWidget {
  @override
  _CalendarTableState createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        //To show Calendar Widget
        Container(
            height: 70,
            child: Container(
                child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 1);
              },
              itemCount: 365,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentDateSelectedIndex = index;
                      selectedDate = DateTime.now().add(Duration(days: index));
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient:   LinearGradient(
                          colors: [
                            currentDateSelectedIndex == index ?
                            Color.fromARGB(255, 12, 81, 255): Colors.transparent, 
                            currentDateSelectedIndex == index ?
                                Color.fromARGB(255, 128, 164, 255) : Colors.transparent
                           ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: listOfDays[DateTime.now()
                                      .add(Duration(days: index))
                                      .weekday -
                                  1]
                              .toString(),
                          size: 12,
                          color: currentDateSelectedIndex == index
                                  ? Colors.white
                                  : Colors.grey
                          ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: DateTime.now()
                              .add(Duration(days: index))
                              .day
                              .toString(),
                          size: 20,
                          weight: FontWeight.w700,
                          color: currentDateSelectedIndex == index
                                  ? Colors.white
                                  : Colors.black
                                  ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ))),
      ],
    );
  }
}

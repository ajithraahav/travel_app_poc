import 'package:flutter/material.dart';

import 'package:travelslide/widgets/app_text.dart';

class TimingCheckbox extends StatefulWidget {
  final String title;
  final String subtitle;
  
  const TimingCheckbox({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<TimingCheckbox> createState() => _TimingCheckboxState();
}

class _TimingCheckboxState extends State<TimingCheckbox> {
  bool _value1 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(5),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(
              3.0,
              3.0,
            ), //Offset
            blurRadius: 40.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: CheckboxListTile(
        title: AppText(
          text: widget.title,
          size: 14,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: AppText(
          text: widget.subtitle,
          size: 12,
          weight: FontWeight.bold,
          color: Colors.grey.shade400,
        ),
        autofocus: false,
        isThreeLine: true,
        checkboxShape: CircleBorder(),
        activeColor: Colors.blue,
        checkColor: Colors.white,
        selected: _value1,
        value: _value1,
        onChanged: (value) {
          setState(() {
            _value1 = value!;
          });
        },
      ),
    );
  }
}

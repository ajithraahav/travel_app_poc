import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelslide/pages/home_page.dart';
import 'package:travelslide/pages/saved_item_page.dart';
import 'package:travelslide/pages/serach_page.dart';
import 'package:travelslide/pages/settings_page.dart';
import 'package:travelslide/widgets/gradient_icon.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List pages = const [HomePage(), SearchPage(), SavedItemPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorShape: CircleBorder(
                        side: BorderSide(
                      strokeAlign: StrokeAlign.outside,
                      width: 7,
                      color: Colors.blue.withOpacity(0.2),
                    )),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          indicatorColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 15,
                            blurRadius: 40),
                      ],
                    ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: NavigationBar(
              backgroundColor: Colors.white,
              animationDuration: const Duration(seconds: 2),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 80,
              selectedIndex: currentIndex,
              onDestinationSelected: (int newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              destinations:  [
                NavigationDestination(
                  selectedIcon: GradientIcon(
                    bgSize: 40,
                    icon:Icons.home,
                    startColor: Color.fromARGB(255, 14, 71, 214),
                    endColor: Color.fromARGB(255, 160, 186, 253),
                    radius: 30,
                    iconColor: Colors.white,
                    size: 26,
                    ),
                  label: 'Home',
                  icon: Icon(Icons.home,color: Colors.black, size: 24,),
                ),
                NavigationDestination(
                  selectedIcon: GradientIcon(
                    bgSize: 40,
                    icon:Icons.search,
                    startColor: Color.fromARGB(255, 14, 71, 214),
                    endColor: Color.fromARGB(255, 160, 186, 253),
                    radius: 30,
                    iconColor: Colors.white,
                    size: 26,
                    ),
                  label: 'Search',
                  icon: Icon(Icons.search,color: Colors.black, size: 24,),
                ),
                NavigationDestination(
                  selectedIcon: GradientIcon(
                    bgSize: 40,
                    icon:Icons.bookmark,
                    startColor: Color.fromARGB(255, 14, 71, 214),
                    endColor: Color.fromARGB(255, 160, 186, 253),
                    radius: 30,
                    iconColor: Colors.white,
                    size: 26,
                    ),
                  label: 'Saved Items',
                  icon: Icon(Icons.bookmark_outline_rounded,color: Colors.black, size: 24,),
                ),
                NavigationDestination(
                  selectedIcon: GradientIcon(
                    bgSize: 40,
                    icon:Icons.settings,
                    startColor: Color.fromARGB(255, 14, 71, 214),
                    endColor: Color.fromARGB(255, 160, 186, 253),
                    radius: 30,
                    iconColor: Colors.white,
                    size: 26,
                    ),
                  label: 'Settings',
                  icon: Icon(Icons.settings,color: Colors.black, size: 24,),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}

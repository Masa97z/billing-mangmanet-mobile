import 'package:eebbiill/Screen/PaymentScreen.dart';
import 'package:eebbiill/Screen/ProfileScreen.dart';
import 'package:eebbiill/Screen/homeScreen.dart';
import 'package:eebbiill/constanats.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var data;

  var _index = 0;

  _selectIndex(int value) {
    setState(() {
      _index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currectWidget = HomeScreen();
    if (_index == 0) {
      currectWidget = HomeScreen();
    } else if (_index == 1) {
      currectWidget = PaymentScreen();
    } else if (_index == 2) {
      currectWidget = profileScreen();
    }

    return Scaffold(
      body: currectWidget,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: _selectIndex,
            selectedItemColor: btnColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(icon: Icon(Icons.money), label: "money"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "profile"),
            ],
          ),
        ),
      ),
    );
  }
}

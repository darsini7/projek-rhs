import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:rhs/history.dart';
import 'package:rhs/home.dart';
import 'package:rhs/ewallet.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  List<Widget> screens = [
    Home(),
    Ewallet(),

  ];

  void _onItemTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
             label: "Home",
             backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
             label: "History",
             backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
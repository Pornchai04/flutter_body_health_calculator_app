import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/abuot_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_app/views/bmr_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //สร้างตัวแปรควบคุม currentIndex ของ barItem ด่านล่าง
  int currentIndexStatus = 1;

  //สร้างตัวแปรเก็บ widget หน้าจอที่จะมาแสดงที่  body ของ Scaffold
  List<Widget> showBody = [
    //0
    BmiUi(),
    //1
    AbuotUi(),
    //2
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //กำหนด Bar ด้านบน
        backgroundColor: Color.fromARGB(255, 143, 70, 245),
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            //อันนี้มีต่อการแสดงผลหน้าจอใหม่
            currentIndexStatus = value;
          });
        },
        currentIndex: currentIndexStatus,
        selectedItemColor: Color.fromARGB(255, 143, 70, 245),
        items: [
          BottomNavigationBarItem(
            //กำหนดItemsในBarด้านล่าง
            icon: Icon(Icons.person_3),
            label: 'bmi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'bmr',
          ),
        ],
      ),
      body: showBody[currentIndexStatus],
    );
  }
}

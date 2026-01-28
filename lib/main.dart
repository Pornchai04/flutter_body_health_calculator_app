import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    //เรียกใฃ้งานคลาสที่เรียกใช้ widget หลักของแอป
    FlutterbodyHealthCalculatorApp(),
  );
}

//-----------------------------------
class FlutterbodyHealthCalculatorApp extends StatefulWidget {
  const FlutterbodyHealthCalculatorApp({super.key});

  @override
  State<FlutterbodyHealthCalculatorApp> createState() =>
      _FlutterbodyHealthCalculatorAppState();
}

class _FlutterbodyHealthCalculatorAppState
    extends State<FlutterbodyHealthCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //ซ่อนป้าย debug คาดสีแดง
      debugShowCheckedModeBanner: false,
      //กำหนดหน้าจอแรก
      home: SplashScreenUi(),
      //กำหนด Theme
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}

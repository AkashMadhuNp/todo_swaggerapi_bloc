import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_bloc_api/screen/home/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen(),)
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 1, 22, 40),
            //const Color.fromARGB(255, 48, 135, 206),
            Color.fromARGB(255, 53, 37, 196)
          ])
        ),
        child: Center(
          child: Lottie.asset(
            "asset/Animation - 1732454348412.json"
          ),
        ),
      ),
    );
  }
}
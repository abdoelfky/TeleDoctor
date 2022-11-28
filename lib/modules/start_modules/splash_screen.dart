import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teledoctor/shared/component/components.dart';
import 'package:teledoctor/shared/constants/constants.dart';
import '../admin_modules/home_layout_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;

  _startDelay(){
    _timer =Timer(const Duration(seconds:3),_getNext);
  }


  _getNext(){
    navigateAndEnd(context, HomeLayoutScreen());
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                color: Colors.white,
                image: AssetImage(
                  'images/loginLogo.png',

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.08,),
              LinearProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
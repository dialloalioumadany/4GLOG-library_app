import 'package:flutter/material.dart';
import 'package:library_app/pages/auth/login_page.dart';
import 'package:library_app/pages/home/home.dart';
import 'package:library_app/utils/shared_preference_service.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    var isConnected = await SharedPreferenceService.getValue("token");
    print("isConnected = ${isConnected}");
    Future.delayed(Duration(seconds: 5), () {
      if (isConnected == "") {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
      } else {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [Colors.green, Colors.yellow, Colors.red],
          strokeWidth: 4.0,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}

import 'package:cat_app/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
    goToHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "CatBreeds",
              style: GoogleFonts.coiny(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 48
                ),
              ),
            ),
            Lottie.asset("assets/cat_splash.json",)
          ],
        ),
      ),
    );
  }

  Future goToHome() async{
    Future.delayed(
        const Duration(seconds: 2),
    () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));
    });
  }
}

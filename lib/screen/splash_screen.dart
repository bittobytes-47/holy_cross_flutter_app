import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:holy_cross/screen/holy_cross_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HolyCrossScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF031D42), // Dark Blue
              Color(0xFF04528C), // Blue
              // Color(0xFF8B0000), // Dark Red
              // Color(0xFFFFD54F), // Yellow Gold
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: FadeInDown(
            duration: const Duration(milliseconds: 1200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // -------- APP LOGO --------
                Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.3),
                    //     blurRadius: 10,
                    //   )
                    // ],
                    image: const DecorationImage(
                      image: AssetImage("assets/NetUseLogo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // -------- APP NAME --------
                Container(
                  alignment: Alignment.center,
                  width: 230,
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1200),
                    child: const Text(
                      "HOLY CROSS MEDIA NETWORK    WELCOMES      YOU",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

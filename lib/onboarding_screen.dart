import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboard_animation/components/onboard_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      bottomSheet();
    });
  }

  Future<dynamic> bottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(42),
          topRight: Radius.circular(42),
        ),
      ),
      builder: (_) => const OnboardContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.88,
        child: Image.asset(
          "assets/bg.jpg",
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: bottomSheet,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 26),
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.4, 0.8],
              colors: [
                Color.fromARGB(255, 239, 104, 80),
                Color.fromARGB(255, 139, 33, 146)
              ],
            ),
          ),
          child: const Text(
            "Join Us",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

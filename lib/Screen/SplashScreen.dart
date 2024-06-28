import 'package:eebbiill/Screen/LoginScreen.dart';
import 'package:eebbiill/Screen/homeScreen.dart';
import 'package:eebbiill/constanats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Image(
              image: AssetImage("assets/image/img.png"),
              height: 264,
            ),
            SizedBox(height: defaultPadding * 2),
            Text("خلي فاتورتك بجيبك",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                )),
            Divider(
              color: Colors.white,
              indent: 128,
              endIndent: 128,
            ),
            Spacer(),
            Divider(
              color: Colors.white,
              indent: 136,
              endIndent: 136,
            ),
            SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}

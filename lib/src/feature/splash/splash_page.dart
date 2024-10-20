import 'package:flutter/material.dart';
import 'package:tezyetkazz/src/core/widgets/button_navigation_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(end: 1.0, begin: 0.1).animate(_controller);
    _controller.forward();
    stack();
    super.initState();
  }

  Future<void> stack() async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () async {
        // await box.get('email') == null
        //     ? context.go(AppRouteName.login)
        //     : context.go(AppRouteName.menu);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonNavigationBar(),
        //   ),
        // );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ButtonNavigationBar(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade600,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Stack(
            children: [
              // FadeTransition(
              //   opacity: _animation,
              //   child: SlideTransition(
              //     position: _animationIcons,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 10),
              //       child: Image.asset(
              //         "assets/images/img_2.png",
              //         width: 300,
              //       ),
              //     ),
              //   ),
              // ),
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  "assets/images/2024-07-21_09.16.45-removebg-preview.png",
                  width: 350,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

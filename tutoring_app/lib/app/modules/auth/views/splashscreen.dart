import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutoring_app/app/config/routes/name_router.dart';
import 'package:tutoring_app/app/core/extensions/context_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          height: context.screenHeight * 0.3,
          width: context.screenWidth * 0.3,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(MyNamedRoutes.register);
            },
            child: Text("Splash Screen"),
          ),
        ),
      ),
    );
  }
}

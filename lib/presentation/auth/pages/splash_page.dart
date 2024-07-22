import 'package:flutter/material.dart';
import 'package:sttal/core/core.dart';
import 'package:sttal/presentation/auth/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),
        () => context.pushReplacement(const LoginPage()));

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Assets.images.logoWhite.image(),
          ),
          const Spacer(),
          // Assets.images.logoCodeWithBahri.image(height: 70),
          // const SpaceHeight(20.0),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starter_app/themes/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.white.withOpacity(0.9),
        ),
        Center(
          child: Lottie.asset(
            AppAssets.lottieLoading,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

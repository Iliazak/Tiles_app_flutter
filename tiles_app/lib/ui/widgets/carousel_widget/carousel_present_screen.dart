import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../colors/app_colors.dart';
import '../text/app_text.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.size,
    required this.artboard,
    required this.text,
  });

  final Size size;
  final String artboard;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          height: size.height / 2,
          decoration: const BoxDecoration(
            color: AppColors.starkWhite,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: RiveAnimation.asset(
            "assets/rive_assets/onboarding.riv",
            artboard: artboard,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        AppText(
          text: text,
          color: const Color.fromARGB(255, 0, 0, 0),
          size: 18,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}

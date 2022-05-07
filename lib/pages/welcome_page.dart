import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:itravel/utils/app_colors.dart';
import 'package:itravel/widgets/app_text.dart';
import 'package:itravel/models/sliders.dart';
import 'package:itravel/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: welcomeCarousel(),
    );
  }
}

PageView welcomeCarousel() {
  return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sliders.length,
      itemBuilder: (_, index) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(sliders[index].sliderImage),
                fit: BoxFit.fill),
          ),
          child: carouselContent(index),
        );
      });
}

Container carouselContent(int index) {
  return Container(
    margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        slideDescription(index),
        slideNavigation(index),
      ],
    ),
  );
}

Column slideDescription(int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        text: sliders[index].title,
        color: AppColors.bigTextColor,
      ),
      AppText(
        text: sliders[index].subTitle,
        color: AppColors.textColor2,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 230,
        child: AppText(
          text: sliders[index].description,
          color: AppColors.textColor2,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}

Column slideNavigation(int index) {
  return Column(
    children: [
      pageIndicator(index),
      const SizedBox(
        height: 20,
      ),
      Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveButton(
                width: 110,
                title: "Next",
                onPressed: () => onNextClicked(),
              ),
              ResponsiveButton(
                width: 110,
                title: "Skip",
                color: AppColors.minColor.withOpacity(0.1),
                onPressed: () => onSkipClicked(),
              ),
            ],
          )),
    ],
  );
}

Row pageIndicator(int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      sliders.length,
      (dotIndex) => Container(
        margin: const EdgeInsets.only(bottom: 2),
        width: index == dotIndex ? 25 : 12,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: index == dotIndex
              ? AppColors.pageIndicatorColor
              : AppColors.minColor,
        ),
      ),
    ),
  );
}


onSkipClicked() {
}

onNextClicked() {

}
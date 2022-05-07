import 'package:flutter/material.dart';
import 'package:itravel/utils/app_colors.dart';
import 'package:itravel/utils/constants.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String title;
  final Color color;
  final Function()? onPressed;

  const ResponsiveButton({
    Key? key,
    this.width,
    this.isResponsive = false,
    this.title = "Continue",
    this.color = AppColors.mainColor,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: MaterialButton(
        minWidth: width,
        height: buttonHeight,
        child: Text(
            title,
            style: const TextStyle(color: AppColors.buttonTextColor1),
        ),
        onPressed: onPressed,
        )
    );
  }
}

import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final Color? iconColor;
  final BoxShape? boxShape;

  final Color? backgroundColor;

  const CustomIconButton({
    Key? key,
    required this.iconSize,
     this.boxShape,
    required this.icon,
    required this.onTap,
    required this.size,
    required this.iconColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: boxShape??BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

class RectangularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color? iconColor;
  final double? iconSize;
  final Color backgroundColor;
  final Color? borderColor;
  const RectangularIconButton({
    Key? key,
    this.iconSize,
    required this.icon,
    required this.onTap,
    required this.size,
    required this.iconColor,
    required this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(margin: EdgeInsets.zero,
        color: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor??backgroundColor),
          borderRadius: BorderRadius.circular(AppSizes.radius5),
        ),
        child: SizedBox(
          height: size,
          width: size,
          child: Center(
            child: Align(alignment:Alignment.center ,
              child: Icon(
                icon,
                color: iconColor,
                size:iconSize?? AppSizes.size30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

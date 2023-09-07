import 'package:flutter/material.dart';
import 'package:neumorphism_flutter/constants.dart';

class NeumorphicContainer extends StatelessWidget {
  final double borderRadius;
  final double shadowOffsetX;
  final double shadowOffsetY;
  final double blurRadius;
  final double spreadRadius;
  final Color backgroundColor;
  final bool solidView;
  final Widget child;

  const NeumorphicContainer({
    super.key,
    required this.borderRadius,
    required this.backgroundColor,
    required this.shadowOffsetX,
    required this.shadowOffsetY,
    required this.blurRadius,
    required this.spreadRadius,
    this.solidView = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(shadowOffsetX, shadowOffsetY),
                blurRadius: blurRadius,
                spreadRadius: spreadRadius,
                blurStyle: solidView ? BlurStyle.solid : BlurStyle.normal),
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              offset: Offset(-shadowOffsetX, -shadowOffsetY),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ]),
      child: child,
    );
  }
}

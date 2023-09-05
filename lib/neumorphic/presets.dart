import 'package:flutter/material.dart';
import 'package:neumorphism_flutter/constants.dart';
import 'package:neumorphism_flutter/neumorphic/neumorphic_container.dart';

Widget neumorphicNormalContainer(Widget child) {
  return NeumorphicContainer(
    backgroundColor: kBackgroundColor,
    borderRadius: 12,
    shadowOffsetX: 2,
    shadowOffsetY: 2,
    blurRadius: 3,
    spreadRadius: 1,
    child: child,
  );
}

Widget neumorphicPressedContainer(Widget child) {
  return NeumorphicContainer(
    backgroundColor: Color.fromARGB(0xff, 0xdc, 0xe7, 0xf1),
    borderRadius: 12,
    shadowOffsetX: -2,
    shadowOffsetY: -2,
    blurRadius: 3,
    spreadRadius: 1,
    child: child,
  );
}

Widget neumorphicCircularIndicator(Widget child) {
  return NeumorphicContainer(
    backgroundColor: kBackgroundColor,
    borderRadius: 360,
    shadowOffsetX: 4,
    shadowOffsetY: 4,
    blurRadius: 5,
    spreadRadius: 3,
    child: Container(
      margin: const EdgeInsets.all(20.0),
      child: NeumorphicContainer(
        backgroundColor: kBackgroundColor,
        borderRadius: 360,
        shadowOffsetX: -3,
        shadowOffsetY: -3,
        blurRadius: 5,
        spreadRadius: 3,
        solidView: false,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: NeumorphicContainer(
            backgroundColor: kBackgroundColor,
            borderRadius: 360,
            shadowOffsetX: 1,
            shadowOffsetY: 1,
            blurRadius: 5,
            spreadRadius: 3,
            child: child,
          ),
        ),
      ),
    ),
  );
}

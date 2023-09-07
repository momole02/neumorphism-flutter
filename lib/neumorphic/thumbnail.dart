import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_flutter/constants.dart';
import 'package:neumorphism_flutter/neumorphic/presets.dart';

class NeumorphicThumbnail extends StatelessWidget {
  final IconData icon;
  final String legend;
  final String value;
  final String unit;
  final double? unitSize;

  const NeumorphicThumbnail({
    super.key,
    required this.icon,
    required this.legend,
    required this.value,
    required this.unit,
    this.unitSize,
  });

  @override
  Widget build(BuildContext context) {
    return neumorphicNormalContainer(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              neumorphicNormalContainer(
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    icon,
                    color: kGrayedBlueColor,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                legend,
                style: GoogleFonts.notoSans(
                  color: kGrayedBlueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          DefaultTextStyle(
            style: GoogleFonts.notoSans(
              color: kDarkBlueColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(value),
                unitSize != null
                    ? Text(
                        unit,
                        style: TextStyle(
                          fontSize: unitSize,
                        ),
                      )
                    : Text(unit)
              ],
            ),
          )
        ],
      ),
    ));
  }
}

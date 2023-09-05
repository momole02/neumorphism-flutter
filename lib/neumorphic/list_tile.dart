import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_flutter/constants.dart';
import 'package:neumorphism_flutter/neumorphic/presets.dart';

class NeumorphicListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String legend;

  const NeumorphicListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.legend,
  });

  @override
  Widget build(BuildContext context) {
    return neumorphicNormalContainer(Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          neumorphicNormalContainer(
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                color: kGrayedBlueColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                      color: kBlueColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  legend,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kGrayedBlueColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

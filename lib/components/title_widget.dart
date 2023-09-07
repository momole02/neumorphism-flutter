import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_flutter/constants.dart';

class TitleWidget extends StatelessWidget {
  final String littleTitle;
  final String bigTitle;
  const TitleWidget({
    super.key,
    required this.littleTitle,
    required this.bigTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          littleTitle,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w900,
            color: kGrayedBlueColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          bigTitle,
          style: GoogleFonts.notoSans(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: kDarkBlueColor,
          ),
        )
      ],
    );
  }
}

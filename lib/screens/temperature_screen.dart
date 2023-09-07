import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_flutter/charts/default_spline_chart.dart';
import 'package:neumorphism_flutter/components/title_widget.dart';
import 'package:neumorphism_flutter/constants.dart';
import 'package:neumorphism_flutter/neumorphic/presets.dart';
import 'package:neumorphism_flutter/neumorphic/thumbnail.dart';

const double kThumbnailSize = 120;

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  late List<String> periods;
  late String selectedPeriod;

  @override
  void initState() {
    super.initState();
    periods = ["Today", "Week", "Month"];
    selectedPeriod = periods[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: DefaultTextStyle(
          style: GoogleFonts.notoSans(),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TitleWidget(
                    littleTitle: "Good Morning,",
                    bigTitle: "Marc-Arnaud",
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30 + kThumbnailSize,
                    child: CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate.fixed(
                            [
                              _buildThumbnail(
                                  Icons.water_drop, "Humidity", "65", " %"),
                              _buildThumbnail(Icons.electric_bolt,
                                  "Electricity", "265", " Kwh", 10),
                              _buildThumbnail(Icons.thermostat, "Temperature",
                                  "16", " °C", 15),
                              _buildThumbnail(
                                  Icons.wifi, "Internet", "120", " Mbps", 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Row(children: [
                    Text(
                      "Temperature",
                      style: GoogleFonts.notoSans(
                        color: kDarkBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " analytics",
                      style: GoogleFonts.notoSans(
                        color: kGrayedBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: neumorphicNormalContainer(
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          _buildPeriodRow(),
                          const SplineDefault(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodRow() {
    return Row(
      children: periods
          .map((period) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPeriod = period;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 15),
                    child: selectedPeriod == period
                        ? neumorphicPressedContainer(Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5),
                            child: Text(
                              period,
                              style: GoogleFonts.notoSans(
                                color: kDarkBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ))
                        : neumorphicNormalContainer(
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5),
                              child: Text(period,
                                  style: GoogleFonts.notoSans(
                                    color: kGrayedBlueColor,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          )),
              ))
          .toList(),
    );
  }

  Widget _buildThumbnail(
      IconData icon, String legend, String value, String unit,
      [double? unitSize]) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10, top: 5, bottom: 5),
      child: SizedBox(
        width: kThumbnailSize,
        child: NeumorphicThumbnail(
          icon: icon,
          legend: legend,
          value: value,
          unit: unit,
          unitSize: unitSize,
        ),
      ),
    );
  }
}

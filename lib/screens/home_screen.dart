import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphism_flutter/components/title_widget.dart';
import 'package:neumorphism_flutter/constants.dart';
import 'package:neumorphism_flutter/neumorphic/list_tile.dart';
import 'package:neumorphism_flutter/neumorphic/container.dart';
import 'package:neumorphism_flutter/neumorphic/presets.dart';
import 'package:neumorphism_flutter/screens/model/home_item.dart';
import 'package:neumorphism_flutter/screens/temperature_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeItem> homeItems = [];
  bool onOff = false;

  @override
  void initState() {
    super.initState();
    homeItems = [
      HomeItem(icon: Icons.thunderstorm, enabled: false),
      HomeItem(icon: Icons.umbrella, enabled: false),
      HomeItem(icon: Icons.remove_red_eye, enabled: false),
      HomeItem(icon: Icons.wifi, enabled: false),
      HomeItem(icon: Icons.add, enabled: false),
    ];
  }

  void _goToTemperatureScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TemperatureScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0xff, 0xe0, 0xec, 0xf7),
      body: SafeArea(
        child: DefaultTextStyle(
          style: GoogleFonts.notoSans(),
          child: Container(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildTitlePanel(),
              _buildDevicesListPanel(),
              GestureDetector(
                onTap: _goToTemperatureScreen,
                child: _buildTemperatureIndicator(),
              ),
              _buildHumidityAndInternetIndicators(),
              const Spacer(),
              _buildBottomPanel(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildTitlePanel() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: TitleWidget(
        littleTitle: "Hello!",
        bigTitle: "My Home",
      ),
    );
  }

  Widget _buildDevicesListPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: homeItems
            .map(
              (item) => GestureDetector(
                onTap: () => {
                  setState(() {
                    item.enabled = !item.enabled;
                  })
                },
                child: item.enabled == false
                    ? neumorphicNormalContainer(
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            item.icon,
                            color: kGrayedBlueColor.withOpacity(0.5),
                          ),
                        ),
                      )
                    : neumorphicPressedContainer(
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            item.icon,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildTemperatureIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Center(
        child: neumorphicCircularIndicator(Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "16",
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 45,
                          color: kBlueColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "°C",
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kBlueColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.snowing,
                    color: kBlueColor,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Cooling",
                    style: TextStyle(
                        color: kBlueColor, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildHumidityAndInternetIndicators() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: NeumorphicListTile(
              icon: Icons.water_drop,
              title: "Humidity",
              legend: "65 %",
            ),
          ),
          NeumorphicListTile(
            icon: Icons.wifi,
            title: "Internet",
            legend: "120 Mbps",
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current temperature: ",
                style: GoogleFonts.notoSans(
                  color: kBlueColor,
                  fontSize: 18,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "16",
                    style: GoogleFonts.notoSans(
                      color: kBlueColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "°C",
                      style: GoogleFonts.notoSans(
                        color: kBlueColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                "On/off: ",
                style: GoogleFonts.notoSans(
                  color: kBlueColor,
                  fontSize: 18,
                ),
              ),
              Switch(
                value: onOff,
                onChanged: (value) {
                  setState(() {
                    onOff = value;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

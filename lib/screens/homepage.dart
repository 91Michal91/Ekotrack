import 'dart:ui';

import 'package:ekotrack/components/custom_app_bar.dart';
import 'package:ekotrack/main.dart';
import 'package:ekotrack/models/carbon_footprint.dart';
import 'package:ekotrack/screens/calculator.dart';
import 'package:ekotrack/service/shared_preferences_service.dart';
import 'package:ekotrack/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  final CarbonFootprintResult? carbonFootprint;
  const Homepage({super.key, this.carbonFootprint});

  CarbonFootprintResult getCarbonFootprint() {
    // TODO: either gets it from the [carbonFootprint] field or from somewhere
    // in the db
    return carbonFootprint ??
        CarbonFootprintResult(
          score: SharedPreferenceService.carbonFootprintResult,
        );
  }

  @override
  Widget build(BuildContext context) {
    // double kScreenWidth = MediaQuery.of(context).size.width / 1.7;
    double kScreenWidth = 240.0;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Your Footprint",
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Row(
              children: [Expanded(child: Container())],
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Expanded(
                child: Icon(
                  FontAwesomeIcons.earthEurope,
                  color: kDarkGreen,
                  size: 105,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    "The result of calculating your carbon footprint is:",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "${getCarbonFootprint().score.toStringAsFixed(2)} kg/day",
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    getCarbonFootprint().isAvg()
                        ? "You are in the Indian average, try to lower your consumption!"
                        : "You are below the Indian average!",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _createFootprintIndicator(
                    kScreenWidth,
                    SharedPreferenceService.kmAutoNormalized,
                    FontAwesomeIcons.car,
                    "Auto",
                  ),
                  _createFootprintIndicator(
                    kScreenWidth,
                    SharedPreferenceService.kmMezziNormalized,
                    FontAwesomeIcons.bus,
                    "Means",
                  ),
                  _createFootprintIndicator(
                    kScreenWidth,
                    SharedPreferenceService.kwhCasaNormalized,
                    FontAwesomeIcons.house,
                    "House",
                  ),
                  _createFootprintIndicator(
                    kScreenWidth,
                    SharedPreferenceService.oreAereoNormalized,
                    FontAwesomeIcons.plane,
                    "Airplane",
                  ),
                  _createFootprintIndicator(
                    kScreenWidth,
                    SharedPreferenceService.oreUsoTabletNormalized,
                    FontAwesomeIcons.phone,
                    "Phone",
                  ),
                  MaterialButton(
                    onPressed: () {
                      navigatorKey.currentState?.pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const Calculator(back: true),
                        ),
                      );
                    },
                    color: kLightGreen4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Recalculate",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                title: Column(
                                  children: [
                                    Text(
                                      "Tips to reduce your CO2 emissions:",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w100,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      "► Use public transports.",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w100,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "► Use renewable energy sources.",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w100,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "► Reduce, reuse, recycle.",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w100,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "► Plant and maintain trees.",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w100,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Text(
                                    //   "► Use your car less",
                                    //   style: GoogleFonts.aBeeZee(
                                    //     fontWeight: FontWeight.w100,
                                    //     color: kDarkGreen,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "► Go for renewable energy.",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w100,
                                        color: kDarkGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    color: kLightGreen4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Remove your CO2 emissions",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createFootprintIndicator(
    double kScreenWidth,
    double value,
    IconData icon,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            icon,
            color: kDarkGreen,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8),
          ),
          SizedBox(
            width: 75,
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: kScreenWidth,
              height: 25,
              decoration: _containerDec(kLightGreen4),
              child: Row(
                children: [
                  Container(
                    width: (kScreenWidth / 5) * value,
                    decoration: _containerDec(kDarkGreen),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _containerDec(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    );
  }
}

import 'package:ekotrack/components/custom_app_bar.dart';
import 'package:ekotrack/constants/fun_facts.dart';
import 'package:ekotrack/extensions/random_item_list.dart';
import 'package:ekotrack/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class FunFact extends StatefulWidget {
  const FunFact({super.key});

  @override
  State<FunFact> createState() => _FunFactState();
}

class _FunFactState extends State<FunFact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(),
      appBar: AppBar(
        title: Text(
          "Challenges and Quizzes",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: kDarkGreen,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "Challenges and Quizzes",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              // ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  color: kLightGreen4,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => setState(() {}),
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        // child: const Icon(
                        //   Icons.push_pin_rounded,
                        //   color: kDarkGreen,
                        //   size: 35,
                        // ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                    ),
                    Text(
                      "Challenge No. 1",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                    ),
                    Text(
                      kFunFacts.random(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final url = Uri.parse('https://www.conservation.org/quizzes/carbon-footprint-quiz');
                          _launchUrl(url);
                        },
                        child: const Text("Participate Now"))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  color: kLightGreen4,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => setState(() {}),
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: const Icon(
                          Icons.push_pin_rounded,
                          color: kDarkGreen,
                          size: 35,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                    ),
                    Text(
                      "Challenge No. 2",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                    ),
                    Text(
                      kFunFacts.random(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final url = Uri.parse('https://www.conservation.org/quizzes/carbon-footprint-quiz');
                          _launchUrl(url);
                        },
                        child: const Text("Participate Now"))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  color: kLightGreen4,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => setState(() {}),
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: const Icon(
                          Icons.push_pin_rounded,
                          color: kDarkGreen,
                          size: 35,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                    ),
                    Text(
                      "Challenge No. 3",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                    ),
                    Text(
                      kFunFacts.random(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final url = Uri.parse('https://www.conservation.org/quizzes/carbon-footprint-quiz');
                          _launchUrl(url);
                        },
                        child: const Text("Participate Now"))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  color: kLightGreen4,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => setState(() {}),
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: const Icon(
                          Icons.push_pin_rounded,
                          color: kDarkGreen,
                          size: 35,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                    ),
                    Text(
                      "Challenge No. 4",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                    ),
                    Text(
                      kFunFacts.random(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: kDarkGreen,
                        fontSize: 26,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final url = Uri.parse('https://www.conservation.org/quizzes/carbon-footprint-quiz');
                          _launchUrl(url);
                        },
                        child: const Text("Participate Now"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

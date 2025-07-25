import 'package:ekotrack/components/custom_slider.dart';
import 'package:ekotrack/main.dart';
import 'package:ekotrack/service/shared_preferences_service.dart';
import 'package:ekotrack/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Calculator extends StatefulWidget {
  final bool back;
  const Calculator({super.key, this.back = false});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double? kmAuto;
  double? kmMezzi;
  double? oreAereo;
  double? kwhCasa;
  double? oreUsoTablet;

  final PageController _pageController = PageController();

  Widget _buildNextButton() {
    return MaterialButton(
      color: kLightGreen4.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      onPressed: () {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Next",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildPrevButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () => _pageController.previousPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: kDarkGreen,
            ),
            Text(
              "Backwards",
              style: GoogleFonts.montserrat(
                color: kDarkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinishButton() {
    return MaterialButton(
      color: kLightGreen4.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      onPressed: () {
        double kmAutoMultiplied = (kmAuto ?? 0) * 20;
        double kmMezziMultiplied = (kmMezzi ?? 0) * 0.8;
        double oreAereoMultipied = (oreAereo ?? 0) * 35;
        double kwhCasaMultiplied = (kwhCasa ?? 0) * 15;
        double oreUsoTabletMultiplied = (oreUsoTablet ?? 0) * 1;

        double result = kmAutoMultiplied +
            kmMezziMultiplied +
            oreAereoMultipied +
            kwhCasaMultiplied +
            oreUsoTabletMultiplied;

        double normalizedResult = (result / 14184) * 5;

        SharedPreferenceService.firstTimeOpeningApp = false;

        SharedPreferenceService.carbonFootprintResult = normalizedResult;
        SharedPreferenceService.kmAutoNormalized = ((kmAuto ?? 0) / 200) * 5;
        SharedPreferenceService.kmMezziNormalized = ((kmMezzi ?? 0) / 200) * 5;
        SharedPreferenceService.oreAereoNormalized =
            ((oreAereo ?? 0) / 200) * 5;
        SharedPreferenceService.kwhCasaNormalized = ((kwhCasa ?? 0) / 200) * 5;
        SharedPreferenceService.oreUsoTabletNormalized =
            ((oreUsoTablet ?? 0) / 24) * 5;

        Navigator.of(context).pushNamed("h");
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Calculate",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double kSystemSpaceAround = 200;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: size.width,
        // height: size.height - _kSystemSpaceAround,
        height: 730,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.all(60),
              child: Icon(
                Icons.wallet_travel_outlined,
                color: kDarkGreen,
                size: 45,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How many kilometers do you travel with your car on average per day?",
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomSlider(
              padding: const EdgeInsets.symmetric(vertical: 16),
              max: 200,
              initialValue: kmAuto,
              onChange: (v) => setState(() => kmAuto = v),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "And with public transport?",
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomSlider(
              padding: const EdgeInsets.symmetric(vertical: 16),
              max: 200,
              initialValue: kmMezzi,
              onChange: (v) => setState(() => kmMezzi = v),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How many hours do you spend on a plane per year? (about)",
                style: GoogleFonts.montserrat(
                  color: kDarkGreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomSlider(
              padding: const EdgeInsets.symmetric(vertical: 16),
              max: 200,
              initialValue: oreAereo,
              onChange: (v) => setState(() => oreAereo = v),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildNextButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildPrevButton(),
        const Padding(
          padding: EdgeInsets.all(60),
          child: Icon(
            Icons.house,
            color: kDarkGreen,
            size: 45,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "What is the average daily electricity consumption in your home (in kilowatt-hours)?",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomSlider(
          padding: const EdgeInsets.symmetric(vertical: 16),
          max: 200,
          initialValue: kwhCasa,
          onChange: (v) => setState(() => kwhCasa = v),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: _buildNextButton(),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 32),
        ),
      ],
    );
  }

  Widget _buildThirdPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildPrevButton(),
        const Padding(
          padding: EdgeInsets.all(60),
          child: Icon(
            Icons.smartphone,
            color: kDarkGreen,
            size: 45,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "How much time do you spend using electronic devices (computer, smartphone, tablet) every day?",
            style: GoogleFonts.montserrat(
              color: kDarkGreen,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomSlider(
          padding: const EdgeInsets.symmetric(vertical: 16),
          round: false,
          steps: 48,
          max: 24,
          initialValue: oreUsoTablet,
          onChange: (v) => setState(() => oreUsoTablet = v),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: _buildFinishButton(),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 32),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.back
            ? InkWell(
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: kDarkGreen,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("h");
                },
              )
            : Container(),
        centerTitle: false,
        title: Text(
          "CarbonSense Calculator",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PageView(
          controller: _pageController,
          children: [
            _buildFirstPage(context),
            _buildSecondPage(),
            _buildThirdPage(),
          ],
        ),
      ),
    );
  }
}
